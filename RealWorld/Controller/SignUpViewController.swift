//
//  SignUpViewController.swift
//  RealWorld
//
//  Created by SAT PAL on 02/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit
import AVKit

class SignUpViewController: BaseViewController {
    
    @IBOutlet weak var fullName_textfield: UITextField!
    
    @IBOutlet weak var mobileNumber_textfield: UITextField!
    
    @IBOutlet weak var email_textfield: UITextField!
    
    @IBOutlet weak var password_textfield: UITextField!
    
    @IBOutlet weak var confirmPassword_textfield:
    UITextField!
    
    @IBOutlet weak var fullName_label: UILabel!
    
    @IBOutlet weak var mobileNo_label: UILabel!
    
    @IBOutlet weak var email_label: UILabel!
    
    @IBOutlet weak var owner_label: UILabel!
    
    @IBOutlet weak var password_label: UILabel!
    
    @IBOutlet weak var confirmPassword_label: UILabel!
    
    @IBOutlet weak var signup_btn: UIButton!
    
    @IBOutlet weak var player_view: AVPlayerView!
    
    @IBOutlet weak var owner_view: UIView!
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var toolbar: UIToolbar!
    
    
    var owner_array = [ "Owner",
                        "Agent",
                        "Buyer",
                        "Tenant"]
    
    var status = "1"
    let device_id = UserDefaults.standard.string(forKey: "device_id")

    //MARK:- Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        setTextFieldMethod()
        
        picker.delegate = self
        
        picker.dataSource = self
        
        picker.isHidden = true
        
        toolbar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        VideoPlayer.instance?.playVideo(player_view: player_view)
    }
    
    override func viewWillLayoutSubviews() {
        
        setPlaceHolderAndBorder()
        
        owner_view.layer.cornerRadius = 5
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
         VideoPlayer.instance?.stopVideo()
    }
    
    deinit {
        
        print("SignUp deinit")
    }
    
    
    //MARK:- Action
    
   override func dismissAlert() {
        
        
    }
    
    @IBAction func tap_alreadyHaveAccount_btn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func tap_signup_btn(_ sender: Any) {
        
        if checkValidation() {
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "OtpViewController") as! OtpViewController
            
            vc.mobileNumber = self.mobileNumber_textfield.text!
        vc.email = self.email_textfield.text!

        vc.param = [ "name" : fullName_textfield.text! , "email" : email_textfield.text!, "mobile" : mobileNumber_textfield.text!, "password" : password_textfield.text!, "status" : status , "business_type" : self.owner_label.text! ,"device_id" : device_id ]
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    @IBAction func tap_owner_btn(_ sender: Any) {
        
        picker.isHidden = false
        toolbar.isHidden = false
    }
    
    @IBAction func tap_cancel_btn(_ sender: Any) {
        
        picker.isHidden = true
        toolbar.isHidden = true
    }
    
    @IBAction func tap_done_btn(_ sender: Any) {
        
        picker.isHidden = true
        toolbar.isHidden = true
        
    }
    
    
    //MARK:- Function
    
    func setPlaceHolderAndBorder() {
        
        fullName_textfield.setPlaceholderColor()
        
        mobileNumber_textfield.setPlaceholderColor()
        
        email_textfield.setPlaceholderColor()
        
        password_textfield.setPlaceholderColor()
        
        confirmPassword_textfield.setPlaceholderColor()
        
        signup_btn.layer.borderColor = UIColor.white.cgColor
        
        signup_btn.layer.borderWidth = 3
        
        signup_btn.layer.cornerRadius = 10
        
    }
    
    private func setTextFieldMethod() {
        
        fullName_textfield.addTarget(self, action: #selector(editingBegin), for: .editingDidBegin)
        
        mobileNumber_textfield.addTarget(self, action: #selector(editingBegin), for: .editingDidBegin)
        
        email_textfield.addTarget(self, action: #selector(editingBegin), for: .editingDidBegin)
        
        password_textfield.addTarget(self, action: #selector(editingBegin), for: .editingDidBegin)
        
        confirmPassword_textfield.addTarget(self, action: #selector(editingBegin), for: .editingDidBegin)
        
        fullName_textfield.addTarget(self, action: #selector(endEditing), for: .editingDidEnd)
        
        mobileNumber_textfield.addTarget(self, action: #selector(endEditing), for: .editingDidEnd)
        
        email_textfield.addTarget(self, action: #selector(endEditing), for: .editingDidEnd)
        
        password_textfield.addTarget(self, action: #selector(endEditing), for: .editingDidEnd)
        
        confirmPassword_textfield.addTarget(self, action: #selector(endEditing), for: .editingDidEnd)
    }
    
    @objc private func editingBegin(textfield : UITextField) {
        
        textfield.placeholder = ""
        
        switch textfield {
            
        case fullName_textfield:
            fullName_label.isHidden = false
            
            
        case mobileNumber_textfield:
            mobileNo_label.isHidden = false
            
        case email_textfield:
            email_label.isHidden = false
            
        case password_textfield:
            password_label.isHidden = false
            
        case confirmPassword_textfield:
            confirmPassword_label.isHidden = false
            
            
        default:
            print("SignUp textfield default case")
        }
    }
    
    @objc private func endEditing(textfield : UITextField) {
        
        
        switch textfield {
            
        case fullName_textfield:
            if (fullName_textfield.text ?? "") != "" {
                
                fullName_label.isHidden = false
                
            }else {
                
                fullName_label.isHidden = true
                fullName_textfield.placeholder = "Full Name"
                
            }
            
            
            
        case mobileNumber_textfield:
            
            if (mobileNumber_textfield.text ?? "") != "" {
                
                mobileNo_label.isHidden = false
                
            }else {
                
                mobileNo_label.isHidden = true
                mobileNumber_textfield.placeholder = "Mobile No"
            }
            
            
        case email_textfield:
            if (email_textfield.text ?? "") != "" {
                
                email_label.isHidden = false
                
            }else {
                
                email_label.isHidden = true
                email_textfield.placeholder = "Email"
            }
            
            
        case password_textfield:
            if (password_textfield.text ?? "") != "" {
                
                password_label.isHidden = false
                
            }else {
                
                password_label.isHidden = true
                password_textfield.placeholder = "Password"
                
            }
            
            
        case confirmPassword_textfield:
            if (confirmPassword_textfield.text ?? "") != "" {
                
                confirmPassword_label.isHidden = false
                
            }else {
                
                confirmPassword_label.isHidden = true
                confirmPassword_textfield.placeholder = "Confirm Password"
            }
            
            
            
        default:
            print("SignUp textfield default case")
        }
    }
    
    
    //MARK:- Validation
    
    func checkValidation() -> Bool {
        
        if (fullName_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg : "Enter name")
            
            return false
            
        }else if (mobileNumber_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg : "Enter mobile number")
            
            return false
            
        }else if (email_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg : "Enter email")
            
            return false
            
        }
        else if !Validation.check.isValidEmail((email_textfield.text ?? "")) {
            
            self.presentAlert(msg : "Enter valid email")
            
            return false
            
        }
        else if (password_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg : "Password should not be empty")
            
            return false
            
        }else if (confirmPassword_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg : "Confirm password should not be empty")
            
            return false
            
        }else if (password_textfield.text ?? "") != (confirmPassword_textfield.text ?? "") {
            
            self.presentAlert(msg : "Password and confirm password not matched")
            
            return false
        }
        else {
            
            return true
        }
        
    }
    
}
    
  
    

extension SignUpViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return owner_array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return owner_array[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        owner_label.text = owner_array[row]
    }
}
