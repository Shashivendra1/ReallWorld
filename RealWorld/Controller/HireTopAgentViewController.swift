//
//  HireTopAgentViewController.swift
//  RealWorld
//
//  Created by SAT PAL on 03/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit

class HireTopAgentViewController: BaseViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var container_view: UIView!
    
    @IBOutlet weak var lblHeading: UILabel!
    
    @IBOutlet weak var image_view: UIView!
    
    @IBOutlet weak var profile_imageView: UIImageView!
    
    @IBOutlet weak var name_textfield: UITextField!
    
    @IBOutlet weak var mobile_textfield: UITextField!
    
    @IBOutlet weak var email_textfield: UITextField!
    
    @IBOutlet weak var requirement_textview: UITextView!
    
    
    var isComeFromAgent = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name_textfield.text = Singleton.sharedInstance.loginModel?.first?.data?.name ?? ""
        mobile_textfield.text = Singleton.sharedInstance.loginModel?.first?.data?.mobile ?? ""
        email_textfield.text = Singleton.sharedInstance.loginModel?.first?.data?.email ?? ""
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        var title = ""
        
        if isComeFromAgent {
            
            title = "HIRE TOP AGENT"
            lblTitle.text = "You can share your details below:-"
            lblHeading.text = "HIRE FOR OUR TOP LISTED AGENTS"
            
        }else {
            
            title = "HIRE LEGAL PAPERWORK"
            lblTitle.text = "You can share your details below:-"
            lblHeading.text = "HIRE FOR LEGAL PAPERWORK"
        }
        
        self.addNavigationBar(leftBar: .Back, titleType: .Normal, title: title, bgColor: .clear, barTintColor: UIColor.clear, right: .None, center_type: .None, titleColor: .white)
        
    }
    
    override func viewWillLayoutSubviews() {
        
        container_view.layer.cornerRadius = 10
        image_view.layer.cornerRadius = image_view.layer.frame.height / 2
        requirement_textview.layer.borderWidth = 1
        requirement_textview.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func tap_submit_btn(_ sender: Any)  {
        
        if validation() {
            
            sendPaperWork_Api()
        }
    }
    
    func validation() -> Bool {
        
        if (name_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Enter Name")
            
            return false
            
        }else if (mobile_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Enter Mobile no")
            return false
            
            
        }else if (email_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Enter email")
            return false
        }else if !Validation.check.isValidEmail(self.email_textfield.text ?? "") {
            
            self.presentAlert(msg: "Enter valid email")
            return false
            
        }else if (requirement_textview.text ?? "" ) == "" {
            
            self.presentAlert(msg: "Enter requirement")
            return false
        }
        else {
            
            return true
        }
        
    }
    
    
    func sendPaperWork_Api() {
        
        var link = ""
        
        if isComeFromAgent {
            
            link = Api.hireToAgent
            
        }else {
            
            link = Api.paperWork
        }
        
        let param : [String:Any] = [ "name" : name_textfield.text! , "mobile" : self.mobile_textfield.text! , "email" : self.email_textfield.text!, "requirement" : requirement_textview.text! ]
        
        ApiManager.apiPost(url: link, param: param, ref: self) { [weak self] (json, error) in
            
            guard let self = self else { return }
            
            if error != nil{
                print(error?.localizedDescription ?? "")
            }else {
                guard let data = json else {
                    print("error")
                    return
                    
                }
                do {
                    
                    let model = try JSONDecoder().decode(FeedbackModel.self, from: data)
                    
                    if (model.code ?? "") == "200" {
                        
                        self.requirement_textview.text = ""
                        self.presentAlert(msg: model.msg ?? "")
                        self.navigationController?.popViewController(animated: true)
                        
                    }
                    
                }catch  {
                    print("err \(error)")
                }
            }
        }
    }
}
