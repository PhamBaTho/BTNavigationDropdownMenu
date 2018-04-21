#
# Be sure to run `pod lib lint DYBadgeButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DYBadge'
  s.version          = '2.0'
  s.summary          = 'Pop up badge, written in Swift. Add as subview to any UIView object.'
  s.swift_version = '4.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    Pop up badge which can be added to any UIView or UIView subclass (written in Swift 4.0).
                       DESC

  s.homepage         = 'https://github.com/DominikButz/DYBadge'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dominikbutz' => 'dominikbutz@gmail.com' }
  s.source           = { :git => 'https://github.com/DominikButz/DYBadge.git', :tag => s.version.to_s }


  s.ios.deployment_target = '9.3'

  s.source_files = 'DYBadgeExample/DYBadge/**/*'
  
  # s.resource_bundles = {
  #   'DYBadge' => ['DYBadge/Assets/*.png']
  # }

  s.public_header_files = 'DYBadgeExample/DYBadge/**/*.h'

end
