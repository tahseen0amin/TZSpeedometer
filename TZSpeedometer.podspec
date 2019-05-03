Pod::Spec.new do |s|
  s.name             = 'TZSpeedometer'
  s.version          = '1.0.1'
  s.summary          = 'Custom Speedometer but with negative reading as well.'

  s.description      = <<-DESC
TZSpeedometer lets you display the meter with both positive & negative readings. Highly customizable and easy to use.
                       DESC

  s.homepage         = 'https://github.com/tahseen0amin/TZSpeedometer'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Tasin Zarkoob' => 'tahseen0amin@gmail.com' }
  s.source           = { :git => 'https://github.com/tahseen0amin/TZSpeedometer.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/taseenamin'

  s.ios.deployment_target = '11.0'

  s.source_files = 'TZSpeedometer/Classes/**/*'
  
  s.frameworks = 'UIKit'
end
