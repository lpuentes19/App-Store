//
//  AppCategoryTableViewCell.swift
//  AppStore
//
//  Created by Luis Puentes on 12/4/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class AppCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var appsCategoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
