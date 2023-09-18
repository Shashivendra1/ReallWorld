//
//  SignInViewController.swift
//  RealWorld
//
//  Created by SAT PAL on 02/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//


import UIKit
import AVKit

class SignInViewController: BaseViewController {
    
    var count1:Int = 0

    @IBOutlet weak var mobileNumber_textfield: UITextField!
    
    @IBOutlet weak var password_textfield: UITextField!
    
    @IBOutlet weak var signin_btn: UIButton!
    
    @IBOutlet weak var player_view: AVPlayerView!
    
    @IBOutlet weak var mobileNumber_label: UILabel!
    
    @IBOutlet weak var password_label: UILabel!
    
    var loginModel : LoginModel?
    //MARK:- Life Cycle
    
    
    let device_id = UserDefaults.standard.string(forKey: "device_id")
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        mobileNumber_label.isHidden = true
        password_label.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
       VideoPlayer.instance?.playVideo(player_view: player_view)

        self.navigationController?.navigationBar.isHidden = true
        
        let image = UIImage(named: "back")?.withRenderingMode(.alwaysTemplate).withTintColor(.white)
        
        self.navigationController?.navigationBar.backIndicatorImage = image
        
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = image
        
        
        mobileNumber_textfield.addTarget(self, action: #selector(editingBegin), for: .editingDidBegin)
        
        password_textfield.addTarget(self, action: #selector(editingBegin), for: .editingDidBegin)
        
        mobileNumber_textfield.addTarget(self, action: #selector(editingEnd), for: .editingDidEnd)
        
        password_textfield.addTarget(self, action: #selector(editingEnd), for: .editingDidEnd)
    }
    
    override func viewWillLayoutSubviews() {
        
        mobileNumber_textfield.setPlaceholderColor()
        password_textfield.setPlaceholderColor()
        
        signin_btn.layer.cornerRadius = 10
        
        signin_btn.layer.borderWidth = 3
        
        signin_btn.layer.borderColor = UIColor.white.cgColor
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        VideoPlayer.instance?.stopVideo()
        
        loginModel = nil
        
    }
    
    deinit {
        
        print("SignIn Deinit")
    }
    
    //MARK:- Button Action
    
    @IBAction func tap_signin_btn(_ sender: Any) {
        
        if checkValidation() {
            
            signIn_API()
            
        }
        
    }
    @IBAction func eye_btn(_ sender: Any) {
        if count1 == 0{
                   (sender as AnyObject).setImage(UIImage(named: "eye-hidden"), for: .normal)
                           count1 = 1
                       self.password_textfield.isSecureTextEntry = false
                       }else{
                   (sender as AnyObject).setImage(UIImage(named: "eye-show"), for: .normal)
                           count1 = 0
                           self.password_textfield.isSecureTextEntry = true
                       }
    }
    
    @IBAction func skip_btn(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "homeViewController") as! homeViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func tap_signUp_btn(_ sender: Any) {
        
        DispatchQueue.main.async {
            
            let vc = self.storyboard?.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
     
    }
    
    @IBAction func tap_forgotPassword_btn(_ sender: Any) {
        
        DispatchQueue.main.async {
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    //MARK:- TextField Editing Changed
    
    @objc func editingBegin(textfield : UITextField) {
        
        switch textfield {
        case mobileNumber_textfield:
            mobileNumber_label.isHidden = false
            mobileNumber_textfield.placeholder = ""
            
        case password_textfield:
            password_label.isHidden = false
            password_textfield.placeholder = ""
            
            
        default:
            print("SignIn editing begin default case")
        }
        
    }
    
    @objc func editingEnd(textfield : UITextField) {
        
        switch textfield {
        case mobileNumber_textfield:
            if (mobileNumber_textfield.text ?? "") != "" {
                
                mobileNumber_label.isHidden = false
            }
            else {
                
                mobileNumber_label.isHidden = true
                mobileNumber_textfield.placeholder = "Mobile Number"
            }
            
        case password_textfield:
            if (password_textfield.text ?? "") != "" {
                
                password_label.isHidden = false
            }
            else {
                
                password_label.isHidden = true
                password_textfield.placeholder = "Password"
            }
            
        default:
            print("SignIn editing begin default case")
        }
        
    }
    
    override func dismissAlert() {
        
        print("dismiss in signin")
       AllLogoutDeviceApi()
        
        
    }
    
    
    func AllLogoutDeviceApi() {
        
        let param : [String:Any] = [ "mobile" : mobileNumber_textfield.text!]
        
        print(param)
        
        ApiManager.apiPost(url:  Api.AllDevicelogout, param: param, ref: self) { [weak self] (json, error) in
            
            guard let self = self else { return  }
            
            print("12121")
        }
        
    }
    
    
    //MARK:- Validation
    
    func checkValidation() -> Bool {
        
        if (self.mobileNumber_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg : "Please enter mobile number")
            return false
            
        }
        else if (self.password_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg : "Please enter password")
            return false
        }
        else {
            
            return true
        }
    }
    
    
    //MARK:- API
    
    func signIn_API() {
        
        let param : [String:Any] = [ "mobile" : mobileNumber_textfield.text! , "password" : password_textfield.text!,"device_id" : device_id! ]
        
        print(param)
        
        ApiManager.apiPost(url:  Api.login, param: param, ref: self) { [weak self] (json, error) in
            
            guard let self = self else { return  }
            
            if error != nil{
                print(error?.localizedDescription ?? "")
            }else {
                guard let data = json else {
                    print("error")
                    return
                    
                }
                do {
                    self.loginModel = try JSONDecoder().decode(LoginModel.self, from: data)
                    
                    if (self.loginModel?.first?.code ?? "") == "200" {
                        
                        UserDefaults.standard.set(data, forKey: "UserData")
                        
                        Singleton.sharedInstance.loginModel = self.loginModel
                        
                        DispatchQueue.main.async {
                            
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
                            self.navigationController?.pushViewController(vc, animated: true)
                            
                        }
                        
                    }
                    else {
                        
                        self.presentAlert(msg: self.loginModel?.first?.msg ?? "Please Enter Correct Password")
                    }
                }catch  {
                    self.presentAlert(msg: self.loginModel?.first?.msg ?? "Please Enter Correct Password")

                    print("err \(error)")
                }
            }
            
        }
        
    }
    
}


