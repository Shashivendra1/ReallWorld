//
//  PostYourPreferencesViewController.swift
//  RealWorld
//
//  Created by SAT PAL on 03/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit

class PostYourPreferencesViewController: UIViewController {
    
    
    @IBOutlet weak var imageContainer_view: UIView!
    
    @IBOutlet weak var profile_imageView: UIImageView!
    
    @IBOutlet weak var container_view: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
         self.addNavigationBar(leftBar: .Back, titleType: .Normal, title: "POST YOUR PREFERENCE", bgColor: .navigationColor(), barTintColor:.navigationColor(), right: .None, center_type: .None, titleColor: .white)
    }
    
    override func viewWillLayoutSubviews() {
        
        container_view.layer.cornerRadius = 10
        
        imageContainer_view.layer.cornerRadius = imageContainer_view.frame.height / 2
        
       
    }
    
    //MARK:- Button ACtion
    
    @IBAction func tap_postResidentialProperty_btn(_ sender: Any) {
        
        
              let vc = self.storyboard?.instantiateViewController(withIdentifier: "PostPropertyViewController") as! PostPropertyViewController
        vc.postvaluepropertychk = "Residential"
              
              self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tap_postCommercialProperty_btn(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "postpropertycommericalvc") as! postpropertycommericalvc
                    
                    self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tap_postTenantRequirement_btn(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PostRequirementViewController") as! PostRequirementViewController
        
        vc.isComeFromTenant = true
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tap_postBuyerRequirement_btn(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PostRequirementViewController") as! PostRequirementViewController
        
        vc.isComeFromTenant = false
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
