//
//  SigninModel.swift
//  RealWorld
//
//  Created by SAT PAL on 09/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import Foundation

// MARK: - LoginModelElement
struct LoginModelElement: Codable {
    let data: LoginData?
    let msg, code: String?
    let expiry_date : String?
    
//    enum CodingKeys: String, CodingKey {
//        case expiryDate = "expiry_date"
//
//    }
    

}

// MARK: - DataClass
struct LoginData: Codable {
    let id : Int?
    let name, mobile, email: String?
    let password, memberStatus, catName: String?
    let code: String?
    let loginstatus: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, mobile, email, password
        case memberStatus = "member_status"
        case catName = "cat_name"

        case code, loginstatus
    }
}

typealias LoginModel = [LoginModelElement]

