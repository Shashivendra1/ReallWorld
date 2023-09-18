//
//  ContactUsViewController.swift
//  RealWorld
//
//  Created by SAT PAL on 03/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit
import MessageUI

struct ContactData : Codable {
    let id : Int?
    let mobile : String?
    let email : String?
    let address : String?
    let msg : String?
    let code : String?
}

class ContactUsViewController: BaseViewController ,MFMailComposeViewControllerDelegate {
    
    let composeVC = MFMailComposeViewController()

    var id : Int?
    var mobile : String?
    var email : String?
    var address : String?
    var msg : String?
    
    @IBOutlet weak var upperViewContainer_view: UIView!
    
    @IBOutlet weak var lowerViewContainer_view: UIView!
    
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var imageContainer_view: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ContactListApi()
        
    }
    func ContactListApi() {

        let param = [ "key":"5642vcb546gfnbvb7r6ewc211365v13122" ]
        let contactUs = "contactus"
        ApiManager.apiOtpPost(url: Api.base_url+contactUs, param: param) { (json, error) in

            if error != nil{
                   print(error?.localizedDescription ?? "")
                LoaderClass.stopLoader()

               }else {
                   guard let data = json else {
                       print("error")
                       return
                       
                   }
                       do {
                           let jsonDecoder = JSONDecoder()
                           let responseModel = try jsonDecoder.decode(ContactData.self, from: data)
                           
                      //     print(responseModel.id)
                           self.id = responseModel.id
                           self.mobile = responseModel.mobile
                           self.email = responseModel.email
                           self.address = responseModel.address
                           self.msg = responseModel.msg
                           self.lblAddress.text = self.address
                       
                       }catch  {
                           print("err \(error)")
                       }
                   }
               

        }
        
      } // END

    
    override func viewWillAppear(_ animated: Bool) {
        
          self.addNavigationBar(leftBar: .Back, titleType: .Normal, title: "Contact Us", bgColor: .clear, barTintColor: UIColor.clear, right: .None, center_type: .None, titleColor: .white)
        
    }
    
    override func viewWillLayoutSubviews() {
        
        upperViewContainer_view.layer.cornerRadius = 10
        lowerViewContainer_view.layer.cornerRadius = 10
        imageContainer_view.layer.cornerRadius = imageContainer_view.layer.frame.height / 2
    }
    
    @IBAction func tap_whatsapp_btn(_ sender: Any) {
        let urlWhats = "whatsapp://send?phone=+91\(mobile ?? "")&abid=12354&text=Hello"
        
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed){
            if let whatsappURL = URL(string: urlString) {
                if UIApplication.shared.canOpenURL(whatsappURL){
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(whatsappURL, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(whatsappURL)
                    }
                }
                else {
                    print("Install Whatsapp")
                    self.presentAlert(msg: "Install Whatsapp")
                }
            }
        }
    /*
        let urlWhats = "whatsapp://send?text=\("www.google.com")"
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) {
              if let whatsappURL = NSURL(string: urlString) {
                    if UIApplication.shared.canOpenURL(whatsappURL as URL) {
                         UIApplication.shared.open(whatsappURL as URL)
                     }
                     else {
                         print("please install watsapp")
                     }
              }
        }
     */
    }
    
    @IBAction func tap_email_btn(_ sender: Any) {
        
        let email = email
        sendEmail(email:email ?? "")

//         let url = URL(string: "mailto:\(String(describing: email))")
//          if #available(iOS 10.0, *) {
//              UIApplication.shared.open((url)!)
//          } else {
//              UIApplication.shared.openURL((url)!)
//          }
        
        
    }
    
    func sendEmail(email:String) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([email])
            mail.setMessageBody("<p>Search Property!</p>", isHTML: true)

            present(mail, animated: true)
        } else {
            self.presentAlert(msg: "please install email app")
        }
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    
    @IBAction func tap_callUs_btn(_ sender: Any) {
        
//        var url = NSURL()
//        url = NSURL(string: "tel://" + "\(String(describing: mobile))")!
        let url:NSURL? = NSURL(string: mobile ?? "")//"tel://9809088798")
       // UIApplication.sharedApplication().openURL(url!)
        if let url = NSURL(string: "tel://\(mobile ?? "" )"), UIApplication.shared.canOpenURL(url as URL) {
            UIApplication.shared.openURL(url as URL)
        }
        else {
                   
                   self.presentAlert(msg: "Your device does not support calling")
                  
               }
    }
    
    
    
}
