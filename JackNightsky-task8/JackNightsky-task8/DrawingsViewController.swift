//
//  ViewController.swift
//  JackNightsky-task8
//
//  Created by Jack on 16.07.21.
//

import UIKit

class DrawingsViewController: UIViewController {
    @IBOutlet var planetButton:   AppRegularButton!
    @IBOutlet var headButton:     AppRegularButton!
    @IBOutlet var treeButton:     AppRegularButton!
    @IBOutlet var lanscapeButton: AppRegularButton!
    
    
    enum Pictures : String {
        case planet, head, tree, landscape
    }
    
    var content: Pictures = .planet
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .rsWhite;
        print("===Я родился", self)
        
        let currentPicture: String = PlistWorker.readValue(forKey: "pictureName")
        print(currentPicture)
        
        if (currentPicture == "planet") {
            planetButton.setCurrentState(.active)
            planetButton.isSelected = true
        }
        if (currentPicture == "head") {
            headButton.setCurrentState(.active)
        }
        if (currentPicture == "tree") {
            treeButton.setCurrentState(.active)
        }
        if (currentPicture == "landscape") {
            lanscapeButton.setCurrentState(.active)
        }
        
        print("drasings self: ", self)
    }
    

        
    @IBAction func selectPicture(_ sender: AppRegularButton) {
        
        print("sender.state", sender.state)
        planetButton.setCurrentState(.ready)
        headButton.setCurrentState(.ready)
        treeButton.setCurrentState(.ready)
        lanscapeButton.setCurrentState(.ready)
        
        switch sender.titleLabel?.text?.lowercased() {
        case Pictures.planet.rawValue:
            content = .planet
            print("Choose: ", Pictures.planet)
            planetButton.setCurrentState(.active)

        case Pictures.head.rawValue:
            content = .head
            print("Choose: ", Pictures.head)
            headButton.setCurrentState(.active)
            
        case Pictures.tree.rawValue:
            content = .tree
            print("Choose: ", Pictures.tree)
            treeButton.setCurrentState(.active)
            
        case Pictures.landscape.rawValue:
            content = .landscape
            print("Choose: ", Pictures.landscape)
            lanscapeButton.setCurrentState(.active)
        default:
            print("Picture not changed")
        }
        
        PlistWorker.writeValue(forKey: "pictureName", withValue: sender.titleLabel?.text?.lowercased() ?? "head")
        print("In plist: ", PlistWorker.readValue(forKey: "pictureName"))
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
