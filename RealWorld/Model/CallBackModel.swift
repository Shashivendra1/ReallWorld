//
//  CallBackModel.swift
//  RealWorld
//
//  Created by SAT PAL on 24/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import Foundation


// MARK: - CallBackModel
struct CallBackModel: Codable {
   // let data: [CallBackData]?
    let message, status: String?

    enum CodingKeys: String, CodingKey {
      //  case data = "Data"
        case message, status
    }
}
struct CallBackModel1: Codable {
   //let data: [CallBackData]?
    var msg: String? = ""
    var code : String? = ""
    var message: String? = ""
//    var status: Int? = 0

    enum CodingKeys: String, CodingKey {
      //  case data = "Data"
        case msg, code, message//, status
    }
}


// MARK: - Datum
struct CallBackData: Codable {
    let id, name, email, query: String?
    let mobileNumber: String?

    enum CodingKeys: String, CodingKey {
        case id, name, email, query
        case mobileNumber = "mobile_number"
    }
}
