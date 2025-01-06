# ShareTripSDK

## Requirements:
- **Cocoapods**
- **iOS 13.0 or higher**
- **Swift 5.0 or higher**
- **ShareTrip AccessToken**
- **Facebook SDK setup**
- **Firebase Remote Config**
- **Camera Access Descriptions**

## Installation:

### Step 1: Update Podfile

1. Add the following pod to your `Podfile`:

    ```ruby
    pod 'FlightSDK', :git => 'https://github.com/sharetripnet/ShareTripSDK.git', :tag => '1.2.2'
    ```

2. If not already added, include `use_frameworks!` in your `Podfile`.

3. Add the following post-install script:

    ```ruby
    post_install do |installer|
      installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
          config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
        end
      end
    end
    ```

4. Save your `Podfile` and run:

    ```sh
    pod install
    ```

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
STSDK.shared.consumer = .banglalink
STSDK.shared.accessToken = "valid access token"
```

### Step 4: Implement Token Validation Callbacks

Add the following delegate methods for token validation:

```swift
extension YourClass: STSDKDelegate {
    func didSuccessTokenValidation() {
        // This method is triggered when token validation succeeded
        navigationController.pushViewController(FlightSearchVC.instantiate(), animated: true)
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

### Step 6: Switch to Staging Server (Optional)

The SDK defaults to the live server. To use the staging server, configure:

```swift
STSDK.shared.environment = .staging
```

## Dependencies:

ShareTripSDK relies on the following third-party pods:

```ruby
# General Dependencies
pod "JWT"
pod 'PKHUD'
pod 'Alamofire'
pod 'Kingfisher'
pod 'SwiftyJSON'
pod 'FloatingPanel'
pod 'JTAppleCalendar'
pod 'SwiftKeychainWrapper'
pod 'lottie-ios', '3.5.0'
pod 'IQKeyboardManagerSwift'
pod 'Socket.IO-Client-Swift'

# Facebook SDKs
pod 'FBSDKCoreKit', '~> 16.1.0'
pod 'FBSDKLoginKit', '~> 16.1.0'

# Google SDKs
pod 'GoogleSignIn', '~> 8.0.0'

# Firebase SDKs
pod 'FirebaseCore', '11.3.0'
pod 'FirebaseAnalytics', '~> 11.3.0'
pod 'FirebaseCrashlytics', '~> 11.3.0'
pod 'FirebaseAuth', '~> 11.3.0'
pod 'FirebaseRemoteConfig', '~> 11.3.0'
pod 'FirebaseMessaging', '~> 11.3.0'
pod 'FirebaseDynamicLinks', '~> 11.3.0'

# Newly Added Pods
pod 'CRRefresh'
pod 'ActiveLabel'
pod 'SkeletonView'
pod 'MBProgressHUD'
pod 'MHLoadingButton'
pod 'XLPagerTabStrip'
pod 'PanModal', :git => 'https://github.com/sharetripnet/PanModal.git'
pod 'SwiftEntryKit', :git => 'https://github.com/sharetripnet/SwiftEntryKit.git', :tag => '2.0.8'
```

