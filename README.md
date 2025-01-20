# FlightSDK

## Requirements:
- **Cocoapods**
- **iOS 13.0 or higher**
- **Swift 5.0 or higher**
- **ShareTrip AccessToken**
- **Facebook SDK setup**
- **Firebase Remote Config**
- **Camera Access Descriptions**

## Installation:

### Step 1: Use a `Podfile` as given bellow:

```ruby
platform :ios, '13.0'

target 'STExample' do
  
  # With specific versions
  pod 'lottie-ios', '3.5.0'
  pod 'Kingfisher', '~> 7.6.2'
  
  # Always latest
  pod "JWT"
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
  
  # Newly Added Pods
  pod 'CRRefresh'
  pod 'ActiveLabel'
  pod 'SkeletonView'
  pod 'MBProgressHUD'
  pod 'MHLoadingButton'
  pod 'XLPagerTabStrip'
  pod 'PanModal', :git => 'https://github.com/sharetripnet/PanModal.git'
  pod 'SwiftEntryKit', :git => 'https://github.com/sharetripnet/SwiftEntryKit.git', :tag => '2.0.8'
  
  # ST Pods
  pod 'FlightSDK', :git => 'https://github.com/sharetripnet/FlightSDK.git', :tag => '1.2.4'
  
end

use_frameworks!

post_install do |installer|
  installer.pods_project.targets.each do |target|
    
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES' # do not remove
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
Save your `Podfile` and run `pod install`

### Step 2: Update Info.plist

Add the following keys to your `Info.plist` file if they are not already present:

```xml
<key>NSCameraUsageDescription</key>
<string>Used to capture a photo for the profile picture and file attachment</string>
<key>NSPhotoLibraryAddUsageDescription</key>
<string>To save the photos shared in conversations with ShareTrip's customer support</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Used to select the photo for the profile picture and file attachment</string>
```

## Usage:

### Step 1: Import FlightSDK

In your ViewController file, add:

```swift
import FlightSDK
```

### Step 2: Configure Firebase and IQKeyboardManager

In your `AppDelegate`:

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()
    IQKeyboardManager.shared.isEnabled = true
    return true
}
```

### Step 3: Initialize the SDK

Configure the SDK with the following code:

```swift
STSDK.shared.delegate = self
STSDK.shared.environment = .live
STSDK.shared.accessToken = "valid access token"
```

### Step 4: Implement Token Validation Callbacks

Add the following delegate methods for token validation:

```swift
extension YourClass: STSDKDelegate {
    func didSuccessTokenValidation() {
        // This method is triggered when token validation succeeded
        // navigationController.pushViewController(FlightSearchVC.instantiate(), animated: true)
    }

    func didFailed(error: String) {
        print("Token validation failed: \(error)")
    }
}
```

### Step 5: Load the Home Page

Create the following view controller to access the home page:

```swift
FlightSearchVC.instantiate()
```
