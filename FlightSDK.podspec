Pod::Spec.new do |s|
    s.name              = 'FlightSDK'
    s.version           = '3.5.0'
    s.summary           = 'FlightSDK'
    s.homepage          = 'https://github.com/sharetripnet/FlightSDK.git'
    s.source            = { :git => 'https://github.com/sharetripnet/FlightSDK.git', :tag => s.version.to_s }
    s.author            = { 'Abdul Momen' => 'abdulmomenict@gmail.com' }
    s.license           = { :type => "MIT", :text => "MIT License" }
    s.swift_version     = "5.0"
    s.requires_arc      = true
    s.platform          = :ios, "16.0"
    s.vendored_frameworks = ['FlightSDK.xcframework', 'STCoreSDK.xcframework']
end