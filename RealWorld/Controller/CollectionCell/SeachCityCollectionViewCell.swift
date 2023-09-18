//
//  SeachCityCollectionViewCell.swift
//  ReallWorld
//
//  Created by shashivendra sengar on 15/10/22.
//  Copyright © 2022 ArthTech Solutions. All rights reserved.
//

import UIKit

class SeachCityCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var delete_btn: UIButton!
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        mainView.layer.cornerRadius = 5
//        labelName.layer.cornerRadius = 2
//        labelName.layer.borderWidth = 1
//        labelName.layer.borderColor = UIColor.gray.cgColor
    }
    
}
