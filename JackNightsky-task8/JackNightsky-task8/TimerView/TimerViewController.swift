//
//  TimerViewController.swift
//  JackNightsky-task8
//
//  Created by Jack on 20.07.21.
//

import UIKit

class TimerViewController: UIViewController {
    @IBOutlet var currentDurationLabel: UILabel!
    @IBOutlet var durationSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("Timer hello")
            durationSlider.minimumValue = 1
            durationSlider.maximumValue = 5
        
        let startDuration = Float(PlistWorker.readValue(forKey: "drawDuration"))! / 100
        print("startDuration", startDuration)
        durationSlider.value = startDuration
        
//        let startDurationRounded = round(durationSlider.value * 100) / 100
        currentDurationLabel.text = String("\(startDuration) s")
            
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveChoiseAndCloseVC(_ sender: Any) {
//        print(" round(durationSlider.value * 100)",  Int(round(durationSlider.value * 100)))
        PlistWorker.writeValue(forKey:"drawDuration", withValue: String(Int(round(durationSlider.value * 100))))
//        print("writed value checked", PlistWorker.readValue(forKey: "drawDuration"))
        self.dismiss(animated: true, completion:nil)
    }
    
    @IBAction func sliderMove(_ sender: Any) {
//        print("durationSlider.value", durationSlider.value)
        let currentDurationRounded = round(durationSlider.value * 100) / 100
        currentDurationLabel.text = String("\(currentDurationRounded) s")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
