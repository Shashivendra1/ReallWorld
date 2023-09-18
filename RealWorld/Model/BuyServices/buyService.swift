//
//  buyService.swift
//  ReallWorld
//
//  Created by shashivendra sengar on 21/08/22.
//  Copyright © 2022 ArthTech Solutions. All rights reserved.
//


import Foundation

struct buyService : Codable {
    let services : [Services]?
    let status : String?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case services = "services"
        case status = "status"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        services = try values.decodeIfPresent([Services].self, forKey: .services)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}
