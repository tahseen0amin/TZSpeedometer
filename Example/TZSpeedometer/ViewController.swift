//
//  ViewController.swift
//  TZSpeedometer
//
//  Created by tahseen0amin@gmail.com on 05/02/2019.
//  Copyright (c) 2019 tahseen0amin@gmail.com. All rights reserved.
//

import UIKit
import TZSpeedometer

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let height = self.view.bounds.width/2
        
        
        // default
        let redMeter = TZSpeedometer(frame: CGRect(x: 0, y: 30, width: self.view.bounds.width, height:  height))
        redMeter.backgroundColor = .red
        redMeter.reading = -60
        self.view.addSubview(redMeter)
        
        // with different appearance
        let greenMeter = TZSpeedometer(frame: CGRect(x: 0, y: (height * 1) + 30, width: self.view.bounds.width, height:  height))
        greenMeter.backgroundColor = .purple
        var apperance = MeterAppearance()
        apperance.indicators.positiveIndicatorColor = UIColor.orange
        apperance.indicators.baseGirth = 25
        apperance.indicators.indicatorGirth = 10
        apperance.readingText.gaugeBackgroundColor = UIColor.brown
        apperance.readingText.font = UIFont(name: "Menlo", size: 22)!
        apperance.markingsText.textColor = .black
        apperance.markingsText.font = UIFont(name: "Menlo", size: 11)!
        greenMeter.appearance = apperance
        greenMeter.reading = 50
        self.view.addSubview(greenMeter)
        
        // with different readings
        let blueMeter = TZSpeedometer(frame: CGRect(x: 0, y: (height * 2) + 30, width: self.view.bounds.width, height:  height))
        self.view.addSubview(blueMeter)
        blueMeter.backgroundColor = .black
        let meter = Meter(maximumReading: 100, minimumReading: -80, scaleDelta: 30)
        blueMeter.meter = meter
        blueMeter.reading = 38
        
        
        // only positive readings and without readings
        let yelloMeter = TZSpeedometer(frame: CGRect(x: 0, y: (height * 3) + 30, width: self.view.bounds.width, height:  height))
        yelloMeter.backgroundColor = .darkGray
        var meter2 = Meter(maximumReading: 100, minimumReading: 0, scaleDelta: 15)
        meter2.isReadingTextHidden = true
        yelloMeter.meter = meter2
        yelloMeter.reading = 44
        self.view.addSubview(yelloMeter)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

