Pod::Spec.new do |s|
  s.name         = "BTNavigationDropdownMenu"
  s.version      = "0.1.0"
  s.summary      = "The elegent navigation dropdown menu"
  s.description  = <<-DESC
                   The elegant **dropdown menu**, written in **Swift**, appears underneath **navigation bar** to display a list of related items when a user click on the navigation title.
                   DESC
  s.homepage     = "https://github.com/PhamBaTho/BTNavigationDropdownMenu"
  # s.screenshots  = "https://github.com/PhamBaTho/BTNavigationDropdownMenu/blob/master/Assets/DemoProject.gif"
  s.license      = "MIT"
  s.author             = { "Pham Ba Tho" => "phambatho@gmail.com" }
  s.social_media_url   = "https://www.facebook.com/phambatho"
  s.platform     = :ios
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/PhamBaTho/BTNavigationDropdownMenu.git", :tag => "0.0.1" }
  s.source_files  = "Source/*"
  s.requires_arc = true
  s.frameworks = "XCTest", "UIKit"
end
