//
//  ChoiceLevelViewController.swift
//  match3
//
//  Created by Даниленко Данила Сергеевич on 13.11.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import UIKit


class ChoiceLevelViewController: UIViewController {
    
    
    @IBOutlet weak var kek1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kek1.isEnabled = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        self.performSegue(withIdentifier: "ToLvl", sender: "0-1")
    }
    
    
    @IBAction func ToLvl_SteamPunk(_ sender: Any) {
        self.performSegue(withIdentifier: "ToLvl", sender: "1-1")
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

