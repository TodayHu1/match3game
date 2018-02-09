//
//  ChoiceLevelViewController.swift
//  match3
//
//  Created by Даниленко Данила Сергеевич on 13.11.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import UIKit


var lvlContainer = [
    "nameLevel": "1123",
    "nowLevel": 1,
    "maxLevel": 10,
    "difficulty": 0,
    "access": true
    ] as [String : Any]

class ChoiceLevelViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToLvl" {
            if let vc = segue.destination as? GameViewController {
                print("sender ", sender)
                vc.lvlName = sender as! String
            }
        }
    }
    
    @IBAction func StartLvl_SteamPunk(_ sender: Any) {
        print(Int("01"))
        self.performSegue(withIdentifier: "ToLvl", sender: "ArrayTest")
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

