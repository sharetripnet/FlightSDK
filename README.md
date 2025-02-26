<h1 style="text-align: center;">FlightSDK (Version 1.2.7)</h1>

## Introduction
FlightSDK by ShareTrip Limited provides developers with the tools to integrate ShareTrip services into their iOS applications.

## Git Repository
Official repository: [FlightSDK GitHub](https://github.com/sharetripnet/FlightSDK.git)

## Release Notes
- Flight V2
- Latest pod support

## Requirements
- CocoaPods installed
- Minimum iOS 13.0 deployment target
- Swift 5.0 or higher
- ShareTrip Access Token
- Facebook SDK setup
- Firebase Remote Config setup
- Camera access permission

## Installation (Required)
Add the following to your **Podfile**:

```ruby
platform :ios, '13.0'
use_frameworks!

target 'STExample' do
  # Specific versions
  pod 'lottie-ios', '3.5.0'
  pod 'Kingfisher', '~> 7.6.2'
  
  # Latest versions
  pod 'JWT'
  pod 'PKHUD'
  pod 'Alamofire'
  pod 'SwiftyJSON'
  pod 'FloatingPanel'
  pod 'JTAppleCalendar'
  pod 'SwiftKeychainWrapper'
  pod 'Socket.IO-Client-Swift'
  pod 'IQKeyboardManagerSwift'
  
  # Firebase SDKs
  pod 'FirebaseCore'
  pod 'FirebaseAnalytics'
  pod 'FirebaseCrashlytics'
  pod 'FirebaseAuth'
  pod 'FirebaseRemoteConfig'
  pod 'FirebaseMessaging'
  pod 'FirebaseDynamicLinks'
  
  # Newly Added
  pod 'CRRefresh'
  pod 'ActiveLabel'
  pod 'SkeletonView'
  pod 'MBProgressHUD'
  pod 'MHLoadingButton'
  pod 'XLPagerTabStrip'
  
  # ShareTrip Forks
  pod 'PanModal', git: 'https://github.com/sharetripnet/PanModal.git'
  pod 'SwiftEntryKit', git: 'https://github.com/sharetripnet/SwiftEntryKit.git', tag: '2.0.8'
  
  # ShareTrip SDK
  pod 'FlightSDK', git: 'https://github.com/sharetripnet/FlightSDK.git', tag: '1.2.7'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES' # Do not remove
    end
    if target.name == 'BoringSSL-GRPC'
      target.source_build_phase.files.each do |file|
        if file.settings && file.settings['COMPILER_FLAGS']
          flags = file.settings['COMPILER_FLAGS'].split
          flags.reject! { |flag| flag == '-GCC_WARN_INHIBIT_ALL_WARNINGS' }
          file.settings['COMPILER_FLAGS'] = flags.join(' ')
        end
      end
    end
  end
end
```

> **Note:** You can change the deployment target, but it must be **13.0 or higher**.

Run:
```sh
pod install
```

## Configure Consumer App (Required)
Add the following to your **Info.plist** file:

```xml
<key>NSCameraUsageDescription</key>
<string>Used to capture a photo for the profile picture and file attachment</string>
<key>NSPhotoLibraryAddUsageDescription</key>
<string>To save the photos you share in conversations with ShareTrip customer support</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Used to select a photo for the profile picture and file attachment</string>
```

## Getting Started (Required)
Import **FlightSDK** in your app:

```swift
import FlightSDK
```

Set the access token:

```swift
STSDK.shared.setToken("valid token", for: .staging)
```

Implement **STSDKDelegate** to get token validation callbacks:

```swift
extension AppDelegate: STSDKDelegate {
    func didSuccessTokenValidation() {
        // Triggered after successful token validation
    }
    
    func didFailed(error: String) {
        print("Token validation failed: \(error)")
    }
}
```

Set the delegate in `AppDelegate` or wherever needed:

```swift
STSDK.shared.delegate = self
```

### Load Flight Search Page
To open the home page with flight booking and history:

```swift
FlightSearchVC.instantiate()
```

## Example Integration
Example app demonstrating ShareTrip SDK integration:  
[Example Project](https://github.com/sharetripnet/FlightSDK.git)

## Support
For questions or assistance, contact **ShareTrip Tech**.

## Conclusion
We hope you find the ShareTrip iOS SDK useful. Your feedback and suggestions are welcome. Enjoy!

