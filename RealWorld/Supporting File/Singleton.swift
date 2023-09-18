//
//  Singleton.swift
//  RealWorld
//
//  Created by SAT PAL on 14/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import Foundation

class Singleton {
    
    static var sharedInstance = Singleton()
    
    var loginModel : LoginModel?
}
