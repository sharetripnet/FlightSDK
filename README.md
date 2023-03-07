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

```
pod 'ShareTripSDK', '1.0.7'
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

2. Initialize the ShareTripSDK in your AppDelegate's

```
func application( _ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {        
    FirebaseApp.configure()
    IQKeyboardManager.shared.enable = true
    STSDK.shared.clientId = "MyBL"
}

```

3. Set access token to be able to book services from ShareTrip Limited.

```
STSDK.shared.accessToken = "staccesstoken"
```

4. To get the token validation callbacks implement the `STSDKDelegate` delegate as follows.

In AppDelegate or where ever you want to get the callbacks, set the delegate
```
STSDK.shared.delegate = self
```

And to get the token validation callbacks, implement the methods as follows
```
extension AppDelegate: STSDKDelegate {
func didSuccessTokenValidation() {
//Triggered after a successful token validation
}

func didFailed(error: String) {
STLog.error("Token validation errror: \(error)")
}
}
```

5. Create the following view controller to get the Home page for Banglalink.

```
MyBLHomeVC.instantiate()
```
To see Flight Search page directly use following view controller.

```
FlightSearchVC.instantiate()
```
To see flight bookings use following view controller.

```
FlightBookingHistoryListVC()
```

6. SDK is deafult to live server of sharetrip, if you want to switch to staging server please add following configuration
```
STSDK.shared.environment = .staging
```

## Dependencies:

ShareTripsSDK depends on follwing third party pods 
 
 - pod 'JWT'
 - pod 'PKHUD'
 - pod 'Base64'
 - pod 'Koloda'
 - pod 'BlueECC'
 - pod 'BlueRSA'
 - pod 'Alamofire'
 - pod 'lottie-ios', '3.5.0'
 - pod 'SwiftyJSON'
 - pod 'Kingfisher', '~> 6.3.1'
 - pod 'Bolts-Swift'
 - pod 'BlueCryptor'
 - pod 'FloatingPanel'
 - pod 'GoogleSignIn'
 - pod 'ImageSlideshow'
 - pod 'JTAppleCalendar'
 - pod 'SwiftKeychainWrapper'
 - pod 'Socket.IO-Client-Swift'
 - pod 'FBSDKCoreKit'
 - pod 'FBSDKLoginKit'
 - pod 'FBSDKShareKit'
 - pod 'FirebaseAuth'
 - pod 'FirebaseFirestore'
 - pod 'FirebaseAnalytics'
 - pod 'FirebaseMessaging'
 - pod 'FirebaseCrashlytics'
 - pod 'FirebaseRemoteConfig'
 - pod 'FirebaseDynamicLinks'
 - pod 'IQKeyboardManagerSwift'
 - pod 'FirebaseCoreDiagnostics'
