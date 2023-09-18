//
//  DetailPageViewController.swift
//  RealWorld
//
//  Created by SAT PAL on 08/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit

import WebKit

enum DetailOf {
    
    case aboutUs
    case termCondition
    case privacyPolicy
    
}

class DetailPageViewController: UIViewController , WKUIDelegate, WKNavigationDelegate{
    
    @IBOutlet weak var imageContainer_view: UIView!
    
    @IBOutlet weak var aboutUsTitle_label: UILabel!
    
    @IBOutlet weak var aboutUsDetail_label: UILabel!
    @IBOutlet weak var container_view: UIView!
    
     var webView: WKWebView!
   
   var detailOf : DetailOf = .aboutUs
   
   override func viewDidLoad() {
       super.viewDidLoad()
       
       
        let webConfiguration = WKWebViewConfiguration()
       webView = WKWebView(frame: container_view.frame, configuration: webConfiguration)
              webView.uiDelegate = self
       webView.navigationDelegate = self


       webView.autoresizingMask = [.flexibleRightMargin,.flexibleLeftMargin]
       
     //  self.navigationController?.isNavigationBarHidden = true

       
       if detailOf == .aboutUs {
           
           aboutUsTitle_label.isHidden = false
          // aboutUsDetail_label.isHidden = false
           webView.load(NSURLRequest(url: NSURL(string: "http://reallworld.com/api/about")! as URL) as URLRequest)
           
           container_view.addSubview(webView)

           
           container_view.clipsToBounds = true
           
           aboutUsTitle_label.text = "ABOUT US"
//
//            aboutUsDetail_label.text = "Realllworld is a leading company focusing on the real estate business. We aim at making the selling or leasing of the house easier for the owners as well as customers .Our goal is to make this hectic process much easier by transparency and more efficient by connection the property owners with all the serious brokers and owners who are present in the near vicinity."
       }
       else if detailOf == .termCondition {
           aboutUsTitle_label.isHidden = false

           aboutUsTitle_label.text = "Terms & Conditions"
           webView.load(NSURLRequest(url: NSURL(string: "http://reallworld.com/api/terms")! as URL) as URLRequest)
           
           container_view.addSubview(webView)
           
           container_view.clipsToBounds = true
           
        //   webView.load(NSURLRequest(url: NSURL(string: "http://reallworld.com/public/apprealy/terms.php")! as URL) as URLRequest)
           
           aboutUsTitle_label .text = "Terms & Conditions:"
         //  aboutUsDetail_label.isHidden = true
       }
       else if detailOf == .privacyPolicy {
           aboutUsTitle_label.isHidden = false


           webView.load(NSURLRequest(url: NSURL(string: "http://reallworld.com/api/privacy_policy")! as URL) as URLRequest)
                     
                     container_view.addSubview(webView)
                     
                     container_view.clipsToBounds = true
           
        //   webView.load(NSURLRequest(url: NSURL(string: "http://reallworld.com/public/apprealy/privacy_policy.php")! as URL) as URLRequest)
           
           aboutUsTitle_label.text = "Privacy Policy"
       }
  }
   
   override func viewWillAppear(_ animated: Bool) {
       self.navigationController?.navigationBar.isHidden = true
   }
   override func viewWillDisappear(_ animated: Bool) {
       self.navigationController?.navigationBar.isHidden = false

   }
   override func viewWillLayoutSubviews() {
       
    //   imageContainer_view.layer.cornerRadius = imageContainer_view.frame.height / 2
       
       container_view.layer.cornerRadius = 10
       
   }
   
   @IBAction func back_btn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
   }
}
