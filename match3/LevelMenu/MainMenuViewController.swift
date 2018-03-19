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

var levelStorage = [[String: Any]]()

class MainMenuViewController: UIViewController {
    
    @IBOutlet weak var spellChanger: UIButton!
    
    @IBOutlet weak var labelForSpellChanger: UILabel!
    @IBOutlet weak var labelForTable: UILabel!
    

    @IBOutlet weak var playerImage: UIImageView!
    
    
    override func viewDidLoad() {
        
        if gameViewController == nil {
            gameViewController = GameViewController()
        }


        if playerStat == nil {
            gameViewController.loadGameProgress()
            if playerStat == nil {
                playerStat = PlayerStat(manaMax: 0, healthMax: 10, armorMax: 5, attack: 1, spellArr: ["Null","Null","Null","Null"])
                
                levelStorage = [
                    ["Name": "Tutorial",
                     "LvlNow": 1,
                     "LvlMax": 6,
                     "Access": true
                    ],
                    ["Name": "SteamPunk",
                     "LvlNow": 1,
                     "LvlMax": 15,
                     "Access": false
                    ],
                    ["Name": "RandomDungeon",
                     "LvlNow": 1,
                     "LvlMax": 0,
                     "Access": false
                    ]
                ]
            }
        }
        
        print("\(playerStat.armorNow) --- PLAYER STAT")
        
        print("\(levelStorage) --- LVL")
 

        UILabel.animate(withDuration: 1, animations: {
            self.labelForTable.frame.size.width += 10
            self.labelForTable.frame.size.height += 10
            self.labelForSpellChanger.frame.size.width += 10
            self.labelForSpellChanger.frame.size.height += 10
        }) { _ in
            UIView.animate(withDuration: 1, delay: 0.25, options: [.autoreverse, .repeat], animations: {
                self.labelForTable.frame.origin.y -= 10
                self.labelForSpellChanger.frame.origin.y -= 10
            })
        }
        
        var spellChangerImageArr = [UIImage]()
        var playerImageArr = [UIImage]()
        
        for i in 0...3 {
            playerImageArr.append(UIImage(named: "Player-Stand-\(i).png")!)
            spellChangerImageArr.append(UIImage(named: "SpellChanger-\(i).png")!)
        }
        
        playerImage.animationImages = playerImageArr
        playerImage.animationDuration = 1
        playerImage.startAnimating()
        
        
        spellChanger.setImage(UIImage(named: "SpellChanger-0.png"), for: .normal)
        spellChanger.imageView?.animationImages = spellChangerImageArr
        spellChanger.imageView?.animationDuration = 1.5
        spellChanger.imageView?.startAnimating()
        
        
        print("START ANIMATION")
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        

        
        
    }


}
