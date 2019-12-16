#
# Be sure to run `pod lib lint VMGradientProgressBar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '10.0'
s.name = "VMGradientProgressBar"
s.summary = "VMGradientProgressBar lets you create a simple or gradient bar."
s.requires_arc = true

# 2
s.version = "1.0.2"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Vaneet Modgill" => "vaneetmodgill@gmail.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/vaneetmodgill8/VMGradientProgressBar"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/vaneetmodgill8/VMGradientProgressBar.git",
             :tag => "#{s.version}" }

# 8
s.source_files = 'VMGradientProgressBar/Classes/**/*'



# 10

s.swift_version = "4.2"

end
