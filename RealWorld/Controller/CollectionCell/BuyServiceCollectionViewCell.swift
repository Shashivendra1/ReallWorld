//
//  BuyServiceCollectionViewCell.swift
//  ReallWorld
//
//  Created by shashivendra sengar on 21/08/22.
//  Copyright © 2022 ArthTech Solutions. All rights reserved.
//

import UIKit

class BuyServiceCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var buyBtn: UIButton!
    @IBOutlet weak var lblPrice: UILabel!
    
    override func awakeFromNib() {
        buyBtn.layer.cornerRadius = 10
    }

}
