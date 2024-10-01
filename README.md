# ShareTripSDK

## Requirements:
- Cocoapods
- iOS 11.0 or higher
- Swift 5.0 or higher
- ShareTrip AccessToken
- Facebook SDK setup
- Firebase Remote Config 
- Camera Access Descriptions


## Installation:

1. Add the following pod to your `Podfile`:

```ruby
pod 'ShareTripSDK', :git => 'https://github.com/sharetripnet/ShareTripSDK.git', :tag => '1.2.1'
```

2. If not already added, add `use_frameworks!` to your `Podfile`.

3. Add the following to your `Podfile`:

```ruby
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
    end
  end
end
```
Save `Podfile` and run `pod install`

4. Add the following values to your `info.plist` file if they don't already exist:

```xml
<key>NSCameraUsageDescription</key>
<string>Used to capture photo for profile picture and file attachment</string>
<key>NSPhotoLibraryAddUsageDescription</key>
<string>To be able to save the photos you share in conversations with ShareTrip's customer support</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Used to select photo for profile picture and file attachment</string>
```

## Usage:

1. Import `ShareTripSDK` in your ViewController file.

2. Configure Firebase and IQKeyboard in your AppDelegate

```swift
func application( _ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {        
    FirebaseApp.configure()
    IQKeyboardManager.shared.enable = true
}

```

3. Set access token to be able to book services from ShareTrip Limited and set the delegate.

```swift
STSDK.shared.delegate = self
STSDK.shared.accessToken = "staccesstoken"
```

To get the token validation callbacks, implement the methods as follows
```swift
extension YourClass: STSDKDelegate {
  func didSuccessTokenValidation() {
    //Triggered after a successful token validation
  }

  func didFailed(error: String) {
    STLog.error("Token validation errror: \(error)")
  }
}
```

5. Create the following view controller to get the home page.
```swift
FlightSearchVC.instantiate()
```
From here you will be able to go to the flight search and booking history page.

6. SDK defaults to the live server of ShareTrip, if you want to switch to the staging server please add the following configuration
```swift
STSDK.shared.environment = .staging
```
## Dependencies:

ShareTripsSDK depends on the following third-party pods 
```ruby
pod 'JWT'
pod 'PKHUD'
pod 'Base64'
pod 'Koloda'
pod 'BlueECC'
pod 'BlueRSA'
pod 'Alamofire'
pod 'lottie-ios', '3.5.0'
pod 'SwiftyJSON'
pod 'Kingfisher', '~> 6.3.1'
pod 'Bolts-Swift'
pod 'BlueCryptor'
pod 'FloatingPanel'
pod 'GoogleSignIn'
pod 'ImageSlideshow'
pod 'JTAppleCalendar'
pod 'SwiftKeychainWrapper'
pod 'Socket.IO-Client-Swift'
pod 'FBSDKCoreKit'
pod 'FBSDKLoginKit'
pod 'FBSDKShareKit'
pod 'FirebaseAuth'
pod 'FirebaseCore', '11.3.0'
pod 'FirebaseFirestore'
pod 'FirebaseAnalytics'
pod 'FirebaseMessaging'
pod 'FirebaseCrashlytics'
pod 'FirebaseRemoteConfig'
pod 'FirebaseDynamicLinks'
pod 'IQKeyboardManagerSwift'
```
