//
//  CustomSlider.swift
//  JackNightsky-task8
//
//  Created by Jack on 20.07.21.
//

import UIKit

class CustomSlider: UISlider {

    var sliderIdentifier: Int!

       required init() {
           super.init(frame: CGRect.zero)
           sliderIdentifier = 0
        print("CustomSlider: ", Float(Int(PlistWorker.readValue(forKey: "drawDuration")) ?? 100 / 100))
        self.value = Float(Int(PlistWorker.readValue(forKey: "drawDuration")) ?? 100 / 100)
       }


       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           sliderIdentifier = 0
        print("CustomSlider: ", Float(Int(PlistWorker.readValue(forKey: "drawDuration")) ?? 100 / 100))
        self.value = Float(Int(PlistWorker.readValue(forKey: "drawDuration")) ?? 100 / 100)
       }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
