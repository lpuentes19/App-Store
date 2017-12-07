//
//  AppCategory.swift
//  AppStore
//
//  Created by Luis Puentes on 12/4/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class AppCategory {
    
    var name: String?
    var apps = [App]()
    var type: String?
    
    init(dictionary: [String: Any]) {
        name = dictionary["name"] as? String
        let app = dictionary["apps"] as! [[String: Any]]
        type = dictionary["type"] as? String
        
        apps = app.flatMap( {App(dictionary: $0) } )
    }
    
    static func fetchFeaturedApps(completion: @escaping ([AppCategory]) -> Void) {
        guard let url = URL(string: "https://api.letsbuildthatapp.com/appstore/featured") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            guard let data = data else { return }
        
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
                
                var appCategories = [AppCategory]()

                for dict in json["categories"] as! [[String: Any]] {
                    let appCategory = AppCategory(dictionary: dict)
                    appCategories.append(appCategory)
                    
                }
                
                print(appCategories)
                DispatchQueue.main.async {
                    completion(appCategories)
                }

            } catch {
                print("Error in JSON Serialization")
            }
        }.resume()
    }
}
