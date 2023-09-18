//
//  WebApi.swift
//  RealWorld
//
//  Created by SAT PAL on 08/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
import NVActivityIndicatorView

enum HttpMethod : String {
    case get = "Get"
    case post = "Post"
}


class ApiManager : NSObject {
    
    static var shared: ApiManager {
        return ApiManager()
    }
    
    fileprivate override init()
    {
        
    }
    //MARK:- Upload Image API Interaction
    func uploadImage(_ parameters:[String:Any],view : UIView,parametersImage:[String:UIImage],videoUrl:URL?,addImageUrl:String, showIndicator: Bool,methodType: HTTPMethod, headerVal: [String:String], completion:@escaping(_ response: NSDictionary,_ isSuccess: Bool,_ message: String) -> Void) {
        if NetworkReachabilityManager()!.isReachable {
            if showIndicator {
                LoaderClass.startLoader()
//ActivityIndicator.sharedInstance.showActivityIndicator(view: view)
//                Proxy.shared.showActivityIndicator()
            }
            debugPrint("URL: ",addImageUrl)
            debugPrint("Params: ", parameters)
            debugPrint("Params Image: ", parametersImage)
            debugPrint("Header: ", headerVal)
            AF.upload(multipartFormData: { multipartFormData in
                for (key, val) in parameters {
                    multipartFormData.append((val as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
                for (key, val) in parametersImage {
                    let timeStamp = Date().timeIntervalSince1970 * 1000
                    let fileName = "image\(timeStamp).png"
                    guard let imageData = val.jpegData(compressionQuality: 0.5) else {
                        return
                    }
                    multipartFormData.append(imageData, withName: key, fileName: fileName , mimeType: "image/png")
                }
                if videoUrl != nil {
                    let videoFileName = "video\(Date().timeIntervalSince1970 * 1000).mp4"
                    multipartFormData.append(videoUrl!, withName: "Post[image_file]", fileName: videoFileName, mimeType: "video/mp4")
                }
            },to: addImageUrl,method: methodType, headers: HTTPHeaders(headerVal)).responseJSON { response in
                if response.data != nil && response.error == nil {
                    LoaderClass.stopLoader()
                    //  ActivityIndicator.sharedInstance.hideActivityIndicator()
//                    Proxy.shared.hideActivityIndicator()
                    if let JSON = response.value as? NSDictionary {
                        debugPrint("JSON", JSON)
                        if response.response?.statusCode == 200 {
                            completion(JSON,true,"")
                        } else {
                            if response.response?.statusCode == 401 {
                                let errorMsg = JSON["error"] as? String ?? AppAlerts.titleValue.error
                                completion([:],false, errorMsg)
                            } else if response.response?.statusCode == 426 {
                                let errorMsg = JSON["error"] as? String ?? AppAlerts.titleValue.error
                                completion([:],false, errorMsg)
                            } else {
                                let errorMsg = JSON["error"] as? String ?? AppAlerts.titleValue.error
                                completion([:],false, errorMsg)
                            }
                        }
                    } else {
                      //    ActivityIndicator.sharedInstance.hideActivityIndicator()
                        LoaderClass.stopLoader()
                        Proxy.shared.displayStatusCodeAlert(AppAlerts.titleValue.ErrorUnabletoencodeJSONResponse)
                        if response.data != nil {
                            debugPrint(NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue) ?? AppAlerts.titleValue.error)
                        }
                    }
                } else {
                    //  ActivityIndicator.sharedInstance.hideActivityIndicator()
                    LoaderClass.stopLoader()
//                    Proxy.shared.hideActivityIndicator()
                    if response.data != nil {
                        debugPrint(NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue)!)
                    }
                  //  self.statusHandler(response.response, data: response.data, error: response.error as NSError?)
                }
            }
        } else {
         //     ActivityIndicator.sharedInstance.hideActivityIndicator()
            LoaderClass.stopLoader()
//            Proxy.shared.hideActivityIndicator()
            Proxy.shared.openSettingApp()
        }
    }
    class func apiGet(url: String , type : HttpMethod  ,  isKey : Bool , isChnagesRequired : Bool, isPresentAlert : Bool ,  ref : UIViewController , completionHandler: @escaping (Data?, NSError?) -> ()) {
        
        print(url)
        let header: HTTPHeaders = ["Authorization" : ""]
        
        LoaderClass.startLoader()
        print("\(Api.base_url)\(url)")
        AF.request("\(Api.base_url)\(url)",method: .get,parameters: nil,encoding: URLEncoding.default,headers: header ).responseJSON { (response:AFDataResponse<Any>) in
            print(response.result)
            switch(response.result) {
            case .success(_):
                if let data = response.data{
                    LoaderClass.stopLoader()
                    print(response.value as Any)
                    completionHandler(data, nil )
                }
                break
            case .failure(_):
                LoaderClass.stopLoader()
                // print(response.error as NSError?)
                
                completionHandler(nil, response.error as NSError?)
                break
            }
        }
    }
   
    
    class func apiPost(url: String , param : [String : Any]?, ref : BaseViewController , completionHandler: @escaping (Data?, NSError?) -> ()) {
        
        var param = param
        param?.updateValue("5642vcb546gfnbvb7r6ewc211365v13122", forKey: "key")
        
        print(param!)
        if url == Api.postComment {
            LoaderClass.stopLoader()
        }else {
        print("\(Api.base_url)\(url)")
        LoaderClass.startLoader()
        }
        AF.request("\(Api.base_url)\(url)", method: .post, parameters: param, encoding: URLEncoding.default, headers: nil).responseJSON { (response:AFDataResponse) in
          //  print(response)
            switch(response.result){
            case .success(_):
                if let data = response.data {
                    
                    do {
                        let json =  try JSONSerialization.jsonObject(with: data, options: [])
                        if home == true {
                            LoaderClass.startLoader()
                        }else{
                            LoaderClass.stopLoader()
                        }
                        print(json)
                        
                    }catch  {
                        print(error)
                        
                        
                    }
                    
                    if let dataArray = response.value as? [[String:Any]] {
                        
                        if let code = dataArray[0]["code"] as? String {
                            if code == "200"{
                               
                                }
                           else if code != "200" {
                                
                                if let msg = dataArray[0]["msg"] as? String {
                                    
                                  //  ref.presentAlert(msg: msg)
                                }
                            }
                        }
                    }
                    else if let dic = response.value as? [String:Any] {
                        
                        if let code = dic["code"] as? String {
                            
                            if code != "403" {
                                
                                if let msg = dic["msg"] as? String {
                                    
                                    if msg != "ok" {
                                        
                                       //  ref.presentAlert(msg: msg)
                                    }
                                   
                                }
                                
                            }
                        }
                    }
                    if home == true {
                        LoaderClass.startLoader()
                    }else{
                        LoaderClass.stopLoader()
                    }
                    
                    home = false
                    print(response.value as Any)
                    completionHandler(data,nil)
                    //LoaderClass.stopLoader()
                    
                }
                
                break
            case .failure(_):
                LoaderClass.stopLoader()
                //  print(response.error as NSError?)
                completionHandler(nil,response.error as NSError?)
                break
            }
            
        }
    }
    
    
    class func apiPostWithoutBase(url: String , param : [String : Any]?, ref : BaseViewController , completionHandler: @escaping (Data?, NSError?) -> ()) {
        
        var param = param
        param?.updateValue("5642vcb546gfnbvb7r6ewc211365v13122", forKey: "key")
        
        print(param!)
        print("\(url)")
        
        LoaderClass.startLoader()
        AF.request("\(url)", method: .post, parameters: param, encoding: URLEncoding.default, headers: nil).responseJSON { (response:AFDataResponse) in
            print(response)
            switch(response.result){
            case .success(_):
                if let data = response.data {
                    
                    do {
                        let json =  try JSONSerialization.jsonObject(with: data, options: [])
                        LoaderClass.stopLoader()
                        print(json)
                        
                    }catch  {
                        print(error)
                        
                        
                    }
                    
                    if let dataArray = response.value as? [[String:Any]] {
                        
                        if let code = dataArray[0]["code"] as? String {
                            
                            if code != "200" {
                                
                                if let msg = dataArray[0]["msg"] as? String {
                                    
                                    ref.presentAlert(msg: msg)
                                }
                            }
                        }
                        
                    }
                    else if let dic = response.value as? [String:Any] {
                        
                        if let code = dic["code"] as? String {
                            
                            if code != "403" {
                                
                                if let msg = dic["msg"] as? String {
                                    
                                    ref.presentAlert(msg: msg)
                                }
                                
                            }
                        }
                    }
                    
                    
                    print(response.value as Any)
                    completionHandler(data,nil)
                    
                    
                }
                
                break
            case .failure(_):
                LoaderClass.stopLoader()
                //  print(response.error as NSError?)
                completionHandler(nil,response.error as NSError?)
                break
            }
            
        }
    }
    
    class func apiOtpPost(url: String , param : [String : Any]? , completionHandler: @escaping (Data?, NSError?) -> ()) {
        
        var param = param
        param?.updateValue("290873ACnsgu9J5d5fd88f", forKey: "authkey")
        param?.updateValue("91", forKey: "country")
        param?.updateValue("106", forKey: "route")
        param?.updateValue("MSGOTP", forKey: "sender")
        
        print(param!)
        
        print(url)
        //   let header: HTTPHeaders = ["Authorization" : ""]
        LoaderClass.startLoader()
        AF.request("\(url)", method: .post, parameters: param, encoding: URLEncoding.default, headers: nil).responseJSON { (response:AFDataResponse) in
            print(response)
            switch(response.result){
            case .success(_):
                if let data = response.data{
                    
                    do {
                        let json =  try JSONSerialization.jsonObject(with: data, options: [])
                        print(json)
                        LoaderClass.stopLoader()
                        
                    }
                    catch  
                    {
                        LoaderClass.stopLoader()

                        print(error)
                        
                    }
                    print(response.value as Any)
                    completionHandler(data,nil)
                    
                    
                }
                
                break
            case .failure(_):
                
                //  print(response.error as NSError?)
                LoaderClass.stopLoader()
                completionHandler(nil,response.error as NSError?)
                break
            }
            
        }
    }
    
    
    class func apiPostFilter(url: String , param : [String : Any]? , completionHandler: @escaping (Data?, NSError?) -> ()) {
        
        var param = param
        
        param?.updateValue("5642vcb546gfnbvb7r6ewc211365v13122", forKey: "key")
        
        print("\(Api.base_url_filter)\(url)")
        LoaderClass.startLoader()
        AF.request("\(Api.base_url_filter)\(url)", method: .post, parameters: param, encoding: URLEncoding.default, headers: nil).responseJSON { (response:AFDataResponse) in
            print(response)
            switch(response.result){
            case .success(_):
                if let data = response.data{
                    
                    do {
                        let json =  try JSONSerialization.jsonObject(with: data, options: [])
                        print(json)
                        LoaderClass.stopLoader()
                        
                    }catch  {
                        print(error)
                        
                    }
                    print(response.value as Any)
                    completionHandler(data,nil)
                    
                    
                }
                
                break
            case .failure(_):
                
                //   print(response.error as NSError?)
                LoaderClass.stopLoader()
                completionHandler(nil,response.error as NSError?)
                break
            }
            
        }
    }
    
    
    class func apiGetWithoutBase(url: String , param : [String : Any]?, ref : BaseViewController , completionHandler: @escaping (Data?, NSError?) -> ()) {
        
        
        print("\(url)")
        
        let header: HTTPHeaders = ["Authorization" : ""]
        
        LoaderClass.startLoader()
        
        AF.request("\(url)",method: .get,parameters: nil,encoding: URLEncoding.default,headers: header ).responseJSON  { (response:AFDataResponse<Any>) in
            print(response)
            switch(response.result){
            case .success(_):
                if let data = response.data {
                    
                    do {
                        
                        //  print(response.value)
                        LoaderClass.stopLoader()
                        if (response.value as? Dictionary<String,Any>) != nil {
                            
                            var json = (response.value as! Dictionary<String,Any>)
                            
                            var temp : [[String:Any]] = []
                            
                            
                            
                            let sell = json["Sell"] as! [[String:Any]]
                            
                            json.removeValue(forKey: "Sell")
                            
                            
                            json.updateValue(sell, forKey: "data")
                            
                            temp.append(json)
                            
                            let jsonData = try JSONSerialization.data(withJSONObject: temp, options: .prettyPrinted)
                            
                            completionHandler(jsonData,nil)
                            break
                        }
                        else {
                            
                            //  let json =  try? JSONSerialization.jsonObject(with: data, options: [])
                            //                     print(json)
                            
                            
                            
                            
                            
                            print(response.value as Any)
                            completionHandler(data,nil)
                        }
                        
                        
                        
                        
                        
                    }
                    catch {
                        
                        print(error)
                    }
                    break
                    
                }
                
            case .failure(_):
                //  print(response.error as NSError?)
                LoaderClass.stopLoader()
                completionHandler(nil,response.error as NSError?)
                break
            }
        }
        
    }
    
    
    class func apiGetWithoutBaseWithKey(url: String , param : [String : Any]?, ref : BaseViewController , completionHandler: @escaping (Data?, NSError?) -> ()) {
        
        
        print("\(url)")
        
        let header: HTTPHeaders = ["Authorization" : ""]
        
        print(param)
        LoaderClass.startLoader()
        AF.request("\(url)",method: .get,parameters: param,encoding: URLEncoding.default,headers: header ).responseJSON  { (response:AFDataResponse<Any>) in
            print(response)
            switch(response.result){
            case .success(_):
                if let data = response.data {
                    
                    do {
                        var json =  try JSONSerialization.jsonObject(with: data, options: [])
                        print(json)
                        LoaderClass.stopLoader()
                        
                        var temp_array : [[String:Any]] = []
                        
                        if var filter = json as? [String:Any] {
                            
                            let keys = Array(filter.keys)
                            //all_property
                            if keys.contains("lower_price") {
                                
                                let filterData = filter["lower_price"] as! [[String:Any]]
                                
                                filter.removeValue(forKey: "lower_price")
                                
                                filter.updateValue(filterData, forKey: "data")
                                
                                temp_array.append(filter)
                                
                                let jsonData = try JSONSerialization.data(withJSONObject: temp_array, options: .prettyPrinted)
                                                       
                                                       completionHandler(jsonData,nil)
                                                       break
                                
                                
                            }
                            else if keys.contains("all_property") {
                                
                                let filterData = filter["all_property"] as! [[String:Any]]
                                
                                filter.removeValue(forKey: "all_property")
                                
                                filter.updateValue(filterData, forKey: "data")
                                
                                temp_array.append(filter)
                                
                                let jsonData = try JSONSerialization.data(withJSONObject: temp_array, options: .prettyPrinted)
                                                       
                                                       completionHandler(jsonData,nil)
                                                       break
                                
                                
                            }
                            else if keys.contains("all_Residential_property") {
                                
                                let filterData = filter["all_Residential_property"] as! [[String:Any]]
                                
                                filter.removeValue(forKey: "all_Residential_property")
                                
                                filter.updateValue(filterData, forKey: "data")
                                
                                temp_array.append(filter)
                                
                                let jsonData = try JSONSerialization.data(withJSONObject: temp_array, options: .prettyPrinted)
                                                       
                                                       completionHandler(jsonData,nil)
                                                       break
                                
                                
                            }
                            else if keys.contains("Commercial") {
                                
                                let filterData = filter["Commercial"] as! [[String:Any]]
                                
                                filter.removeValue(forKey: "Commercial")
                                
                                filter.updateValue(filterData, forKey: "data")
                                
                                temp_array.append(filter)
                                
                                let jsonData = try JSONSerialization.data(withJSONObject: temp_array, options: .prettyPrinted)
                                                       
                                                       completionHandler(jsonData,nil)
                                                       break
                                
                                
                            }
                            else if keys.contains("Rent") {
                                
                                let filterData = filter["Rent"] as! [[String:Any]]
                                
                                filter.removeValue(forKey: "Rent")
                                
                                filter.updateValue(filterData, forKey: "data")
                                
                                temp_array.append(filter)
                                
                                let jsonData = try JSONSerialization.data(withJSONObject: temp_array, options: .prettyPrinted)
                                                       
                                                       completionHandler(jsonData,nil)
                                                       break
                                
                            }
                            else if keys.contains("Sell") {
                                
                                let filterData = filter["Sell"] as! [[String:Any]]
                                
                                filter.removeValue(forKey: "Sell")
                                
                                filter.updateValue(filterData, forKey: "data")
                                
                                temp_array.append(filter)
                                
                                let jsonData = try JSONSerialization.data(withJSONObject: temp_array, options: .prettyPrinted)
                                                       
                                                       completionHandler(jsonData,nil)
                                                       break
                                
                                
                            }
                            else if keys.contains("latest_property") {
                                
                                let filterData = filter["latest_property"] as! [[String:Any]]
                                
                                filter.removeValue(forKey: "latest_property")
                                
                                filter.updateValue(filterData, forKey: "data")
                                
                                
                                temp_array.append(filter)
                                
                                let jsonData = try JSONSerialization.data(withJSONObject: temp_array, options: .prettyPrinted)
                                                       
                                                       completionHandler(jsonData,nil)
                                                       break
                            }
                            
                            
                                                   
                            
                            
                        }
                        
                        
                        
                        
                       
                        
                    }catch  {
                        print(error)
                        
                    }
                   
                    print(response.value as Any)
                    completionHandler(data,nil)
                    
                }
                
            case .failure(_):
                LoaderClass.stopLoader()
                //  print(response.error as NSError?)
                completionHandler(nil,response.error as NSError?)
                break
            }
        }
        
    }
    
    
    class func apiGetWithoutBaseWithKeyOriginally(url: String , param : [String : Any]?, ref : BaseViewController , completionHandler: @escaping (Data?, NSError?) -> ()) {
        
        var param = param
        
        print("\(url)")
        
        
        
        let header: HTTPHeaders = ["Authorization" : ""]
        
        param?.updateValue("5642vcb546gfnbvb7r6ewc211365v13122", forKey: "key")
        
        print(param)
        LoaderClass.startLoader()
        AF.request("\(url)",method: .post,parameters: param,encoding: URLEncoding.default,headers: header ).responseJSON  { (response:AFDataResponse<Any>) in
            print(response)
            switch(response.result){
            case .success(_):
                if let data = response.data {
                    LoaderClass.stopLoader()
                    completionHandler(data,nil)
                    break
                    
                }
                
            case .failure(_):
                LoaderClass.startLoader()
                //  print(response.error as NSError?)
                completionHandler(nil,response.error as NSError?)
                break
            }
        }
        
    }
}
//MARK:- Loader Class
class LoaderClass {
    class func startLoader() {
        let activityData = ActivityData(size: CGSize(width: 60, height: 60), message: "Loading", messageFont: nil, type: NVActivityIndicatorType.ballRotateChase, color: .white, padding: 0, displayTimeThreshold: nil, minimumDisplayTime: nil, backgroundColor: NVActivityIndicatorView.DEFAULT_BLOCKER_BACKGROUND_COLOR, textColor: UIColor.white)
            NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
    }
    
    class func stopLoader() {
          NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
    }
}

