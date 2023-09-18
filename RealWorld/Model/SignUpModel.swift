//
//  SignUpModel.swift
//  RealWorld
//
//  Created by SAT PAL on 09/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import Foundation

// MARK: - SignUpModelElement
struct SignUpModelElement: Codable {
    let msg, code, id, name: String?
    let mobile, email, loginstatus: String?
}

typealias SignUpModel = [SignUpModelElement]


// MARK: - CustomerRequestDetail
struct DeleteAccount: Codable {
    let status, message: String?
}

typealias DeleteAccountModel = [DeleteAccount]
