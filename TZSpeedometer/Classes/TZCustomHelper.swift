//
//  TZCustomHelper.swift
//  Pods
//
//  Created by Tasin Zarkoob on 02/05/2019.
//

import UIKit

//Mark: - Appearance structs

/// Readings Text Appearance
struct ReadingsTextAppearance {
    /// default is System font with size 23
    var font : UIFont = UIFont.systemFont(ofSize: 23)
    
    /// default is white
    var textColor : UIColor = .white
    
    /// SemiCircular Gauge which will be the background of the readings Text
    /// Default is gray
    var gaugeBackgroundColor : UIColor = .gray
}

/// Markings Text Appearance
struct MarkingsTextAppearance {
    /// Default is System Font with size 10
    var font : UIFont = UIFont.systemFont(ofSize: 10)
    
    /// Default is white
    var textColor : UIColor = .white
}

/// Indicators Appearance
struct IndicatorsAppearance {
    
    /// Default is gray
    var baseIndicatorColor : UIColor = .gray
    
    /// Default is green
    var positiveIndicatorColor : UIColor = .green
    
    /// Default is yellow
    var negativeIndicatorColor : UIColor = .yellow
    
    /// Default is 20.0
    var baseGirth : CGFloat = 20.0
    
    /// Default is 20.0
    var indicatorGirth : CGFloat = 20.0
}

struct MeterAppearance {
    var readingText  = ReadingsTextAppearance()
    var markingsText = MarkingsTextAppearance()
    var indicators = IndicatorsAppearance()
    
    var backgroundColor = UIColor.black
}

struct Meter {
    /// Maximum Reading displayed by the meter
    var maxReading = 100
    
     /// Minimum Reading displayed by the meter
    var minReading = -100
    
    /// Meter Scale Delta
    var delta = 20
    
    // set true to hide the reading text on the bottom center of the meter
    var isReadingTextHidden = false
    
    init() {}
    
    init(maximumReading: Int, minimumReading: Int, scaleDelta: Int){
        self.maxReading = maximumReading
        self.minReading = minimumReading
        self.delta = scaleDelta
    }
}
