//
//  SelectionTableViewCell.swift
//  RealWorld
//
//  Created by SAT PAL on 11/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit

class SelectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var data_label: UILabel!
    
    @IBOutlet weak var checkBox_btn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
