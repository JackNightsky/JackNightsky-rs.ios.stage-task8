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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveChoiseAndCloseVC(_ sender: Any) {
        PlistWorker.writeValue(forKey:"drawDuration", withValue: round(durationSlider.value * 100))
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
