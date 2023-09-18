//
//  CityModel.swift
//  RealWorld
//
//  Created by SAT PAL on 10/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import Foundation
// MARK: - CityModel
struct CityModel: Codable {
    let msg, code: String?
    let data: [CityData]?
}

// MARK: - Datum
struct CityData: Codable {
    let id : Int?
    let cityName: String?
    var isSelected:String?

    enum CodingKeys: String, CodingKey
    {
        case id
        case cityName = "city_name"
    }
}

typealias CommentModel = [CommentData]

struct CommentData : Codable {
    let msg :String?
    let code : String?
    let data : [GetCommentData]
}

struct GetCommentData : Codable {
    
    let id : Int?
    let user_id : String?
    let property_id : String?
    let message : String?
    let cdate :String?
}
