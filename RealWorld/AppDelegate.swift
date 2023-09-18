//
//  AppDelegate.swift
//  RealWorld
//
//  Created by SAT PAL on 02/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let device_id = UIDevice.current.identifierForVendor?.uuidString
        UserDefaults.standard.set(device_id, forKey: "device_id")
        
        
        IQKeyboardManager.shared.enable = true
        
        if let data = UserDefaults.standard.value(forKey: "UserData") as? Data {
            
            do{
                let loginData = try JSONDecoder().decode(LoginModel.self, from: data)
                                  Singleton.sharedInstance.loginModel = loginData
                
            }catch {
                
                print("error")
            }
           
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

