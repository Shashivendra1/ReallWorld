//
//  OtpViewController.swift
//  RealWorld
//
//  Created by SAT PAL on 07/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit

class OtpViewController: BaseViewController {
    
    @IBOutlet weak var confirm_btn: UIButton!
    
    @IBOutlet weak var resend_btn: UIButton!
    
    @IBOutlet weak var first_textfield: UITextField!
    
    @IBOutlet weak var second_textfield: UITextField!
    
    @IBOutlet weak var third_textfield: UITextField!
    
    @IBOutlet weak var fourth_textfield: UITextField!
    
    var loginModel : LoginModel?
    
    var mobileNumber = ""
    var email = ""
    
    var param : [String:Any] = [:]
    
    var signUpModel :  SignUpModel?
    
    var sendOtp = ""
    //MARK:- Life Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        first_textfield.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        
        second_textfield.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        
        third_textfield.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        
        fourth_textfield.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        
    }
    
    override func viewWillLayoutSubviews() {
        
        confirm_btn.setButton(borderWidth: 1, borderColor: UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1), cornerRadius: 5)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        sendOtp_API()
        
        // send otp on mail
        sendOtpOn_MailApi()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        signUpModel = nil
    }
    
    deinit {
        
        print("Otp deinit")
    }
    
    //MARK:- Button Action
    
    @IBAction func tap_confirm_btn(_ sender: Any) {
        
        if getEnterOtp() == sendOtp {
            
            self.signUp_API()
            
        }
        else {
            self.presentAlert(msg: "Enter valid otp")
        }
        
    }
    @IBAction func tap_back_btn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tap_resend_btn(_ sender: Any) {
        
        sendOtp_API()
        
        // send otp on mail
        sendOtpOn_MailApi()
    }
    
    //MARK:- Function
    
    func generateOtp() -> Int {
        
        let otp = Int.random(in: 1000..<9999)
        sendOtp = String(otp)
        print(sendOtp)
        return otp
    }
    
    func getEnterOtp() -> String {
        
        var otp = (self.first_textfield.text ?? "") + (self.second_textfield.text ?? "")
        
        otp = otp + (self.third_textfield.text ?? "")
        
        otp = otp + (self.fourth_textfield.text ?? "")
        
        print(otp)
        
        return otp
    }
    
    //MARK:- TextField
    
    @objc func editingChanged(textfield : UITextField) {
        
        switch textfield {
            
        case first_textfield:
            if (textfield.text ?? "").count == 1 {
                
                first_textfield.resignFirstResponder()
                second_textfield.becomeFirstResponder()
            }
            
        case second_textfield:
            if (textfield.text ?? "").count == 1 {
                
                second_textfield.resignFirstResponder()
                third_textfield.becomeFirstResponder()
            }
            
        case third_textfield:
            if (textfield.text ?? "").count == 1 {
                
                third_textfield.resignFirstResponder()
                fourth_textfield.becomeFirstResponder()
            }
            
        case fourth_textfield:
            if (textfield.text ?? "").count == 1 {
                
                fourth_textfield.resignFirstResponder()
                
            }
            
        default:
            print("otp textfield delegate swict default case")
        }
        
    }
    
    
    //MARK: Func for send otp in mail
    
    func sendOtpOn_MailApi() {
        
        let string1 = "Your REALLWORLD OTP verification code is "
        let string2 =  String(sendOtp)
        let message = string1 + string2
        
        // sendOtp = String(generateOtp())
        
        let param = [ "key":"5642vcb546gfnbvb7r6ewc211365v13122","email" :email, "message" : message ]
        
        ApiManager.apiOtpPost(url: Api.sendOtpEmail, param: param) { (json, error) in
            
            if error != nil{
                print(error?.localizedDescription ?? "")
                LoaderClass.stopLoader()
                
            }else {
                
            }
        }
        
    } // END
    
    
    func sendOtp_API() {
        
        guard let url = URL(string: "https://api.msg91.com/api/sendhttp.php") else {
            return
        }
        let string1 = "Your REALLWORLD OTP verification code is "
        let string2 =  String(generateOtp())
        var message = string1 + string2
        
        let data : Data = "mobiles=\(mobileNumber)&authkey=\("298586AQJHlI0m5da23064")&DLT_TE_ID=\("1307161857028192590")&sender=\("RLWRLD")&route=\("4")&message=\(message)".data(using: .utf8)!
        var request : URLRequest = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type");
        request.setValue(NSLocalizedString("lang", comment: ""), forHTTPHeaderField:"Accept-Language");
        request.httpBody = data
        
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        // vs let session = URLSession.shared
        // make the request
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            
            if let error = error
            {
                print(error)
            }
            else if let response = response {
                print("her in resposne")
                
            }else if let data = data
            {
                print("here in data")
                print(data)
            }
            
            DispatchQueue.main.async { // Correct
                
                guard let responseData = data else
                {
                    print("Error: did not receive data")
                    
                    return
                }
                
                let decoder = JSONDecoder()
                
                do {
                    
                } catch {
                    print("error trying to convert data to JSON")
                    
                }
            }
        })
        task.resume()
        
    }
    
    func signUp_API() {
        
        self.param.updateValue("0", forKey: "loginstatus")
        
        ApiManager.apiPost(url: Api.signup, param: self.param, ref: self) { (json, error) in
            
            if error != nil{
                print(error?.localizedDescription ?? "")
            }else {
                guard let data = json else {
                    print("error")
                    return}
                do {
                    
                    self.signUpModel = try JSONDecoder().decode(SignUpModel.self, from: data)
                    
                    if (self.signUpModel?.first?.code ?? "") == "200" {
                        
                        self.signIn_API()
                        
                    }else {
                        
                        self.presentAlert(msg: self.signUpModel?.first?.msg ?? "")
                    }
                    
                }catch  {
                    print("err \(error)")
                }
            }
        }
        
    }
    
    
    func signIn_API() {
        
        let param : [String:Any] = [ "mobile" : self.param["mobile"] as! String , "password" : self.param["password"] as! String ]
        
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
                        
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
                        
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                    else {
                        
                        self.presentAlert(msg: self.loginModel?.first?.msg ?? "")
                    }
                }catch  {
                    print("err \(error)")
                }
            }
            
        }
        
    }
}








