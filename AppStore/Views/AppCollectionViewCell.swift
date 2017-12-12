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
            }
            categoryLabel.text = app?.category
            
            if let price = app?.price {
                priceLabel.text = "$\(price)"
            } else {
                priceLabel.text = ""
            }
            if let imageName = app?.imageName {
                appImageView.image = UIImage(named: imageName)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        appImageView.layer.cornerRadius = 16
        appImageView.layer.masksToBounds = true
    }
    
    @IBOutlet weak var appImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
}
