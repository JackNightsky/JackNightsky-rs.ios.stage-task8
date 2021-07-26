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
    @objc weak var delegate: DrawingsProtocol!
    
    enum Pictures : String {
        case planet, head, tree, landscape
    }
    
    var content: Pictures = .planet
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set appearance view controller
        self.view.backgroundColor = .rsWhite;
        
        let currentPicture: String = PlistWorker.readValue(forKey: "pictureName")
        
        if (currentPicture == "planet") {
            planetButton.setCurrentState(.active)
        } else if (currentPicture == "head") {
            headButton.setCurrentState(.active)
        } else if (currentPicture == "tree") {
            treeButton.setCurrentState(.active)
        } else if (currentPicture == "landscape") {
            lanscapeButton.setCurrentState(.active)
        }
    }
    

        
    @IBAction func selectPicture(_ sender: AppRegularButton) {
        // Unset active state from all button. Without this step - does not worked
        planetButton.setCurrentState(.ready)
        headButton.setCurrentState(.ready)
        treeButton.setCurrentState(.ready)
        lanscapeButton.setCurrentState(.ready)
        
        switch sender.titleLabel?.text?.lowercased() {
        case Pictures.planet.rawValue:
            content = .planet
            planetButton.setCurrentState(.active)

        case Pictures.head.rawValue:
            content = .head
            headButton.setCurrentState(.active)
            
        case Pictures.tree.rawValue:
            content = .tree
            treeButton.setCurrentState(.active)
            
        case Pictures.landscape.rawValue:
            content = .landscape
            lanscapeButton.setCurrentState(.active)
        default:
            print("Picture not changed")
        }
        
        PlistWorker.writeValue(forKey: "pictureName", withValue: sender.titleLabel?.text?.lowercased() ?? "head")
        
        delegate?.setDrawingPicture(sender.titleLabel?.text?.lowercased() ?? "head")
        navigationController?.popViewController(animated: true)
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
