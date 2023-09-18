//
//  APIManager.swift
//  RealWorld
//
//  Created by SAT PAL on 08/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import Foundation

class Api {
    
        
        static var base_url_filter = "http://reallworld.com/public/filterapi/"
        static var base_url = "http://reallworld.com/public/realworld/index.php/"
        static var base_url_fav = "http://reallworld.com/api/"
        
        //http://reallworld.com/api/filterproperty?filter_field=Buy
        
        static var homeSearch = "http://reallworld.com/api/filter_property"
        static var getfav = "http://reallworld.com/api/getFavritproperty"
        
        
       static let  sendOtpEmailforgot = "send_otp_forgot"
        static let sendOtpEmail = "send_otp"
        static let check_device = "check_device"
        static var AllDevicelogout = "alldevicelogout"
        static var login = "login"
        static var otp = "http://api.msg91.com/api/sendhttp.php"
        static var signup = "register"
        static var sendFeedback = "send_feedback"
        static var sendCallBackApi = "send_callback"
        static var forgotPassword = "forgetpassword"
        static var paperWork = "send_query_legal_paperwork"
        static var hireToAgent  = "send_query_agent"
        static var postTenantPropert = "post_tenant"
        static var postBuyer = "post_buyer"
        static var getProperties = "getproperties_list"
        static var getUserProperties = "getuser_properties"
        static var getWeeklyProperties = "getproperties_wikelly"
        static var getMonthlyProperties = "getproperties_monthaly"
        static var postComment = "property_comment"
        static var getComment = "getcomment_propertylist"
        static var logout = "logout"
        static var deleteAccount = "accountdelete"
        static var getCity = "getcity"
        static var getLocality = "getlocality"
        static var postProperty = "post_residentialproperty"
        static var getbannerImage = "getbanner"
        static var getuserproperties_images = "getuserproperties_images"
        static var searchBuyResidential = "searchbuyresidential.php"
        static var searchRentResidential = "searchrentresidential.php"
        static var searchBuyCommercial = "searchbuycommercial.php"
        static var searchRentCommercial = "searchrentcommercial.php"
        static var favourite = "favritproperty"
        static var callBackRequest = "CallBackrequest"
        static var Unfavritproperty = "Unfavritproperty"
        static var getFavritproperty = "getFavritproperty"
        static var property_rented = "property_rented"
        static var editpower_updateproperty = "editpower_updateproperty"
        static var viewResponseApi = "addViewcount"
        static var buyourservice = "buyourservice"

        static var filterPage =  "filterproperty"
    
}
    /*
    static var base_url_filter = "http://reallworld.com/public/filterapi/"
    static var base_url = "http://reallworld.com/public/realworld/index.php/"
    static var base_url_fav = "http://reallworld.com/api/"
    
    //http://reallworld.com/api/filterproperty?filter_field=Buy
    
    static var homeSearch = "http://reallworld.com/api/filter_property"
    static var getfav = "http://reallworld.com/api/getFavritproperty"

   
    
    static var login = "login"
    static let sendOtpEmail = "send_otp"
    static var AllDevicelogout = "alldevicelogout"
    static let check_device = "check_device"

    static let  sendOtpEmailforgot = "send_otp_forgot"
    static var otp = "http://api.msg91.com/api/sendhttp.php"
    static var signup = "register"
    static var sendFeedback = "send_feedback"
    static var forgotPassword = "forgetpassword"
    static var paperWork = "send_query_legal_paperwork"
    static var hireToAgent  = "send_query_agent"
    static var postTenantPropert = "post_tenant"
    static var postBuyer = "post_buyer"
    static var getProperties = "getproperties_list"
    static var getUserProperties = "getuser_properties"
    static var getWeeklyProperties = "getproperties_wikelly"
    static var getMonthlyProperties = "getproperties_monthaly"
    static var postComment = "property_comment"
    static var getComment = "getcomment_propertylist"
    static var logout = "logout"
    static var getCity = "getcity"
    static var getLocality = "getlocality"
    static var postProperty = "post_residentialproperty"
    static var getbannerImage = "getbanner"
    static var getuserproperties_images = "getuserproperties_images"
    static var searchBuyResidential = "searchbuyresidential.php"
    static var searchRentResidential = "searchrentresidential.php"
    static var searchBuyCommercial = "searchbuycommercial.php"
    static var searchRentCommercial = "searchrentcommercial.php"
    static var favourite = "favritproperty"
    static var callBackRequest = "CallBackrequest"
    static var Unfavritproperty = "Unfavritproperty"
    static var getFavritproperty = "getFavritproperty"
    static var property_rented = "property_rented"
    static var editpower_updateproperty = "editpower_updateproperty"
    static var viewResponseApi = "addViewcount"



    
    static var filterPage =  "filterproperty"
}
*/
