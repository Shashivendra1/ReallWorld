//
//  BaseViewController.swift
//  RealWorld
//
//  Created by SAT PAL on 13/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func presentAlert(msg : String) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
        
        
        vc.msg =  "  " + msg + "  "
        vc.delegate = self
        
        self.present(vc, animated: false, completion: nil)
        
    }
    
    func presentYesNoAlert(msg : String) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
        
        
        vc.msg =  "  " + msg + "  "
        vc.delegate = self
        vc.yes = true
        
        self.present(vc, animated: false, completion: nil)
        
    }
    
    
    func dismissAlert() {
        
        print("dismiss alert called")
    }
    
    
    func dismissAlertWithYes() {
        
        print("dismiss alert with yes called")
        
    }
    
    
}
extension BaseViewController : DismissAlertDelegate {
    
    func tapYesButton() {
        
        self.dismissAlertWithYes()
    }
    
    
    func tapNoButton() {
        
        self.dismissAlert()
    }
    
}
