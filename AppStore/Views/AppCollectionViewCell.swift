//
//  AppCollectionViewCell.swift
//  AppStore
//
//  Created by Luis Puentes on 12/4/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class AppCollectionViewCell: UICollectionViewCell {
    
    var app: App? {
        didSet {
            if let title = app?.name {
                titleLabel.text = title
            } else {
                titleLabel?.removeFromSuperview()
            }
            if let category = app?.category {
                categoryLabel.text = category
            } else {
                categoryLabel?.removeFromSuperview()
            }
            if let price = app?.price {
                priceLabel.text = "$\(price)"
            } else {
                priceLabel.text = " "
            }
            if let imageName = app?.imageName {
                appImageView.image = UIImage(named: imageName)
            }
        }
    }
    
    func setupImage() {
        // App Image
        appImageView.layer.cornerRadius = 16
        appImageView.layer.masksToBounds = true
        appImageView.frame = CGRect(x: 0, y: 0, width: 125, height: 98)
    }
    
    @IBOutlet weak var appImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
}
