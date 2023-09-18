//
//  FilterTableViewCell.swift
//  RealWorld
//
//  Created by SAT PAL on 24/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit

class FilterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var icon_imageView: UIImageView!
    
    @IBOutlet weak var filter_label: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
