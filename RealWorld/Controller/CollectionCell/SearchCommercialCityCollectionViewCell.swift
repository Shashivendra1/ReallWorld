//
//  SearchCommercialCityCollectionViewCell.swift
//  ReallWorld
//
//  Created by shashivendra sengar on 15/10/22.
//  Copyright © 2022 ArthTech Solutions. All rights reserved.
//

import UIKit

class SearchCommercialCityCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var delete_btn: UIButton!
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        mainView.layer.cornerRadius = 5

    }
}
