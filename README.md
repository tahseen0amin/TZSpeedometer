# TZSpeedometer

<!--[![CI Status](https://img.shields.io/travis/tahseen0amin@gmail.com/TZSpeedometer.svg?style=flat)](https://travis-ci.org/tahseen0amin@gmail.com/TZSpeedometer)-->
[![Version](https://img.shields.io/cocoapods/v/TZSpeedometer.svg?style=flat)](https://cocoapods.org/pods/TZSpeedometer)
[![License](https://img.shields.io/cocoapods/l/TZSpeedometer.svg?style=flat)](https://cocoapods.org/pods/TZSpeedometer)
[![Platform](https://img.shields.io/cocoapods/p/TZSpeedometer.svg?style=flat)](https://cocoapods.org/pods/TZSpeedometer)

TZSpeedometer lets you display the meter with both positive & negative readings. It also supports marking to be shown inside or outside the gauge/meter. Highly customizable and easy to use.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
- Swift 4.2 and above
- iOS 11 and above


## Installation

TZSpeedometer is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TZSpeedometer'
```

For Carthage, Add this to Cartfile
```ruby
github "tahseen0amin/TZSpeedometer"
```


## Usage 
Please check code in Example Project to see how you can customize the TZSpeedometer.

For creating a new TZSpeedometer
```swift
let purpleMeter = TZSpeedometer(frame: CGRect(x: 0, y: 30, width: self.view.bounds.width, height:  height))
purpleMeter.backgroundColor = .purple
self.view.addSubview(purpleMeter))
```

You can also customize the UI of the TZSpeedometer using : `MeterAppearance`. Some of the examples are below
```swift
var apperance = MeterAppearance()
apperance.indicators.positiveIndicatorColor = UIColor.orange
apperance.indicators.baseGirth = 25
apperance.indicators.indicatorGirth = 10
apperance.readingText.gaugeBackgroundColor = UIColor.brown
apperance.readingText.font = UIFont(name: "Menlo", size: 22)!
apperance.markingsText.textColor = .black
apperance.markingsText.font = UIFont(name: "Menlo", size: 11)!
purpleMeter.appearance = apperance
}
```
You can also customize the maximum and minimum reading of the meter and provide scale delta using `Meter`. 
```swift
let meter = Meter(minimumReading: -80, maximumReading: 100, unitText: "km/hr")
meter.scaleDelta = 10
purpleMeter.meter = meter
```
Also, keep in mind, to use the delta which will divide the meter marking in a way that maximum and minimum reading are visible on the meter. Make sure `(maximumReading - minimumReading) / scaleDelta` is Int. 

(NOTE: unit Text label is not shown in the screenshot below. please check Example project for more options.)

Simply Set the reading on the meter.
```swift
purpleMeter.reading = 50
```

## Screenshot
![screenshot](https://github.com/tahseen0amin/TZSpeedometer/blob/master/TZSpeedometer.png)
![screenshot](https://github.com/tahseen0amin/TZSpeedometer/blob/master/TZSpeedometer2.png)


## Author

Tasin Zarkoob, tahseen0amin@gmail.com

## License

TZSpeedometer is available under the MIT license. See the LICENSE file for more info.

## Thanks
Thanks to Ankit Sachan whose code in SemiCircular-Scale was helpful.
