//
//  CommentTableViewCell.swift
//  RealWorld
//
//  Created by SAT PAL on 08/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var date_label: UILabel!
    
    @IBOutlet weak var comment_label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
  
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
