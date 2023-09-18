//
//  NavigationViewController.swift
//  WCTS-Trainer
//
//  Created by Apple on 30/09/19.
//  Copyright © 2019 Promatics. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = true
    }
    


}
