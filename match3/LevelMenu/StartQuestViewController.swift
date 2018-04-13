//
//  StartQuestViewController.swift
//  match3
//
//  Created by Евгений on 12.04.2018.
//  Copyright © 2018 Женя. All rights reserved.
//

import UIKit

class StartQuestViewController: UIViewController {
    
    @IBOutlet weak var bossLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if gameViewController.getBoss(difficulty: lvlDifficulty+1) != nil {
            bossLabel.text = "BOSS"
        }
        else {
            bossLabel.text = "ENEMY"
        }
        
        difficultyLabel.text = "\(lvlDifficulty)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
}
