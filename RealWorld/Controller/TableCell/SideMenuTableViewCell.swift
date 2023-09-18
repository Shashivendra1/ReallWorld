//
//  SideMenuTableViewCell.swift
//  RealWorld
//
//  Created by SAT PAL on 03/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var listIcon_imageView: UIImageView!
    
    @IBOutlet weak var list_label: UILabel!
    
    
    @IBOutlet weak var bannernew_image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
