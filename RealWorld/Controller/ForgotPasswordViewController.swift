//
//  ForgotPasswordViewController.swift
//  RealWorld
//
//  Created by SAT PAL on 04/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit
import Alamofire

class ForgotPasswordViewController: BaseViewController {
    var sendOtp = ""

    @IBOutlet weak var mobileNumber_textfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
         self.addNavigationBar(leftBar: .Back, titleType: .Normal, title: "Forgot Password", bgColor: .black, barTintColor: .purple, right: .None, center_type: .None, titleColor: .white)
        
    }
    
    deinit {
        
        print("forgot password init")
    }
    
    //MARK:- Button Action
    
       func generateOtp() -> Int {
           
            let otp = Int.random(in: 1000..<9999)
           sendOtp = String(otp)
           print(sendOtp)
           return otp
       }
    @IBAction func tap_back_btn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tap_submit_btn(_ sender: Any) {

        forgotPassword_API()

    }
    
    
    
    func forgotApi() {

        guard let url = URL(string: "https://api.msg91.com/api/sendhttp.php") else {
            return
        }
        let string1 = "Your REALLWORLD OTP verification code is "
        let string2 =  String(generateOtp())
        var message = string1 + string2

        let data : Data = "mobiles=\(mobileNumber_textfield.text)&authkey=\("298586AQJHlI0m5da23064")&DLT_TE_ID=\("1307161857028192590")&sender=\("RLWRLD")&route=\("4")&message=\(message)".data(using: .utf8)!
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
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResetPasswordViewController") as! ResetPasswordViewController
                            vc.sendOtp = self.sendOtp
                          self.navigationController?.pushViewController(vc, animated: true)
            
                            do {
            
                              //  let todo = try decoder.decode(T.self, from: responseData)
                              //  NSAssertionHandler(.success(todo))
            
                            } catch {
                                print("error trying to convert data to JSON")
                                //print(error)
                              //  NSAssertionHandler(.failure(error))
                            }
                        }
                    })
                    task.resume()
        
}

    

    // Func for send otp in mail
    
        func sendOtpOn_EmailForgot() {
    
            let string1 = "Your REALLWORLD OTP verification code is "
            let string2 =  String(sendOtp)
            let message = string1 + string2

           //  sendOtp = String(generateOtp())
    
            let param = [ "key":"5642vcb546gfnbvb7r6ewc211365v13122","mobile" : mobileNumber_textfield.text!, "message" : message ]
    
            ApiManager.apiOtpPost(url: Api.sendOtpEmailforgot, param: param) { (json, error) in
    
                if error != nil{
                       print(error?.localizedDescription ?? "")
                    LoaderClass.stopLoader()
    
                   }else {
    
                   }
    
            }
            
          } // END
    
    //MARK: forgot pass api
      
    func forgotPassword_API() {
        
        //key,status,password,mobile
        
        let param : [String:Any] = [ "mobile" : mobileNumber_textfield.text!, "status" : "0"  ]
        
        ApiManager.apiPost(url: Api.forgotPassword, param: param, ref: self) { [weak self] (json, error) in
            
            guard let self = self else {return}
            
            if error != nil{
                print(error?.localizedDescription ?? "")
            }else {
                guard let data = json else {
                    print("error")
                    return}
                do {
                    
                    let model = try JSONDecoder().decode(FeedbackModel.self, from: data)
                   
                    if (model.code ?? "" ) == "403" {
                        
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResetPasswordViewController") as! ResetPasswordViewController
                        
                        vc.mobileNumber = self.mobileNumber_textfield.text!
                        
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                    else{
                        self.presentAlert(msg: "Your mobile Number  not Registered..")
                    }
                    
                }catch  {
                    print("err \(error)")
                }
            }
            
        }
        
        
        
    }
    
}
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//
//         self.addNavigationBar(leftBar: .Back, titleType: .Normal, title: "Forgot Password", bgColor: .black, barTintColor: .purple, right: .None, center_type: .None, titleColor: .white)
//
//    }
//
//    deinit {
//
//        print("forgot password init")
//    }
//
//    //MARK:- Button Action
//
//       func generateOtp() -> Int {
//
//            let otp = Int.random(in: 1000..<9999)
//
//           return otp
//       }
//    @IBAction func tap_back_btn(_ sender: Any) {
//
//        self.navigationController?.popViewController(animated: true)
//    }
//
//    @IBAction func tap_submit_btn(_ sender: Any) {
//
////        if (mobileNumber_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
////
////            self.presentAlert(msg: "Enter mobile number")
////        }
////        else {
//
//forgotApi()
//
//       // }
//
//    }
//    func forgotApi()
//    {
//        guard let url = URL(string: "https://api.msg91.com/api/sendhttp.php") else {
//            return
//        }
//        let string1 = "Your REALLWORLD OTP verification code is "
//        let string2 =  String(generateOtp())
//        var message = string1 + string2
//
//        let data : Data = "mobiles=\(mobileNumber_textfield.text)&authkey=\("298586AQJHlI0m5da23064")&DLT_TE_ID=\("1307161857028192590")&sender=\("RLWRLD")&route=\("4")&message=\(message)".data(using: .utf8)!
//        var request : URLRequest = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type");
//        request.setValue(NSLocalizedString("lang", comment: ""), forHTTPHeaderField:"Accept-Language");
//        request.httpBody = data
//
//        print("one called")
//
//        let config = URLSessionConfiguration.default
//        let session = URLSession(configuration: config)
//        // vs let session = URLSession.shared
//          // make the request
//        let task = session.dataTask(with: request, completionHandler: {
//            (data, response, error) in
//
//             if let error = error
//            {
//                print(error)
//            }
//             else if let response = response {
//                print("her in resposne")
//
//            }else if let data = data
//             {
//                print("here in data")
//                print(data)
//            }
//
//            DispatchQueue.main.async { // Correct
//
//                guard let responseData = data else
//                {
//                    print("Error: did not receive data")
//
//
//                    return
//                }
//
//                let decoder = JSONDecoder()
//                print(String(data: responseData, encoding: .utf8))
//                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResetPasswordViewController") as! ResetPasswordViewController
//
//
//                                                                        self.navigationController?.pushViewController(vc, animated: true)
//                do {
//
//                  //  let todo = try decoder.decode(T.self, from: responseData)
//                  //  NSAssertionHandler(.success(todo))
//                } catch {
//                    print("error trying to convert data to JSON")
//                    //print(error)
//                  //  NSAssertionHandler(.failure(error))
//                }
//            }
//        })
//        task.resume()
//    }
//
//
//    func forgotApi2()
//
//        {
//            let headers = [
//                "Content-Type": "application/x-www-form-urlencoded"
//            ]
//
//            let param : [String:Any] = ["mobiles":"9877940538" ,"authkey":"298586AQJHlI0m5da23064","DLT_TE_ID":"1307161857028192590","sender": "RLWRLD","route":"4","message":"Your REALLWORLD OTP verification code is 1234"]
//
//            print(param)
//
//
//            AF.request ("https://api.msg91.com/api/sendhttp.php", method: .post, parameters: param,encoding: JSONEncoding.default, headers: nil).responseString
//                  {
//
//                              response in
//                                switch response.result
//                                {
//                                              case .success(let value):
//                                                print(response.value!)
//                                                 if let JSON = value as? [String: Any]{
//
//                                                    let responseInfo = JSON["user"] as! NSDictionary
//                                                    let msg = JSON["message"] as! String
//                                                        let alert = UIAlertController(title: "Finance", message: msg, preferredStyle: UIAlertController.Style.alert)
//                                                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//                                                      self.present(alert, animated: true)
//                                                                   }
//
//                                              case .failure(let error):
//                                                print(error)
//
//                                                break
//
//                                              }}}
//
//
//
//    func forgotPassword_API() {
//
//        //key,status,password,mobile
//
//        let param : [String:Any] = [ "mobile" : mobileNumber_textfield.text!, "status" : "0"  ]
//
//        ApiManager.apiPost(url: Api.forgotPassword, param: param, ref: self) { [weak self] (json, error) in
//
//            guard let self = self else {return}
//
//            if error != nil{
//                print(error?.localizedDescription ?? "")
//            }else {
//                guard let data = json else {
//                    print("error")
//                    return}
//                do {
//
//                    let model = try JSONDecoder().decode(FeedbackModel.self, from: data)
//
//                    if (model.code ?? "" ) == "403" {
//
//                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResetPasswordViewController") as! ResetPasswordViewController
//
//                        vc.mobileNumber = self.mobileNumber_textfield.text!
//
//                        self.navigationController?.pushViewController(vc, animated: true)
//                    }
//
//                }catch  {
//                    print("err \(error)")
//                }
//            }
//
//        }
//
//
//
//    }
//
//
//}
