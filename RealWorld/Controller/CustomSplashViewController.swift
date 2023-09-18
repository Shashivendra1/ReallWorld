//
//  CustomSplashViewController.swift
//  RealWorld
//
//  Created by SAT PAL on 13/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit
struct Json4Swift_Base : Codable {
    let msg : String?
    let code : String?

    enum CodingKeys: String, CodingKey {

        case msg = "msg"
        case code = "code"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
        code = try values.decodeIfPresent(String.self, forKey: .code)
    }

}


class CustomSplashViewController:BaseViewController { // UIViewController , {
    
    var  checkDevice : Json4Swift_Base?
    
    @IBOutlet weak var player_view: AVPlayerView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    VideoPlayer.instance?.playVideo(player_view: player_view)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(afterTimer), userInfo: nil, repeats: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        VideoPlayer.instance?.stopVideo()
    }
    
   
    
    deinit {
        
        print("Custom Splash Screen deinit")
    }
    
    @objc func afterTimer() {
        
        if Singleton.sharedInstance.loginModel != nil {
            var User_id = Singleton.sharedInstance.loginModel?.first?.data?.id ?? 0
            
            
            ApiCall(User_id: User_id)
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
            print("dbhvv")
            self.navigationController?.pushViewController(vc, animated: true)
            
            
        }else {
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
        
    }
    
    // func callApi
    
    let device_id = UserDefaults.standard.string(forKey: "device_id")

    func ApiCall (User_id : Int) {
            //key,user_id,device_id
            let param : [String:Any] = [ "key" : "5642vcb546gfnbvb7r6ewc211365v13122" ,"user_id" : User_id ,"device_id" : device_id! ]
            
           // print(param)
            
            ApiManager.apiPost(url:  Api.check_device, param: param, ref: self) { [weak self] (json, error) in
                
                guard let self = self else { return  }
                
                if error != nil{
                    print(error?.localizedDescription ?? "")
                }else {
                    guard let data = json else {
                        print("error")
                        return
                        
                    }
                    do {
                        self.checkDevice = try JSONDecoder().decode(Json4Swift_Base.self, from: data)

                        if (self.checkDevice?.code) == "200" {

                            
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
                            print("dbhvv")
                            self.navigationController?.pushViewController(vc, animated: true)
                            
                            
                            }
                        else {
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
                            
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                    }catch  {
                        print("err \(error)")
                    }
                }
                
            }
            
        } // end api call func
    
    
}
