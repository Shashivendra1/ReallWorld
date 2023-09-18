//
//  Extension.swift
//  RealWorld
//
//  Created by SAT PAL on 02/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func setPlaceholderColor() {
        
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
}


extension UIButton {
    
    func setButton(borderWidth : Int, borderColor : UIColor, cornerRadius : Float) {
        
        self.layer.borderWidth = CGFloat(borderWidth)
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = CGFloat(cornerRadius)
    }
}

extension UIView {
    
    func setView(borderWidth : Int, borderColor : UIColor, cornerRadius : Float) {
        
        self.layer.borderWidth = CGFloat(borderWidth)
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = CGFloat(cornerRadius)
    }
}

extension String {
    
    func dateFormatConversion(from : String , to : String ) -> String {
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = from

        let currentDate = formatter.date(from: self)
        
        if currentDate != nil {
            
            formatter.dateFormat = to
            
            let convertDate = formatter.string(from: currentDate!)
            
            return convertDate
            
        }else {
            
            print("Error in original date format")
            
            return self
        }
        
    }
}

extension UIColor {
    
        class func navigationColor() -> UIColor {
            
            return  UIColor(red: 128/255, green: 0/255, blue: 128/255, alpha: 1.0)
        }
    
    
    func whiteColor() -> UIColor {
        
        return UIColor.white
    }
    
    func blackColor() -> UIColor {
        
        return UIColor.black
    }
    
    func lightGrayColor() -> UIColor {
           
           return UIColor.lightGray
    }
    
    func darkGrayColor() -> UIColor {
           
           return UIColor.darkGray
    }
    
    func darkGreenColor() -> UIColor {
           
           return UIColor.green
    }
    
    func lightGreenColor() -> UIColor {
           
           return UIColor.green
    }
    
    func lightBlueColor() -> UIColor {
           
           return UIColor.blue
    }
    
    func pinkColor() -> UIColor {
           
           return UIColor.yellow
    }
}


// this extension is used for back call on popup using completion

extension UINavigationController {
    func popViewControllerWithHandler(animated:Bool = true, completion: @escaping ()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popViewController(animated: animated)
        CATransaction.commit()
    }
    
    func pushViewController(viewController: UIViewController, animated:Bool = true,  completion: @escaping ()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
}

// to call this func using completion
/*
 navigationController?.popViewControllerWithHandler(animated: true, completion: {
 print("success")
 })
 
 */
