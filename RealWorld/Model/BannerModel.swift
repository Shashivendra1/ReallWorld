//
//  BannerModel.swift
//  RealWorld
//
//  Created by SAT PAL on 11/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import Foundation

// MARK: - BannerImageModelElement
struct BannerImageModelElement: Codable {
    let msg, code: String?
    let data: [BannerData]?
}

// MARK: - Datum
struct BannerData: Codable {
    var id: Int?
    var image: String?
    var property_id: String?
}

typealias BannerImageModel = [BannerImageModelElement]
