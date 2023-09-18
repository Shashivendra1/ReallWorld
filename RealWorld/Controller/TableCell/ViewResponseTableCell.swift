//
//  ViewResponseTableCell.swift
//  RealWorld
//
//  Created by Gurinder Singh on 18/12/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit

class ViewResponseTableCell: UITableViewCell {

    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblMobile: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
