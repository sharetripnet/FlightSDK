Pod::Spec.new do |s|
    s.name              = 'ShareTripSDK'
    s.version           = '1.0.3'
    s.summary           = 'ShareTripSDK'
    s.homepage          = 'https://github.com/sharetripnet/ShareTripSDK.git'
    s.source            = { :git => 'https://github.com/sharetripnet/ShareTripSDK.git', :tag => '1.0.3' }
    s.author            = { 'Abdul Momen' => 'abdulmomenict@gmail.com' }
    s.license           = { :type => "MIT", :text => "MIT License" }

    s.swift_version     = "5.0"
    s.license           = 'MIT'
    s.requires_arc      = true
    s.platform          = :ios, "11.0"
    s.vendored_frameworks = 'ShareTripSDK.xcframework'
end
