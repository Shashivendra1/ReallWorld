//
//  Services.swift
//  ReallWorld
//
//  Created by shashivendra sengar on 21/08/22.
//  Copyright © 2022 ArthTech Solutions. All rights reserved.
//


import Foundation
struct Services : Codable {
    let id : Int?
    let title : String?
    let package_name : String?
    let price : Int?
    let isactive : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case title = "title"
        case package_name = "package_name"
        case price = "price"
        case isactive = "isactive"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        package_name = try values.decodeIfPresent(String.self, forKey: .package_name)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        isactive = try values.decodeIfPresent(Int.self, forKey: .isactive)
    }

}
