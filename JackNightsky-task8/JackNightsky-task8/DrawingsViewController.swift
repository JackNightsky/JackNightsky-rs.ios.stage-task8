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
            planetButton.setCurrentState(.active)

        case Pictures.head.rawValue:
            content = .head
            print(Pictures.head)
            headButton.setCurrentState(.active)
            
        case Pictures.tree.rawValue:
            content = .tree
            print(Pictures.tree)
            treeButton.setCurrentState(.active)
            
        case Pictures.landscape.rawValue:
            content = .landscape
            print(Pictures.landscape)
            lanscapeButton.setCurrentState(.active)
        default:
            print("Picture not changed")
        }
        
        PlistWorker.writeValue("pictureName", sender.titleLabel?.text?.lowercased() ?? "head")
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
