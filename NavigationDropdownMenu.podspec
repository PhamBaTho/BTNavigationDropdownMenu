Pod::Spec.new do |s|
  s.name         = "NavigationDropdownMenu"
  s.version      = "4.0.0"
  s.summary      = "The elegent navigation dropdown menu"
  s.description  = <<-DESC
                   The elegant **dropdown menu**, written in **Swift**, appears underneath **navigation bar** to display a list of related items when a user click on the navigation title.
                   DESC
  s.homepage     = "https://github.com/Xiaoye220/NavigationDropdownMenu"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Xiaoye__220" => "576934532@qq.com" }
  s.platform     = :ios, '8.0'
  s.source       = { :git => "https://github.com/Xiaoye220/NavigationDropdownMenu.git", :tag => "#{s.version}" }
  s.source_files  = "Source/**/*.swift"
  s.resources = "Source/*.bundle"
  
end
