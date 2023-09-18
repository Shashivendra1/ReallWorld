//
//  CityPopUpTableViewCell.swift
//  ReallWorld
//
//  Created by shashivendra sengar on 11/10/22.
//  Copyright © 2022 ArthTech Solutions. All rights reserved.
//

import UIKit

class CityPopUpTableViewCell: UITableViewCell {

    @IBOutlet weak var btnSelected: UIButton!
    @IBOutlet weak var imgCheckMark: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
