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
    var apps: [App]?
    
    static func sampleAppCategories() -> [AppCategory] {
        let bestNewAppsCategory = AppCategory()
        bestNewAppsCategory.name = "Best New Apps"
        
        var bestNewApps = [App]()
        
        let instaApp = App()
        instaApp.title = "Instagram"
        instaApp.appImage = "insta"
        instaApp.category = "Entertainment"
        instaApp.price = 3.99
        
        bestNewApps.append(instaApp)
        bestNewAppsCategory.apps = bestNewApps
        
        let bestNewGamesCategory = AppCategory()
        bestNewGamesCategory.name = "Best New Games"
        
        var bestNewGameApps = [App]()
        
        let facebookApp = App()
        facebookApp.title = "Facebook"
        facebookApp.appImage = "facebook"
        facebookApp.category = "Games"
        facebookApp.price = 2.99
        
        bestNewGameApps.append(facebookApp)
        bestNewGamesCategory.apps = bestNewGameApps
        
        return [bestNewAppsCategory, bestNewGamesCategory]
    }
}
