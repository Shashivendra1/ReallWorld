//
//  PostRequirementViewController.swift
//  RealWorld
//
//  Created by SAT PAL on 05/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit

class PostRequirementViewController: BaseViewController
{
    @IBOutlet weak var name_view: UIView!
    @IBOutlet weak var mobile_view: UIView!
    @IBOutlet weak var email_view: UIView!
    @IBOutlet weak var location_view: UIView!
    @IBOutlet weak var budget_view: UIView!
    @IBOutlet weak var requirement_view: UIView!
    @IBOutlet weak var name_textfield: UITextField!
    @IBOutlet weak var mobile_textfield: UITextField!
    @IBOutlet weak var email_textfield: UITextField!
    @IBOutlet weak var location_textfield: UITextField!
    @IBOutlet weak var budget_textfield: UITextField!
    @IBOutlet weak var requirement_textfield: UITextView!
    @IBOutlet weak var residentialLine_view: UIView!
    @IBOutlet weak var commercialLine_view: UIView!
    @IBOutlet weak var imageContainer_view: UIView!
    @IBOutlet weak var container_view: UIView!
    @IBOutlet weak var sendQuery_btn: UIButton!
    
    var type = "residential"
    var PassValue = ""
    var isComeFromTenant = true
    override func viewDidLoad()
    {
        super.viewDidLoad()
       name_textfield.text = Singleton.sharedInstance.loginModel?.first?.data?.name ?? ""
        mobile_textfield.text = Singleton.sharedInstance.loginModel?.first?.data?.mobile ?? ""
        email_textfield.text = Singleton.sharedInstance.loginModel?.first?.data?.email ?? ""
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.addNavigationBar(leftBar: .Back, titleType: .Normal, title: "Post Tenant Requirement", bgColor: .clear, barTintColor: UIColor.purple, right: .None, center_type: .None, titleColor: .white)
            
    }
    
    override func viewWillLayoutSubviews()
    {
        sendQuery_btn.layer.cornerRadius = 8
        container_view.layer.cornerRadius = 16
        imageContainer_view.layer.cornerRadius = imageContainer_view.frame.height / 2
        requirement_view.setView(borderWidth: 1, borderColor: .darkGray, cornerRadius: 8)
    }
    
    @IBAction func tap_commercial_btn(_ sender: Any)
    {
        type = "commercial"
        residentialLine_view.backgroundColor = .clear
               commercialLine_view.backgroundColor = UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1)
    }
    
    @IBAction func tap_residential_btn(_ sender: Any)
    {
        type = "residential"
        residentialLine_view.backgroundColor = UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1)
        commercialLine_view.backgroundColor = .clear
    }
    
    @IBAction func tap_submit_btn(_ sender: Any) {
        if validate()
        {
            postTenantProperty()
        }
    }
    
    func validate() -> Bool {
        
        if (name_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Enter name")
            return false
            
        }else if (mobile_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Enter mobile number")
            return false
            
        }else if (email_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Enter email")
            return false
            
        }else if (location_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
              self.presentAlert(msg: "Enter location")
            return false
            
        }else if (budget_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
               self.presentAlert(msg: "Enter budget")
             return false
        }
        else if requirement_textfield.text.replacingOccurrences(of: " ", with: "") == "" {
            self.presentAlert(msg: "Enter requirement")
            return false
        }
        else
        {
            return true
        }
    }

    func postTenantProperty()
    {
        var link = ""
        
        if isComeFromTenant
        {
            link = Api.postTenantPropert
            
        }else {
            
            link = Api.postBuyer
        }
        
        let param : [String:Any] = [ "mobile" : mobile_textfield.text! , "name" : name_textfield.text!, "email" : email_textfield.text! , "location" : location_textfield.text! , "budget" : self.budget_textfield.text! , "requirement" : requirement_textfield.text! ,"type" : type]
        ApiManager.apiPost(url: link, param: param, ref: self) { (json, error) in
               if error != nil{
                   print(error?.localizedDescription ?? "")
               }else {
                   guard let data = json else {
                       print("error")
                       return}
                   do
                   {
            
                    let model = try JSONDecoder().decode(FeedbackModel.self, from: data)
                    if (model.code ?? "") == "200" {
                        
                        self.presentAlert(msg: model.msg ?? "")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                    }
                    
                   }
                   catch
                   {
                       print("err \(error)")
                   }
               }
            
        }
    }
}
