Pod::Spec.new do |s|
  s.name         = "BTNavigationDropdownMenu"
  s.version      = "0.7"
  s.summary      = "The elegent navigation dropdown menu"
  s.description  = "The elegant yet functional dropdown menu, written in Swift, appears underneath the navigation bar to display a list of defined items when a user clicks on the navigation title."
  s.homepage     = "https://github.com/PhamBaTho/BTNavigationDropdownMenu"
  s.screenshots  = "https://raw.githubusercontent.com/PhamBaTho/BTNavigationDropdownMenu/master/Assets/Demo.png"
  s.license      = "MIT"
  s.author       = { "Tho Pham" => "phambatho@gmail.com" }
  s.platform     = :ios, '9.0'
  s.source       = { :git => "https://github.com/PhamBaTho/BTNavigationDropdownMenu.git", :tag => s.version.to_s }
  s.source_files  = "Source/**/*.swift"
  s.resources = "Source/*.bundle"
  s.requires_arc = true
  s.swift_versions = ['4.0', '4.2', '5.0']
end
