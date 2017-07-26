Pod::Spec.new do |s|
  s.name         = "PolymorphicAds-iOS-SDK"
  s.version      = "2.3.0"
  s.summary      = "PolymorphicAds SDK for Objective-c environment"
  s.homepage     = "https://github.com/FullSpeedInc-SmartPhoneDepartment/PolymorphicAds-ad-ios"
  s.license = {
    :type => "Commercial",
    :text => <<-LICENSE
      (C) Calmbold Inc. ALL RIGHTS RESERVED.
    LICENSE
   }
  s.source = {
      :git => "https://github.com/FullSpeedInc-SmartPhoneDepartment/PolymorphicAds-ad-ios.git",
      :tag => "2.3.0.2"
  }
  s.author        = "Calmbold Inc."
  s.platform     = :ios
  s.resource  = "FSAdNetwork-Resources.bundle"
  s.vendored_framework  = "FSAdNetwork.framework"
  s.requires_arc = true
  s.compiler_flags = '-ObjC'
end
