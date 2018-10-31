#
#  Be sure to run `pod spec lint ZWTool.podspec.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "YYUtility"
  s.version      = "0.0.3.1"
  s.summary      = "Based on YYKit's utility and extension, it is a multfunctional tool"
  s.homepage     = "https://github.com/Initial-C"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "InitialC" => "iwilliamchang@outlook.com" }
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source       = { :git => "https://github.com/Initial-C/YYUtility.git", :tag => "#{s.version}" }
  s.source_files = "CExtension/**/*.{h,m}"
  s.public_header_files = 'CExtension/**/*.{h}'

  non_arc_files = 'CExtension/Base/Foundation/NSObject+YYAddForARC.{h,m}', 'CExtension/Base/Foundation/NSThread+YYAdd.{h,m}'
  # s.exclude_files = "Classes/**/*.{h,m}"
  # s.resource_bundles = {
  #   'TopicResources' => ['Classes/TopicResources/*.{png,xib,nib,bundle,mov}']
  # }
  s.ios.exclude_files = non_arc_files
    s.subspec 'no-arc' do |sna|
      sna.requires_arc = false
      sna.source_files = non_arc_files
    end
  s.dependency 'YYImage'   ,'~> 1.0.4'
  s.dependency 'YYImage/WebP'
  s.dependency 'YYText'    ,'~> 1.0.7'
  s.dependency 'YYModel'   ,'~> 1.0.4'
  s.dependency 'YYCache'   ,'~> 1.0.4'
  s.dependency 'YYWebImage'  ,'~> 1.0.5'
  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

  # s.framework  = "SomeFramework"
  s.frameworks = "UIKit", "CoreMotion"
  # s.frameworks = 'UIKit', 'CoreFoundation', 'CoreText', 'CoreGraphics', 'CoreImage', 'QuartzCore', 'ImageIO', 'AssetsLibrary', 'Accelerate', 'MobileCoreServices', 'SystemConfiguration'

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

end
