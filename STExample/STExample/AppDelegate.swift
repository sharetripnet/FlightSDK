//
//  AppDelegate.swift
//  STExample
//
//  Created by ST-iOS on 2/1/23.
//

import UIKit
import FirebaseCore
import FlightSDK
import STCoreSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UISceneDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        FirebaseApp.configure()
        
//        configureSDKs()
        
        self.window?.rootViewController = UINavigationController(rootViewController: HostingVC())
        window?.makeKeyAndVisible()
        
        return true
    }

}

extension AppDelegate: APIClientSessionDelegate {
    func configureSDKs() {
        STCoreConfigs.shared.configure(
            environment: .dev,
            colorScheme: .banglalink,
            authorizationDelegate: self
        )
    }
    
    func loginRequired() {
        EKAlertDisplayer.shared.showLoginDialogue(serviceType: .flight) {[weak self] in
            
            print("required login")
        }
    }
}
