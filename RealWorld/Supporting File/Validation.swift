//
//  Validation.swift
//  LoanDirect
//
//  Created by prmatics on 4/12/18.
//  Copyright © 2017 Promatics. All rights reserved.
//

import Foundation
import UIKit

class Validation {
    
    static var check = Validation()
    
    func isValidEmail(_ emailString: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: emailString)
    }
    
    func isValidZipCode(_ zipcodeString: String) -> Bool {
        let zipcodeRegex = "[+,0-9]{5}"
        let zipcodeTest = NSPredicate(format: "SELF MATCHES %@", zipcodeRegex)
        return zipcodeTest.evaluate(with: zipcodeString)
    }
    
    func isValidNumber(_ numberString: String) -> Bool {
        let numberRegex = "[0-9]{5,15}"
        let numberTest = NSPredicate(format: "SELF MATCHES %@", numberRegex)
        return numberTest.evaluate(with: numberString)
    }
    
    
    func isValidMobileNumber(_ numberString: String) -> Bool {
        let numberRegex = "[0-9]{8,15}"
        let numberTest = NSPredicate(format: "SELF MATCHES %@", numberRegex)
        return numberTest.evaluate(with: numberString)
    }
    
    func isValidYear(_ yearString: String) -> Bool {
        let yearRegex = "[0-9]{4}"
        let yearTest = NSPredicate(format: "SELF MATCHES %@", yearRegex)
        return yearTest.evaluate(with: yearString)
    }
    ////////////////////////
    
    
    
    func isContainNumerical(_ string : String) -> Bool {
        
        let set = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ")
        
        if string.rangeOfCharacter(from: set.inverted) != nil {
            
            print("ERROR: There are numbers included!")
            
            return true
        }else {
            return false
        }
    }
    
    func isValidAcctNo(_ phoneString: String) -> Bool {
        
        let phoneRegex = "[0-9]{10}"
        
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        
        return phonePredicate.evaluate(with: phoneString)
    }
    
    func isValidBVN(_ phoneString: String) -> Bool {
        
        let phoneRegex = "[0-9]{10}"
        
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        
        return phonePredicate.evaluate(with: phoneString)
    }
    
    func isValidCharacters(_ string: String) -> Bool {
        
              
        let regex = "[A-Za-z ]{1,}"
        
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        
        return test.evaluate(with: string)
        
    }
    
    //"^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
    
    func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9]){8}$")
        return passwordTest.evaluate(with: password)
    }
    
    func isValidCustomPassowrd(_ phoneString: String) -> Bool {
        
        //let phoneRegex = "(?=.*[A-Za-z])(?=.*[$@$!%*#?&])[A-Za-z$@$!%*#?&]{8,}"
        //(?=.*[a-z].*[a-z].*[a-z])
        //"^.*(?=.{6,})(?=.*[a-z])((?=.*[0-9])|(?=.*[$@$!%*#?&])).*$"
        //"(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9]).{8}"
        //(?=.*[a-z])
        //let passRegx = "^.*(?=.{8,})(?=.*[A-Z])(?=.*[0-9])(?=.*[$@$!%*#?&]).*$" // 1 st time right
        //let passRegx = "^.*(?=.{8,})(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*()_+<>?:|~`,.'\"{}]).*$" 2 time right
    
        let passRegx = "^.*(?=.{8,})(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*()_/+<>?:;|~`,.'\"{}\\=-]).*$"
        //"^.*(?=.*[a-z])((?=.*[0-9]).{8,30}|(?=.*[A-Z])(?=.*[$@$!%*#?&])).*$"
        //"^.*(?=.{6,})(?=.*[a-z])(?=.*[0-9])(?=.*[$@$!%*#?&]).*$"
       // "^.*(?=.{6,})(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$@$!%*#?&]).*$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", passRegx)
        return phonePredicate.evaluate(with: phoneString)
    }
   
    func hasValidPasswordLength(_ pstring: String) -> Bool {
        let regex = "[A-Za-z0-9 ]{8,32}"
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        return test.evaluate(with: pstring)
    }
    
    func hasValidRegistrationLength(_ pstring: String) -> Bool {
        let regex = "[A-Za-z0-9]{1,20}"
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        return test.evaluate(with: pstring)
    }
    
    func hasOnlySpace(string: String) -> Bool {
        return string.rangeOfCharacter(from: CharacterSet.whitespaces) == nil
    }

    func isValidPassword(_ string: String) -> Bool {
        let regex = " "
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        return test.evaluate(with: string)
        
    }
    
    func validate(_ string: String, equalTo match: String) -> Bool {
        
        if (string == match) {
            
            return true
            
        }else {
            
            return false
            
        }
    }
}
extension UITextField {
    func isContainedSpecialChar() -> Bool{
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        if self.text!.rangeOfCharacter(from: characterset.inverted) != nil {
            return true
        }else{
            return false
        }
    }
}


