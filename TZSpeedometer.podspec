#
# Be sure to run `pod lib lint TZSpeedometer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TZSpeedometer'
  s.version          = '1.0.0'
  s.summary          = 'Custom Speedometer but with negative reading as well.'

  s.description      = <<-DESC
TzSpeedometer lets you display the meter with both positive & negative readings. Highly customizable and easy to use.
                       DESC

  s.homepage         = 'https://github.com/tahseen0amin@gmail.com/TZSpeedometer'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Tasin Zarkoob' => 'tahseen0amin@gmail.com' }
  s.source           = { :git => 'https://github.com/tahseen0amin@gmail.com/TZSpeedometer.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/taseenamin'

  s.ios.deployment_target = '11.0'
  s.swift_version = '4.2'

  s.source_files = 'TZSpeedometer/Classes/**/*'
  
  # s.resource_bundles = {
  #   'TZSpeedometer' => ['TZSpeedometer/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
