//
//  MainMenuViewController.swift
//  match3
//
//  Created by Евгений on 07.02.2018.
//  Copyright © 2018 Женя. All rights reserved.
//

import UIKit

var playerStat: PlayerStat!
var gameViewController: GameViewController!

class MainMenuViewController: UIViewController {
    
    
    @IBOutlet weak var labelForTable: UILabel!
    
    override func viewDidLoad() {
        
        if gameViewController == nil {
            gameViewController = GameViewController()
        }
        
        if playerStat == nil {
            gameViewController.loadGameProgress()
            if playerStat == nil {
                playerStat = PlayerStat(mana: 0, health: 10, armor: 5, gold: 0, attack: 1, spellArr: ["Null","Null","Null","Null"])
            }
        }

        UILabel.animate(withDuration: 1, animations: {
            self.labelForTable.frame.size.width += 10
            self.labelForTable.frame.size.height += 10
        }) { _ in
            UIView.animate(withDuration: 1, delay: 0.25, options: [.autoreverse, .repeat], animations: {
                self.labelForTable.frame.origin.y -= 10
            })
        }
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
