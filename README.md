# ShareTripSDK

## Requirements:
- Cocoapods
- iOS 11.0 or higher
- Swift 5.0 or higher
- ShareTrip AccessToken
- Firebase Remote Config 
- Camera Access Descriptions

 
## Installation:

1. Add the following pod to your `Podfile`:

```
pod 'ShareTripSDK', '1.0.1'
```

2. If not already added, add `use_frameworks!` to your `Podfile`.

3. Add the following to your `Podfile`:

```
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
    end
  end
end
```
Save `Podfile` and run `pod install`

4. Add the following key in the firebase remote config of type `String`

Key: ```flight_discount_options``` 

Value:
```
[
   {
      "type":"earnTC",
      "title":"I want to earn TripCoins",
      "subtitle":"*Instant discount for our partner banks' card holders"
   },
   {
      "type":"redeemTC",
      "title":"I want to redeem TripCoins",
      "subtitle":"Drag to slider to redeem trip coin"
   },
   {
      "type":"useCoupon",
      "title":"I want to use Coupon Code",
      "subtitle":"Enter the coupon code"
   }
]
```

5. Add the following values to your `info.plist` file if they don't already exist:

```
<key>NSCameraUsageDescription</key>
<string>Used to capture photo for profile picture and file attachment</string>
<key>NSPhotoLibraryAddUsageDescription</key>
<string>To be able to save the photos you share in conversations with ShareTrip's customer support</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Used to select photo for profile picture and file attachment</string>
```


## Usage:

1. Import `ShareTripSDK` in your ViewController file.

2. Initialize the SDK using the access token provided by ShareTrip auth API:

```
STSDK.shared.accessToken = "staccesstoken"
```

3. Configure the Firebase and IQKeyboardManager if already not done.

```
FirebaseApp.configure()
IQKeyboardManager.shared.enable = true
```

4. Create the view controller specifically created for Banglalink:

```
navigationController?.pushViewController(MyBLHomeVC.instantiate(), animated: true)
```

## Dependencies:

ShareTripsSDK depends on follwing third party pods 

 - 'JWT'
 - 'PKHUD'
 - 'Base64'
 - 'Koloda'
 - 'BlueECC'
 - 'BlueRSA'
 - 'Alamofire'
 - 'lottie-ios'
 - 'SwiftyJSON'
 - 'Kingfisher'
 - 'Bolts-Swift'
 - 'BlueCryptor'
 - 'GoogleSignIn'
 - 'FBSDKCoreKit'
 - 'FirebaseAuth'
 - 'FloatingPanel'
 - 'FBSDKLoginKit'
 - 'FBSDKShareKit'
 - 'ImageSlideshow'
 - 'JTAppleCalendar'
 - 'FirebaseFirestore'
 - 'FirebaseAnalytics'
 - 'FirebaseMessaging'
 - 'FirebaseCrashlytics'
 - 'FirebaseRemoteConfig'
 - 'FirebaseDynamicLinks'
 - 'SwiftKeychainWrapper'
 - 'Socket.IO-Client-Swift'
 - 'IQKeyboardManagerSwift'
 - 'FirebaseCoreDiagnostics'
