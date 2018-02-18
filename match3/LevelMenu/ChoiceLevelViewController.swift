//
//  ChoiceLevelViewController.swift
//  match3
//
//  Created by Даниленко Данила Сергеевич on 13.11.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import UIKit


class ChoiceLevelViewController: UIViewController {
    
    @IBOutlet var buttonCollection: [UIButton]!
    
    @IBOutlet var labelCollection: [UILabel]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pageIndex = Int(self.restorationIdentifier as! String)
        let access = (levelStorage[pageIndex!]["Access"] as! Bool)
        let nowLvl = (levelStorage[pageIndex!]["LvlNow"] as! Int)
        let maxLvl = (levelStorage[pageIndex!]["LvlMax"] as! Int)
        
        if !access {
            buttonCollection[0].backgroundColor = UIColor.darkGray
        }
        
        buttonCollection[0].isEnabled = access
        if maxLvl == 0 {
            labelCollection[0].text = String("???")
        }
        else {
            labelCollection[0].text = String("\(nowLvl)/\(maxLvl)")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToLvl" {
            if let vc = segue.destination as? GameViewController {
                print("sender --------- ", sender)
                vc.lvlName = sender as! String
            }
        }
        else {
            print("segue identifier")
        }
    }
    
    
    @IBAction func ToLvl_Tutorial(_ sender: Any) {
        lvlOnReady = 0
        self.performSegue(withIdentifier: "ToLvl", sender: "\(lvlOnReady)-\(String(levelStorage[lvlOnReady]["LvlNow"] as! Int))")
    }
    
    @IBAction func ToLvl_SteamPunk(_ sender: Any) {
        lvlOnReady = 1
        self.performSegue(withIdentifier: "ToLvl", sender: "\(lvlOnReady)-\(String(levelStorage[lvlOnReady]["LvlNow"] as! Int))")
    }
    
    @IBAction func ToLvl_Dungeon(_ sender: Any) {
        lvlOnReady = 2
        self.performSegue(withIdentifier: "ToLvl", sender: "\(lvlOnReady)-\(String(levelStorage[lvlOnReady]["LvlNow"] as! Int))")
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

