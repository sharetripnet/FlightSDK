//
//  AppDelegate.swift
//  STExample
//
//  Created by ST-iOS on 2/1/23.
//

import UIKit
import FirebaseCore
import FlightSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UISceneDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        FirebaseApp.configure()
      
        STSDK.shared.delegate = self
        STSDK.shared.setToken("valid token", for: .staging)
        self.window?.rootViewController = UINavigationController(rootViewController: FlightSearchVC.instantiate())
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
