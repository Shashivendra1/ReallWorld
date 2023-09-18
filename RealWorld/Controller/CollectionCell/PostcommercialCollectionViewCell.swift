//
//  PostcommercialCollectionViewCell.swift
//  ReallWorld
//
//  Created by shashivendra sengar on 22/08/22.
//  Copyright © 2022 ArthTech Solutions. All rights reserved.
//

import UIKit

class PostcommercialCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var container_view: UIView!
    
    @IBOutlet weak var imgUploadImage: UIImageView!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func awakeFromNib() {
        deleteButton.layer.borderColor = UIColor.red.cgColor
        deleteButton.layer.borderWidth = 0.8
        deleteButton.layer.cornerRadius = deleteButton.frame.height / 2
    }
}
