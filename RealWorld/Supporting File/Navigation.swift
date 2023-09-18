//
//  Navigation.swift
//  AZY Fetcher
//
//  Created by Apple on 31/07/19.
//  Copyright © 2019 Promatics. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    enum LeftNavType {
        
        case Back
        case SideBar
        case SideBar1

       case CustomBack
    }
    
    enum TitleType {
        case Large
        case Normal
        
        
    }
    
    enum NavRightSide {
        case Search
       case None
        case Cross
        case Sort
    }
    enum NavRightSide1 {
        case Search
       case None
        case Cross
       
    }
    
    enum Center {
        case None
        case Title
        case SearchBar
    }
    
    func removeNavigation() {
        self.navigationController?.removeNavigation()
    }
    
    func addNavigationBar1(leftBar: LeftNavType = .Back, titleType : TitleType = .Normal, title : String = "", bgColor: UIColor = UIColor.clear, barTintColor : UIColor = UIColor.navigationColor() , right rightBarType: NavRightSide1 = .None, center_type CenterTileType : Center =  .None, titleColor : UIColor = UIColor.white ) {
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.topItem?.title = ""
        
        self.navigationController?.view.backgroundColor = bgColor
        

        
        self.navigationController?.navigationBar.barTintColor = barTintColor
        
     
        
        self.title = title
        
        self.navigationItem.title = title
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        } else {
            // Fallback on earlier versions
        }
        
       self.navigationController?.navigationBar.titleTextAttributes =  [NSAttributedString.Key.foregroundColor: titleColor, NSAttributedString.Key.font: UIFont(name: "Futura", size: 20) ?? UIFont.systemFont(ofSize: 22)]
        
        
       
        
        switch titleType {
        case .Large:
            

            if #available(iOS 11.0, *) {
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: barTintColor, NSAttributedString.Key.font: UIFont(name: "Futura", size: 25) ?? UIFont.systemFont(ofSize: 32)]
            } else {
                // Fallback on earlier versions
            }
            
        case .Normal:

            if #available(iOS 11.0, *) {
                self.navigationController?.navigationBar.prefersLargeTitles = false
            } else {
                // Fallback on earlier versions
            }
            
        }
        
        switch leftBar {
            
            case .Back:
                self.navigationController?.navigationItem.hidesBackButton = false
            self.navigationController?.navigationItem.setHidesBackButton(false, animated: false)
              

            case .SideBar:
                
                self.setSideMenu()
                print()
            
        case .CustomBack:
            
            self.setBackButton()
        case .SideBar1:
            self.setSideMenu1()
                print()
            
        }
        
        switch rightBarType {
            
            case .Search:
                
                self.setSearchButton()
                print()
            
        case .None:
            print()
            self.setBackButton1()

//        case .Sort:
//            self.setSortButton()/Users/gaurav/Downloads/RealWorld 25 Jan 2 2 2 3/RealWorld/Supporting File
            
        case .Cross:
            self.setCrossButton()
        }
 
    }
    
    func addNavigationBar(leftBar: LeftNavType = .Back, titleType : TitleType = .Normal, title : String = "", bgColor: UIColor = UIColor.clear, barTintColor : UIColor = UIColor.navigationColor() , right rightBarType: NavRightSide = .None, center_type CenterTileType : Center =  .None, titleColor : UIColor = UIColor.white ) {
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.topItem?.title = ""
        
        self.navigationController?.view.backgroundColor = bgColor
        
        self.navigationController?.navigationBar.barTintColor = barTintColor
       
        self.title = title
        
        self.navigationItem.title = title
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        } else {
            // Fallback on earlier versions
        }
        
       self.navigationController?.navigationBar.titleTextAttributes =  [NSAttributedString.Key.foregroundColor: titleColor, NSAttributedString.Key.font: UIFont(name: "Futura", size: 20) ?? UIFont.systemFont(ofSize: 22)]
        
        
       
        
        switch titleType {
        case .Large:
            

            if #available(iOS 11.0, *) {
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: barTintColor, NSAttributedString.Key.font: UIFont(name: "Futura", size: 25) ?? UIFont.systemFont(ofSize: 32)]
            } else {
                // Fallback on earlier versions
            }
            
        case .Normal:

            if #available(iOS 11.0, *) {
                self.navigationController?.navigationBar.prefersLargeTitles = false
            } else {
                // Fallback on earlier versions
            }
            
        }
        
        switch leftBar {
            
            case .Back:
                self.navigationController?.navigationItem.hidesBackButton = false
            self.navigationController?.navigationItem.setHidesBackButton(false, animated: false)
              

            case .SideBar:
                
                self.setSideMenu()
                print()
            
        case .CustomBack:
            
            self.setBackButton()
        case .SideBar1:
            self.setSideMenu1()
            print()
        }
        
        switch rightBarType {
            
            case .Search:
                
                self.setSearchButton()
                print()
            
        case .None:
            print()
            self.setBackButton1()

        case .Sort: break
          //  self.setSortButton()
            
        case .Cross:
            self.setCrossButton()
        }
 
    }
    //
    
    func setSortButton() {
        
        let search_button = UIButton()
                             
        search_button.setTitle("Sort", for: .normal)
        
        search_button.setTitleColor(UIColor.white, for: .normal)
        
        search_button.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
                             
        search_button.tag = 1
                             
        search_button.addTarget(self, action: #selector(tap_sort_button), for: .touchUpInside)
                             
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: search_button)]
    }
    
    
    @objc func tap_sort_button() {
        
        
    }
    func setBackButton1() {
           
           let search_button = UIButton()
                         let image = UIImage(named: "back")?.withRenderingMode(.alwaysTemplate)
                         
                         search_button.setImage(image, for: .normal)
                         
                         search_button.tintColor = UIColor.white
                         
                         search_button.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
                         
                         search_button.tag = 1
                         
                         search_button.addTarget(self, action: #selector(tap_back_button), for: .touchUpInside)
//                           self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: filter_button) ,UIBarButtonItem(customView: search_button) ]
                     // self.navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: search_button)]
           self.navigationItem.rightBarButtonItems = nil

       }
       
    
    func setBackButton() {
        
        let search_button = UIButton()
                      let image = UIImage(named: "back")?.withRenderingMode(.alwaysTemplate)
                      
                      search_button.setImage(image, for: .normal)
                      
                      search_button.tintColor = UIColor.white
                      
                      search_button.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
                      
                      search_button.tag = 1
                      
                      search_button.addTarget(self, action: #selector(tap_back_button), for: .touchUpInside)
                      
                   self.navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: search_button)]
        
    }
    
    
    @objc func tap_back_button() {
        
        
    }
    
    
    func setCrossButton() {
        
        let search_button = UIButton()
               let image = UIImage(named: "cross")?.withRenderingMode(.alwaysTemplate)
               
               search_button.setImage(image, for: .normal)
               
               search_button.tintColor = UIColor.white
               
               search_button.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
               
               search_button.tag = 1
               
               search_button.addTarget(self, action: #selector(tap_cross_button), for: .touchUpInside)
               
               self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: search_button)]
    }
    
    func setSearchButton() {
        
        let search_button = UIButton()
        let image = UIImage(named: "searchwhite")?.withRenderingMode(.alwaysTemplate)
        
        search_button.setImage(image, for: .normal)
        
        search_button.tintColor = UIColor.white
        
        search_button.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        
        search_button.tag = 1
        
        search_button.addTarget(self, action: #selector(tap_search_button), for: .touchUpInside)
        
        
        let filter_button = UIButton()
        let image2 = UIImage(named: "filter")?.withRenderingMode(.alwaysTemplate)
        
        filter_button.setImage(image2, for: .normal)
        
        filter_button.tintColor = UIColor.white
        
        filter_button.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        
        filter_button.addTarget(self, action: #selector(tap_filter_button), for: .touchUpInside)
        
        
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: filter_button) ,UIBarButtonItem(customView: search_button) ]
    }
    
    @objc func tap_filter_button() {
        
        
    }
    
    @objc func tap_cross_button() {
        
        
    }
    
    @objc
    func tap_search_button() {
         
//      var itemView = NavigationSearch()
//
//
//        itemView = Bundle.main.loadNibNamed("NavigationSearch", owner: nil, options: nil)![0] as! NavigationSearch
//
//
//
//        let view1 = UIView(frame: CGRect(x: 80, y: 0, width: 220, height: 40))
//
//        view1.addSubview(itemView)
//
//        self.navigationItem.titleView = view1
//
//        self.navigationItem.rightBarButtonItems = nil
        
       // self.viewDidLoad()
    }
    
    func setSideMenu1() {
           let circleBack = UIButton()
                  let image = UIImage(named: "menu")?.withRenderingMode(.alwaysTemplate)
                  circleBack.setImage(image, for: .normal)
                  circleBack.tintColor = UIColor.white
                  circleBack.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
                  circleBack.tag = 1
              
                  circleBack.addTarget(self, action: #selector(tap_sideMenu1), for: .touchUpInside)
              
                  self.navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: circleBack)]
       }
    @objc
       func tap_sideMenu1() {
           let alert = UIAlertController(title: "Alert", message: "Please first login", preferredStyle: .alert)
        

                       alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                          // print("Yay! You brought your towel!")
                        self.navigationController?.popViewController(animated: true)
                       }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
        print("Handle Cancel Logic here")
            self.dismiss(animated: true, completion: nil)
        }))
                       self.present(alert, animated: true, completion: nil)
              
                                   
       }
    func setSideMenu() {
        let circleBack = UIButton()
        let image = UIImage(named: "menu")?.withRenderingMode(.alwaysTemplate)
        circleBack.setImage(image, for: .normal)
        circleBack.tintColor = UIColor.white
        circleBack.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        circleBack.tag = 1
    
        circleBack.addTarget(self, action: #selector(tap_sideMenu), for: .touchUpInside)
    
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: circleBack)]
    }
    
    @objc
    func tap_sideMenu() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SideMenuViewController") as! SideMenuViewController
        vc.moveNext = self
        self.transitionVc(vc: vc, duration: 0.1, type: .fromLeft)
    }
    
   
    func transitionVc(vc: UIViewController, duration: CFTimeInterval, type: CATransitionSubtype) {
        let customVcTransition = vc
        let transition = CATransition()
        transition.duration = duration
        transition.type = CATransitionType.fade
        transition.subtype = type
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(customVcTransition, animated: false, completion: nil)
    }
    
    
   
}
