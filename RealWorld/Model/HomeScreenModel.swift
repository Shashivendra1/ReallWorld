//
//  HomeScreenModel.swift
//  RealWorld
//
//  Created by SAT PAL on 10/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//


import Foundation

// MARK: - HomeScreenModelElement
struct HomeScreenModelElement: Codable {
    let totalPages: Int?
    let totalProperties: Int?
    let total_count: Int?

    //var totalProperties: Int?

    var data: [HomeData]?
    let msg,message, code: String?

    enum CodingKeys: String, CodingKey {
        case totalPages = "total_pages"
      case totalProperties = "total_properties"
        case total_count = "total_count"

        case data, msg, code,message
    }
}

// MARK: - Datum
struct HomeData: Codable {
    let id: VariacType?
    
    let houseName: String?
    let city: String?
    let room_size: String?
    let houseArea: String?
    let houseUnit: String?
    let ios_price : String?
    let userName, postUserid : String?
    let price: String?
    let mobile: String?
    let alternativeNumber: String?
    let user_view : Int?
    let call_status: Int?
    
    let propertyCategory: String?
    let propertyType: String?
    let pricePerUnitArea: String?
    let bathroomSize: String?
    let aappartmentType: String?
    let selType: String?
    let roomType: String?
    let regNo, url: String?
    let society: String?
    let verifyStatus: String?
    let datumDescription: String?
    let ownerType: String?
    let balconies, floor: String?
    let cdate: String?
    let totalFloor, status: String?
    let corpetArea: String?
    let locality: String?
    let lat: String?
    let lng: String?

    let image: String?
    let image1: String?
    var ios_rented_status : Int?
    var rentedStatus:Int?
    let callStatus: VariacType?
    let iscomment : String?
    let is_location : String?

    let isedit : String?

    let  bookmark_status:Int

    enum CodingKeys: String, CodingKey {
        case iscomment
        case is_location

        case isedit = "edit_power"
        case bookmark_status
        case id

        case houseName = "house_name"
        case city
        case room_size = "room_size"
        case houseArea = "house_area"
        case houseUnit = "house_unit"
        case ios_price = "ios_price"
        
        case userName = "user_name"
        case postUserid = "post_userid"
        case  mobile,alternativeNumber,lat,lng ,price
        case user_view = "user_view"
        case call_status = "call_status"
        case propertyCategory = "property_category"
        case propertyType = "property_type"
        case pricePerUnitArea = "price_per_unit_area"
        case bathroomSize = "bathroom_size"
        case aappartmentType = "aappartment_type"
        case selType = "sel_type"
        case roomType = "room_type"
        case regNo = "reg_no"
        case url, society
        case verifyStatus = "verify_status"
        case datumDescription = "description"
        case ownerType = "owner_type"
        case balconies, floor, cdate
        case totalFloor = "total_floor"
        case status
        case corpetArea = "corpet_area"
        case locality, image,image1
        case rentedStatus = "rented_status"
        case ios_rented_status = "ios_rented_status"
        case callStatus = "callstatus"
    }
}

public enum VariacType : Codable {
    public func encode(to encoder: Encoder) throws {
        
        //compulsory method
    }

    case int(Int)
    
    case string(String)
    
    case bool(Bool)
    
    public init(from decoder: Decoder) throws {
        
        if let intValue = try? decoder.singleValueContainer().decode(Int.self) {
            
            self = .int(intValue)
            
            return
            
        }
        
        
        if let stringValue = try? decoder.singleValueContainer().decode(String.self) {
            
            self = .string(stringValue)
            
            return
            
        }
        
        if let boolValue = try? decoder.singleValueContainer().decode(Bool.self) {
            
            self = .bool(boolValue)
            
            return
            
        }
        
        throw VariacError.missingValue
    }
    
    enum VariacError: Error {

           case missingValue

       }
}


typealias HomeScreenModel = [HomeScreenModelElement]
