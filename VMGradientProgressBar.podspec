#
# Be sure to run `pod lib lint VMGradientProgressBar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#


Pod::Spec.new do |spec|

  spec.name         = "VMGradientProgressBar"
  spec.version      = "1.0.3"
  spec.summary      = "VMGradientProgressBar lets you create a simple or gradient bar."

  spec.homepage     = "https://github.com/vaneetmodgill8/VMGradientProgressBar"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Vaneet" => "vaneetmodgill@gmail.com" }

  spec.ios.deployment_target = "10.0"
  spec.swift_version = "4.2"

  spec.source        = { :git => "https://github.com/vaneetmodgill8/VMGradientProgressBar.git", :tag => "#{spec.version}" }
  spec.source_files  = "VMGradientProgressBar/**/*.{h,m,swift}"

end
