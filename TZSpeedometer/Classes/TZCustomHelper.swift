//
//  TZCustomHelper.swift
//  Pods
//
//  Created by Tasin Zarkoob on 02/05/2019.
//

import UIKit

//Mark: - Appearance structs

/// Readings Text Appearance
public struct ReadingsTextAppearance {
    /// default is System font with size 23
    public var font : UIFont = UIFont.systemFont(ofSize: 23)
    
    /// default is white
    public var textColor : UIColor = .white
    
    /// SemiCircular Gauge which will be the background of the readings Text
    /// Default is gray
    public var gaugeBackgroundColor : UIColor = .gray
    
    public init() {}
}

/// Reading Unit Appearance
public struct UnitTextAppearance {
    /// default is System font with size 12
    public var font : UIFont = UIFont.systemFont(ofSize: 12)
    
    /// default is white
    public var textColor : UIColor = .white
    
    public init() {}
}

/// Markings Text Appearance
public struct MarkingsTextAppearance {
    /// Default is System Font with size 10
    public var font : UIFont = UIFont.systemFont(ofSize: 10)
    
    /// Default is white
    public var textColor : UIColor = .white
    
    public init() {}
}

/// Indicators Appearance
public struct IndicatorsAppearance {
    
    /// Default is gray
    public var baseIndicatorColor : UIColor = .gray
    
    /// Default is green
    public var positiveIndicatorColor : UIColor = .green
    
    /// Default is yellow
    public var negativeIndicatorColor : UIColor = .yellow
    
    /// Default is 20.0
    public var baseGirth : CGFloat = 20.0
    
    /// Default is 20.0
    public var indicatorGirth : CGFloat = 20.0
    
    public init() {}
}

public struct MeterAppearance {
    public var readingText  = ReadingsTextAppearance()
    public var markingsText = MarkingsTextAppearance()
    public var indicators = IndicatorsAppearance()
    public var unitText = UnitTextAppearance()
    public init() {}
}



public struct Meter {
    /// Maximum Reading displayed by the meter
    public var maxReading = 100
    
     /// Minimum Reading displayed by the meter
    public var minReading = -100
    
    /// Meter Scale Delta
    public var delta = 20
    
    /// Meter Scale Unit Text
    public var unitText = "km/hr"
    
    // set true to hide the reading text on the bottom center of the meter
    public var isReadingTextHidden = false
    
    /// set false to show marking outside, Default is true
    public var isMarkingsInside = true
    
    public init() {}
    
    public init(minimumReading: Int, maximumReading: Int, unitText: String){
        self.maxReading = maximumReading
        self.minReading = minimumReading
        self.unitText = unitText
    }
}
