//
//  LocalityModel.swift
//  RealWorld
//
//  Created by SAT PAL on 11/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import Foundation

// MARK: - LocalityModel
struct LocalityModel: Codable {
    let msg, code: String?
    let data: [LocalityData]?
}

// MARK: - Datum
struct LocalityData: Codable {
    let id : Int?
    let cityID, localityName: String?

    enum CodingKeys: String, CodingKey {
        case id
        case cityID = "city_id"
        case localityName = "locality_name"
    }
}
