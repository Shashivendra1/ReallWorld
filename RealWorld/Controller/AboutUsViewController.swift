//
//  AboutUsViewController.swift
//  RealWorld
//
//  Created by SAT PAL on 03/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  
    @IBAction func back_btn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false

        self.navigationController?.navigationBar.backgroundColor = .purple
        self.addNavigationBar(leftBar: .Back, titleType: .Normal, title: "About Us", bgColor: .clear, barTintColor: UIColor.black, right: .None, center_type: .None, titleColor: .white)
        
    }
   
//    override func viewWillDisappear(_ animated: Bool) {
//        self.navigationController?.isNavigationBarHidden = true
//
//    }
//
    
    @IBAction func tap_aboutUs_btn(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailPageViewController") as! DetailPageViewController
        
        vc.detailOf = .aboutUs
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tap_termAndCondition_btn(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailPageViewController") as! DetailPageViewController
        
         vc.detailOf = .termCondition
               
               self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func tap_privacyPolicy_btn(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailPageViewController") as! DetailPageViewController
        
        vc.detailOf = .privacyPolicy
               
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
