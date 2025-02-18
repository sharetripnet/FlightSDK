Pod::Spec.new do |s|
    s.name              = 'FlightSDK'
    s.version           = '1.2.6'
    s.summary           = 'FlightSDK'
    s.homepage          = 'https://github.com/sharetripnet/FlightSDK.git'
    s.source            = { :git => 'https://github.com/sharetripnet/FlightSDK.git', :tag => s.version.to_s }
    s.author            = { 'Abdul Momen' => 'abdulmomenict@gmail.com' }
    s.license           = { :type => "MIT", :text => "MIT License" }

    s.swift_version     = "5.0"
    s.license           = 'MIT'
    s.requires_arc      = true
    s.platform          = :ios, "13.0"
    s.vendored_frameworks = 'FlightSDK.xcframework'
end
