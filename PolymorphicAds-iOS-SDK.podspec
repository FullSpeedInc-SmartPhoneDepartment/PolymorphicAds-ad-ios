Pod::Spec.new do |s|
  s.name         = "PolymorphicAds-iOS-SDK"
  s.version      = "2.2.4"
  s.summary      = "PolymorphicAds SDK for Objective-c environment"
  s.homepage     = "https://github.com/FullSpeedInc-SmartPhoneDepartment/PolymorphicAds-ad-ios"
  s.license = {
    :type => "Commercial",
    :text => <<-LICENSE
      (C) Full Speed Inc. ALL RIGHTS RESERVED.
    LICENSE
   }
  s.source = {
      :git => "https://github.com/FullSpeedInc-SmartPhoneDepartment/PolymorphicAds-ad-ios.git",
      :tag => "2.2.4"
  }
  s.author        = "Full Speed Inc."
  s.platform     = :ios
  s.resource  = "FSAdNetwork-Resources.bundle"
  s.vendored_framework  = "FSAdNetwork.framework"
  s.requires_arc = true
  s.compiler_flags = '-ObjC'
end
