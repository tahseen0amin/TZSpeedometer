//
//  TZSpeedometer.swift
//  Pods
//
//  Created by Tasin Zarkoob on 02/05/2019.
//

import UIKit

class TZSpeedometer: UIView {
    
    //MARK: - public variables
    var appearance = MeterAppearance() {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    var meter = Meter() {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    var reading : CGFloat = 0 {
        didSet {
            if (reading < CGFloat (meter.minReading)){
                self.reading = CGFloat (meter.minReading)
            } else if (reading > CGFloat (meter.maxReading)){
                self.reading  =  CGFloat (meter.maxReading)
            }
            self.showReading()
        }
    }
    
    
    //MARK: - private variables
    private let positiveIndicatorLayer = CAShapeLayer()
    private let negativeIndicatorLayer = CAShapeLayer()
    private let baseSemiCircleLayer = CAShapeLayer()
    private let meterReadingSemiCircleLayer = CAShapeLayer()
    private let meterReadingLargeText = UILabel(frame: .zero)
    private var markingNames : [String] = []
    private var markingLabels: [UILabel] = [] {
        didSet {
            self.setNeedsLayout()
        }
    }
    private var zeroValueIndex: Int!
    private var zeroValueAngle: Double = Double.pi
    lazy private var meterCenter = CGPoint (x: self.frame.size.width / 2, y: self.frame.size.height )
    lazy private var meterRadius = self.frame.size.width / 2 - 50
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupMeterScale()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupMeterScale()
    }
    
    private func setupMeterScale() {
        prepareMarkings()
        setupMarkings()
    }
    
    private func prepareMarkings(){
        let diff = meter.maxReading - meter.minReading
        let markingsCount = Int(diff/meter.delta)
        var values : [String] = []
        
        for index in 0...markingsCount {
            let value = meter.minReading + index * meter.delta
            if value == 0 {
                zeroValueIndex = index
            }
            values.append("\(value)")
        }
        self.markingNames = values
    }
    
    private func setupMarkings(){
        for lab in markingLabels {
            lab.removeFromSuperview()
        }
        markingLabels.removeAll(keepingCapacity: true)
        
        var values : [UILabel] = []
        
        for index in 0..<markingNames.count {
            let label = UILabel(frame: .zero)
            label.text = markingNames[index]
            label.textAlignment = .left
            values.append(label)
        }
        self.markingLabels = values
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // SETUP BASE SEMI CIRCULAR LAYER
        let circlePath = UIBezierPath(arcCenter: meterCenter, radius: meterRadius, startAngle: CGFloat(Double.pi), endAngle: CGFloat(Double.pi * 2), clockwise: true)
        baseSemiCircleLayer.path = circlePath.cgPath
        baseSemiCircleLayer.strokeColor = appearance.indicators.baseIndicatorColor.cgColor
        baseSemiCircleLayer.fillColor = UIColor.clear.cgColor
        baseSemiCircleLayer.lineWidth = appearance.indicators.baseGirth
        baseSemiCircleLayer.strokeStart = 0
        baseSemiCircleLayer.strokeEnd  = 1
        self.layer.addSublayer(baseSemiCircleLayer)
        
        
        if markingLabels.count > 0 && zeroValueIndex != nil {
            // find zero reading Angle
            let deltaAngle = Double.pi / Double(markingLabels.count - 1)
            zeroValueAngle = Double.pi + (deltaAngle * Double(zeroValueIndex))
            
            // Calculate Angles for Postive and Negative indicators
            let endAngle : CGFloat = CGFloat(Double.pi)
            let startAnglePositive : CGFloat = CGFloat(zeroValueAngle)
            let endAnglePositive : CGFloat = CGFloat(Double.pi * 2)
            
            // SETUP POSITIVE INDICATORS
            let positiveCirclePath = UIBezierPath(arcCenter: meterCenter, radius: meterRadius, startAngle: startAnglePositive, endAngle: endAnglePositive, clockwise: true)
            positiveIndicatorLayer.path = positiveCirclePath.cgPath
            positiveIndicatorLayer.strokeColor = appearance.indicators.positiveIndicatorColor.cgColor
            positiveIndicatorLayer.fillColor = UIColor.clear.cgColor
            positiveIndicatorLayer.lineWidth = appearance.indicators.indicatorGirth
            positiveIndicatorLayer.strokeStart = 0
            positiveIndicatorLayer.strokeEnd  = 0
            self.layer.addSublayer(positiveIndicatorLayer)
            
            let negativeCirclePath = UIBezierPath(arcCenter: meterCenter, radius: meterRadius, startAngle: startAnglePositive, endAngle: endAngle, clockwise: false)
            negativeIndicatorLayer.path = negativeCirclePath.cgPath
            negativeIndicatorLayer.strokeColor = appearance.indicators.negativeIndicatorColor.cgColor
            negativeIndicatorLayer.fillColor = UIColor.clear.cgColor
            negativeIndicatorLayer.lineWidth = appearance.indicators.indicatorGirth
            negativeIndicatorLayer.strokeStart = 0
            negativeIndicatorLayer.strokeEnd  = 0
            self.layer.addSublayer(negativeIndicatorLayer)
            
            
            for index in 0..<markingLabels.count {
                let label = markingLabels[index]
                label.font = appearance.markingsText.font
                label.textColor = appearance.markingsText.textColor
                let labelTextSize = label.text?.size(withAttributes: [NSAttributedString.Key.font: label.font!])
                let theta = Double.pi + (deltaAngle * Double(index))
                let meterWidth = appearance.indicators.baseGirth
                let x = CGFloat ( Double(meterCenter.x) + Double(10.0 + meterRadius + meterWidth/2.0 ) * cos(theta) )
                let y = CGFloat (Double(meterCenter.y) + Double(10.0 + meterRadius + meterWidth/2.0 ) * sin(theta))
                label.frame = CGRect(x: x, y: y, width: (labelTextSize?.width)!, height: labelTextSize!.height)
                if ((index == 0) || (index ==  (markingLabels.count-1))) {
                    label.center = CGPoint(x: x, y: y - 5.0)
                }else{
                    label.center = CGPoint(x: x, y: y)
                }
                self.addSubview(label)
                self.bringSubviewToFront(label)
            }
            
            // Large Text Layout
            if !meter.isReadingTextHidden && markingNames.count > 0 {
                var largeTextRadius = Int(meterRadius / 4)
                let largeTextSize = markingNames.last!.size(withAttributes: [NSAttributedString.Key.font : appearance.readingText.font])
                if largeTextRadius < Int(largeTextSize.width) {
                    largeTextRadius = Int(largeTextSize.width) + 5
                }
                let largeTextSemiCircularPath = UIBezierPath(arcCenter: meterCenter, radius: CGFloat(largeTextRadius), startAngle: CGFloat(Double.pi), endAngle: CGFloat(Double.pi * 2), clockwise: true)
                print(largeTextRadius)
                
                meterReadingSemiCircleLayer.path = largeTextSemiCircularPath.cgPath
                meterReadingSemiCircleLayer.strokeColor = UIColor.clear.cgColor
                meterReadingSemiCircleLayer.fillColor = appearance.readingText.gaugeBackgroundColor.cgColor
                meterReadingSemiCircleLayer.lineWidth = 0
                meterReadingSemiCircleLayer.strokeStart = 0
                meterReadingSemiCircleLayer.strokeEnd  = 1
                self.layer.addSublayer(meterReadingSemiCircleLayer)
                
                meterReadingLargeText.removeFromSuperview()
                let largeTextCenter = CGPoint(x: meterCenter.x, y: meterCenter.y - largeTextSize.height/2)
                meterReadingLargeText.frame = CGRect(origin: .zero, size: largeTextSize)
                meterReadingLargeText.textColor = appearance.readingText.textColor
                meterReadingLargeText.font = appearance.readingText.font
                meterReadingLargeText.textAlignment = .center
                self.addSubview(meterReadingLargeText)
                meterReadingLargeText.center = largeTextCenter
                meterReadingLargeText.text = "0"
            }
            showReading()
        }
    }
    
    private func showReading(){
        if !meter.isReadingTextHidden {
            meterReadingLargeText.text = "\(Int(reading))"
        }
        
        // zero stroke will tell which indicator to use
        let zeroStrokeOnBaseLayer = Double(0 - CGFloat(meter.minReading))/Double(meter.maxReading - meter.minReading)
        let x = Double(reading - CGFloat(meter.minReading))/Double(meter.maxReading - meter.minReading)
        
        var strokeToPut = x - zeroStrokeOnBaseLayer
        
        if strokeToPut > 0.0 {
            //positive indicator
            strokeToPut = Double(reading - CGFloat(0))/Double(meter.maxReading - 0)
            positiveIndicatorLayer.strokeEnd = CGFloat(strokeToPut)
        } else {
            strokeToPut = zeroStrokeOnBaseLayer - x
            strokeToPut = fabs(1 + Double(reading + CGFloat(meter.minReading))/Double(0 - meter.minReading))
            // negative indicator
            negativeIndicatorLayer.strokeEnd = CGFloat(strokeToPut)
        }
        
    }
}
