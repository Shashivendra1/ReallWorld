//
//  ResetPasswordViewController.swift
//  RealWorld
//
//  Created by SAT PAL on 09/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit

class ResetPasswordViewController: BaseViewController {
    
    @IBOutlet weak var otp_view: UIView!
    
    @IBOutlet weak var newPassword_view: UIView!
    
    @IBOutlet weak var confirm_view: UIView!
    
    @IBOutlet weak var password_textfield: UITextField!
    
    @IBOutlet weak var confirmPassword_textfield: UITextField!
    
    @IBOutlet weak var otp_textfield: UITextField!
    var param : [String:Any] = [:]

    var mobileNumber = ""
    var verifyOTP = Int()
    var sendOtp = ""
    
    var isSuccess = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newPassword_view.layer.borderWidth = 1
        newPassword_view.layer.borderColor = UIColor.purple.cgColor
        otp_view.layer.borderWidth = 1
        otp_view.layer.borderColor = UIColor.purple.cgColor
        confirm_view.layer.borderWidth = 1
        confirm_view.layer.borderColor =  (UIColor.purple.cgColor)
        

       // view.backgroundColor = .orange
    }
 
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.addNavigationBar(leftBar: .Back, titleType: .Normal, title: "Reset Password", bgColor: .clear, barTintColor: .purple, right: .None, center_type: .None, titleColor: .white)
        self.navigationController?.navigationBar.backgroundColor = .purple


     
    }
    
    override func viewDidAppear(_ animated: Bool) {
        generateOtp()
//   sendOtp_API()
//   sendOtpOn_EmailForgot()
    }
    
    override func viewWillLayoutSubviews() {
        
        otp_view.layer.borderColor = UIColor.black.cgColor
        otp_view.layer.borderWidth = 1
        otp_view.layer.cornerRadius = 8
        
        newPassword_view.layer.borderColor = UIColor.black.cgColor
        newPassword_view.layer.borderWidth = 1
        newPassword_view.layer.cornerRadius = 8
        
        confirm_view.layer.borderColor = UIColor.black.cgColor
        confirm_view.layer.borderWidth = 1
        confirm_view.layer.cornerRadius = 8
    }
    
    @IBAction func tap_submit_btn(_ sender: Any) {
        print(verifyOTP)
        if validation() {
            
            if otp_textfield.text! == String(verifyOTP) {
                
                 self.resetPassword_API()
            }
            else {
                
                self.presentAlert(msg: "Enter valid otp")
            }
        }
        
       
    }
    
    
    
    
    func generateOtp() -> Int {
        
        let otp = Int.random(in: 1000..<9999)
       verifyOTP = otp
        sendOtp_API()
        sendOtpOn_EmailForgot()
        return otp
    }
    
    override func dismissAlert() {
        
        if self.isSuccess {
            
            self.dismiss(animated: false) {
                [weak self]  in
                
                let vcs = self?.navigationController?.viewControllers
                
                if (vcs?.count ?? 0) > 0 {
                    
                    for vc in vcs! {
                        
                        if vc.isKind(of: SignInViewController.self) {
                            
                            self?.navigationController?.popToViewController(vc, animated: true)
                        }
                    }
                    
                }
            }
            
        }else {
            
            self.dismiss(animated: false, completion: nil)
        }
        
    }
       
    
    
    func validation() -> Bool {
        
        if (otp_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Enter otp")
            
            return false
            
        }else if (password_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Enter Password")
            
            return false
            
        }else if (confirmPassword_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Enter confirm Password")
            
            return false
            
        }else {
            
            return true
        }
        
    }
    
    func resetPassword_API() {
        
        let param : [String:Any] = [ "mobile" : mobileNumber, "password" : password_textfield.text! , "status" : "1"]
        
        ApiManager.apiPost(url: Api.forgotPassword, param: param, ref: self) {[weak self] (json, error) in
            
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
              
                        self.isSuccess = true
                        self.presentAlert(msg: model.msg ?? "")
                        
                    }
                    
                }catch  {
                    print("err \(error)")
                }
            }
        }
    }
    
    func sendOtp_API() {
     
        guard let url = URL(string: "https://api.msg91.com/api/sendhttp.php") else {
                   return
               }
               let string1 = "Your REALLWORLD OTP verification code is "
               let string2 =  String(verifyOTP)//String(generateOtp())
               var message = string1 + string2
            //print(param)
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
                           //print(error)
                         //  NSAssertionHandler(.failure(error))
                       }
                   }
               })
               task.resume()
    
}
    
    
    
    func sendOtpOn_EmailForgot() {

        let string1 = "Your REALLWORLD OTP verification code is "
        let string2 =  String(verifyOTP)//String(generateOtp())
        var message = string1 + string2

       //  sendOtp = String(generateOtp())

        let param = [ "key":"5642vcb546gfnbvb7r6ewc211365v13122","mobile" : mobileNumber, "message" : message ]
        print(param)
       // ApiManager.apiOtpPost(url: Api.sendOtpEmailforgot, param: param) { (json, error) in
            
            ApiManager.apiPost(url: Api.sendOtpEmailforgot, param: param, ref: self) {[weak self] (json, error) in
                

            if error != nil{
                print(error?.localizedDescription ?? "")
                LoaderClass.stopLoader()
                
            }else {
                guard let data = json else {
                    print("error")
                    return
                    
                }
                do {
                    
                    let model = try JSONDecoder().decode(sendOTPEmailModel.self, from: data)
                    
                    if (model.code ?? "") == "200" {
       
                    }
                    
                }catch  {
                    print("err \(error)")
                }
            }

        }
        
      } // END

}

