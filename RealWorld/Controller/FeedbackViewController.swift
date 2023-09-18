//
//  FeedbackViewController.swift
//  RealWorld
//
//  Created by SAT PAL on 03/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit

enum FeedBackOrCallBack {
    
    case Feedback
    case CallBack
    
}

class FeedbackViewController: BaseViewController {
    
    @IBOutlet weak var container_view: UIView!
    
    @IBOutlet weak var imageContainer_view: UIView!
    
    
    @IBOutlet weak var profile_imageView: UIImageView!
    
    @IBOutlet weak var fullName_label: UILabel!
    
    @IBOutlet weak var email_label: UILabel!
    
    @IBOutlet weak var mobileNumber_label: UILabel!
    
    @IBOutlet weak var fullName_textfield: UITextField!
    
    
    @IBOutlet weak var email_textfield: UITextField!
    
    @IBOutlet weak var mobileNumber_textfield: UITextField!
    
    
   
    
    @IBOutlet weak var feedBack_textView: GrowingTextView!
    
    @IBOutlet weak var sendQuery_btn: UIButton!
    
    var comeFrom : FeedBackOrCallBack = .Feedback
    
    
    var feedback : FeedbackModel?
    
    var callBack : CallBackModel?
    
    var link = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        fullName_textfield.text = Singleton.sharedInstance.loginModel?.first?.data?.name ?? ""
        mobileNumber_textfield.text = Singleton.sharedInstance.loginModel?.first?.data?.mobile ?? ""
        email_textfield.text = Singleton.sharedInstance.loginModel?.first?.data?.email ?? ""
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        switch comeFrom {
            
        case .CallBack:
            
            self.addNavigationBar(leftBar: .Back, titleType: .Normal, title: "REQUEST A CALLBACK" , bgColor: .clear, barTintColor: UIColor.clear, right: .None, center_type: .None, titleColor: .white)
            
            feedBack_textView.placeholder = "Your Query"
            
            link = Api.sendCallBackApi
            
        case .Feedback:
            
            self.addNavigationBar(leftBar: .Back, titleType: .Normal, title: "FEEDBACK & SUGGESTIONS", bgColor: .clear, barTintColor: UIColor.clear, right: .None, center_type: .None, titleColor: .white)
            
            feedBack_textView.placeholder = "Your Feedback"
            
            link =  Api.sendFeedback
            
        }
        
        
        
    }
    
    
    override func viewWillLayoutSubviews() {
        
        imageContainer_view.layer.cornerRadius = imageContainer_view.frame.height / 2
        
        container_view.layer.cornerRadius = 10
        
        feedBack_textView.layer.cornerRadius = 5
        
        feedBack_textView.layer.borderColor = UIColor.lightGray.cgColor
        
        feedBack_textView.layer.borderWidth = 1
        
        sendQuery_btn.layer.cornerRadius = sendQuery_btn.frame.height / 2
        
    }
    
    @IBAction func tap_sendQuery_btn(_ sender: Any) {
        
        if checkValidation() {
            
            switch comeFrom {
            
            case .CallBack:
                
                self.feedback_API()
                
                
            case .Feedback:
                
                self.feedback_API()
            }
            
           // self.feedback_API()
        }
        
    }
    
    
    
    //MARK:- FUnction
    
    func checkValidation() -> Bool {
        
        if (fullName_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Enter name")
                                
                                return false
            
        }else if (email_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Enter email")
                      
                      return false
            
        }
        else if !Validation.check.isValidEmail((email_textfield.text ?? ""))
        {
            
            self.presentAlert(msg: "Enter valid emaile")
                                
                                return false
        }
        else if (mobileNumber_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Enter mobile number")
            
            return false
            
            
        }else if (feedBack_textView.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Enter feedback message")
            
            return false
            
        }else {
            
            return true
        }
    }
    
    
    
    //MARK:- API
    //
    
    
    func feedback_API() {
        
        var param : [String:Any] = [ "name" : fullName_textfield.text! , "mobile" : mobileNumber_textfield.text! , "email" : email_textfield.text! , "message" : feedBack_textView.text! ]
        
        if comeFrom == .CallBack {
            
//            param.removeValue(forKey: "mobile")
//            param.updateValue(mobileNumber_textfield.text!, forKey: "mobile_number")
            
//            param.removeValue(forKey: "message")
//                       param.updateValue(feedBack_textView.text!, forKey: "query")
        }
      
        ApiManager.apiPost(url: link, param: param, ref: self) { [weak self] (json, error) in
            
            guard let self = self else { return }
            
            if error != nil{
                print(error?.localizedDescription ?? "")
            }else {
                guard let data = json else {
                    print("error")
                    return}
                do {
         
                    self.feedback = try JSONDecoder().decode(FeedbackModel.self, from: data)
                    
                    if (self.feedback?.code ?? "") == "200" {
                        
                        self.feedBack_textView.text = ""
                        self.presentAlert(msg: self.feedback?.msg ?? "")

                        self.navigationController?.popViewController(animated: true)
//                        self.presentAlert(msg:self.feedback?.msg ?? "")
//                                               let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
//                                                                                                                                                      self.navigationController?.pushViewController(vc, animated: true)
                    }
                    
                 
                    
                }catch  {
                    print("err \(error)")
                }
            }
        }
        
    }
   
    
    func callBackRequest_API() {
        
        let param : [String:Any] = [ "name" : fullName_textfield.text! , "mobile_number" : mobileNumber_textfield.text! , "email" : email_textfield.text! , "query" : feedBack_textView.text! ]
        
        print(link)
      
      
        ApiManager.apiPost(url: link, param: param, ref: self) { [weak self] (json, error) in
            
            guard let self = self else { return }
            
            if error != nil{
                print(error?.localizedDescription ?? "")
            }else {
                guard let data = json else {
                    print("error")
                    return}
                do {
         
                    self.callBack = try JSONDecoder().decode(CallBackModel.self, from: data)
                    
                    if (self.callBack?.status ?? "false") == "true" {
                        
                        self.feedBack_textView.text = ""
                        
                        
                    }
                    
                    self.presentAlert(msg: self.callBack?.message ?? "")
                    
                }catch  {
                    print("err \(error)")
                }
            }
        }
        
    }

}
