//
//  AppDelegate.swift
//  STExample
//
//  Created by ST-iOS on 2/1/23.
//

import UIKit
import FirebaseCore
import ShareTripSDK
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UISceneDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        FirebaseApp.configure()
        IQKeyboardManager.shared.enable = true
        
        STSDK.shared.delegate = self
        STSDK.shared.environment = .live
        STSDK.shared.accessToken = "valid access token"
        self.window?.rootViewController =  UINavigationController(rootViewController: STSDKHomeVC.instantiate())
        window?.makeKeyAndVisible()
        
        return true
    }

}

extension AppDelegate: STSDKDelegate {
    func didSuccessTokenValidation() {
        print("Token is valid")
    }
    
    func didFailed(error: String) {
        print("Token validation errror: \(error)")
    }
}
