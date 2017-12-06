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
        apps = dictionary["apps"] as! [App]
        type = dictionary["type"] as? String
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
                
                    if dict.index(forKey: "apps") != nil {
                        
                    }
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
    
//    static func sampleAppCategories() -> [AppCategory] {
//        let bestNewAppsCategory = AppCategory()
//        bestNewAppsCategory.name = "Best New Apps"
//
//        var bestNewApps = [App]()
//
//        let instaApp = App()
//        instaApp.name = "Instagram"
//        instaApp.imageName = "insta"
//        instaApp.category = "Entertainment"
//        instaApp.price = 3.99
//
//        bestNewApps.append(instaApp)
//        bestNewAppsCategory.apps = bestNewApps
//
//        let bestNewGamesCategory = AppCategory()
//        bestNewGamesCategory.name = "Best New Games"
//
//        var bestNewGameApps = [App]()
//
//        let facebookApp = App()
//        facebookApp.name = "Facebook"
//        facebookApp.imageName = "facebook"
//        facebookApp.category = "Games"
//        facebookApp.price = 2.99
//
//        bestNewGameApps.append(facebookApp)
//        bestNewGamesCategory.apps = bestNewGameApps
//
//        return [bestNewAppsCategory, bestNewGamesCategory]
//    }
}
