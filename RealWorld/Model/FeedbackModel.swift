//
//  FeedbackModel.swift
//  RealWorld
//
//  Created by SAT PAL on 09/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import Foundation


// MARK: - FeedbackModel
struct FeedbackModel: Codable {
    let msg, code, id: String?
}

struct sendOTPEmailModel: Codable {
    let msg, code, id: String?
}
