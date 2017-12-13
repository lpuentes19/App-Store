//
//  AppCategoryTableViewController.swift
//  AppStore
//
//  Created by Luis Puentes on 12/4/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class AppCategoryTableViewController: UITableViewController {
    
    var appCategories: [AppCategory]?
    var app: AppCollectionViewCell?
    //let largeCellID = "largeCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // appCategories = AppCategory.sampleAppCategories()
        AppCategory.fetchFeaturedApps { (appCategories) in
            self.appCategories = appCategories
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appCategories?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "appCategoryCell", for: indexPath) as! AppCategoryTableViewCell
        
        cell.appCategory = appCategories?[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 2 {
            return tableView.rowHeight + 140
            if let image = app?.appImageView.image {
                
            }
        }
        return tableView.rowHeight + 200
    }
}
//class LargeCategoryCell: AppCategoryTableViewCell {
//
//    fileprivate let largeAppCellID = "largeAppCellID"
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        collectionView.register(LargeAppCell.self, forCellWithReuseIdentifier: largeAppCellID)
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeAppCellID, for: indexPath) as! AppCollectionViewCell
//
//        cell.app = appCategory?.apps[indexPath.item]
//
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 200, height: frame.height - 32)
//    }
//
//    fileprivate class LargeAppCell: AppCollectionViewCell {
//
//    }
//}