/*
 var mobileNumber = ""
 
 var param : [String:Any] = [:]
 
 var signUpModel :  SignUpModel?
 
 var sendOtp = ""
 //MARK:- Life Cycle
 
 override func viewDidLoad() {
 
 super.viewDidLoad()
 
 first_textfield.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
 
 second_textfield.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
 
 third_textfield.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
 
 fourth_textfield.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
 
 }
 
 override func viewWillLayoutSubviews() {
 
 confirm_btn.setButton(borderWidth: 1, borderColor: UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1), cornerRadius: 5)
 }
 
 override func viewDidAppear(_ animated: Bool) {
 
 sendOtp_API()
 }
 
 override func viewWillDisappear(_ animated: Bool) {
 
 signUpModel = nil
 }
 
 deinit {
 
 print("Otp deinit")
 }
 
 //MARK:- Button Action
 
 @IBAction func tap_confirm_btn(_ sender: Any) {
 let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
 
 self.navigationController?.pushViewController(vc, animated: true)
 
 
 }
 @IBAction func tap_back_btn(_ sender: Any) {
 
 self.navigationController?.popViewController(animated: true)
 }
 
 @IBAction func tap_resend_btn(_ sender: Any) {
 
 sendOtp_API()
 }
 
 //MARK:- Function
 
 func generateOtp() -> Int {
 
 let otp = Int.random(in: 1000..<9999)
 
 return otp
 }
 
 func getEnterOtp() -> String {
 
 var otp = (self.first_textfield.text ?? "") + (self.second_textfield.text ?? "")
 
 otp = otp + (self.third_textfield.text ?? "")
 
 otp = otp + (self.fourth_textfield.text ?? "")
 
 print(otp)
 
 return otp
 }
 
 //MARK:- TextField
 
 @objc func editingChanged(textfield : UITextField) {
 
 switch textfield {
 
 case first_textfield:
 if (textfield.text ?? "").count == 1 {
 
 first_textfield.resignFirstResponder()
 second_textfield.becomeFirstResponder()
 }
 
 case second_textfield:
 if (textfield.text ?? "").count == 1 {
 
 second_textfield.resignFirstResponder()
 third_textfield.becomeFirstResponder()
 }
 
 case third_textfield:
 if (textfield.text ?? "").count == 1 {
 
 third_textfield.resignFirstResponder()
 fourth_textfield.becomeFirstResponder()
 }
 
 case fourth_textfield:
 if (textfield.text ?? "").count == 1 {
 
 fourth_textfield.resignFirstResponder()
 
 }
 
 default:
 print("otp textfield delegate swict default case")
 }
 
 }
 
 func sendOtp_API() {
 
 guard let url = URL(string: "https://api.msg91.com/api/sendhttp.php") else {
 return
 }
 let string1 = "Your REALLWORLD OTP verification code is "
 let string2 =  String(generateOtp())
 var message = string1 + string2
 
 let data : Data = "mobiles=\(mobileNumber)&authkey=\("298586AQJHlI0m5da23064")&DLT_TE_ID=\("1307161857028192590")&sender=\("RLWRLD")&route=\("4")&message=\(message)".data(using: .utf8)!
 var request : URLRequest = URLRequest(url: url)
 request.httpMethod = "POST"
 request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type");
 request.setValue(NSLocalizedString("lang", comment: ""), forHTTPHeaderField:"Accept-Language");
 request.httpBody = data
 
 print("one called")
 
 let config = URLSessionConfiguration.default
 let session = URLSession(configuration: config)
 // vs let session = URLSession.shared
 // make the request
 let task = session.dataTask(with: request, completionHandler: {
 (data, response, error) in
 
 if let error = error
 {
 print(error)
 }
 else if let response = response {
 print("her in resposne")
 
 }else if let data = data
 {
 print("here in data")
 print(data)
 }
 
 DispatchQueue.main.async { // Correct
 
 guard let responseData = data else
 {
 print("Error: did not receive data")
 
 
 return
 }
 
 let decoder = JSONDecoder()
 print(String(data: responseData, encoding: .utf8))
 
 do {
 
 } catch {
 print("error trying to convert data to JSON")
 
 }
 }
 })
 task.resume()
 
 }
 
 func signUp_API() {
 
 self.param.updateValue("0", forKey: "loginstatus")
 
 
 ApiManager.apiPost(url: Api.signup, param: self.param, ref: self) { (json, error) in
 
 if error != nil{
 print(error?.localizedDescription ?? "")
 }else {
 guard let data = json else {
 print("error")
 return}
 do {
 
 self.signUpModel = try JSONDecoder().decode(SignUpModel.self, from: data)
 
 if (self.signUpModel?.first?.code ?? "") == "200" {
 
 self.signIn_API()
 
 
 }else {
 
 self.presentAlert(msg: self.signUpModel?.first?.msg ?? "")
 }
 
 }catch  {
 print("err \(error)")
 }
 }
 }
 
 }
 
 
 func signIn_API() {
 
 let param : [String:Any] = [ "mobile" : self.param["mobile"] as! String , "password" : self.param["password"] as! String ]
 
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
 
 let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
 
 self.navigationController?.pushViewController(vc, animated: true)
 }
 else {
 
 self.presentAlert(msg: self.loginModel?.first?.msg ?? "")
 }
 }catch  {
 print("err \(error)")
 }
 }
 
 }
 
 }
 
 }
 */

