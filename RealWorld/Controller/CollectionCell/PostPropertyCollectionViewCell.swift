//
//  PostPropertyCollectionViewCell.swift
//  RealWorld
//
//  Created by SAT PAL on 09/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit

class PostPropertyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var upload_imageView: UIImageView!
    
    @IBOutlet weak var container_view: UIView!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    override func awakeFromNib() {
        deleteButton.layer.borderColor = UIColor.red.cgColor
        deleteButton.layer.borderWidth = 0.8
        deleteButton.layer.cornerRadius = deleteButton.frame.height / 2
    }
    
}
