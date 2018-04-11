//
//  MainMenuViewController.swift
//  match3
//
//  Created by Евгений on 07.02.2018.
//  Copyright © 2018 Женя. All rights reserved.
//

import UIKit


class MainMenuViewController: UIViewController {
    
    @IBOutlet weak var tableButton: UIButton!
    @IBOutlet weak var spellChanger: UIButton!
    @IBOutlet weak var soulStone: UIButton!
    
    @IBOutlet weak var labelForSpellChanger: UILabel!
    @IBOutlet weak var labelForTable: UILabel!
    @IBOutlet weak var labelForSoulStone: UILabel!
    
    @IBOutlet weak var stageLabel: UILabel!
    
    @IBOutlet weak var playerImage: UIImageView!
    
    

    @IBOutlet weak var healthNow: UIButton!
    
    @IBOutlet weak var armorNow: UIButton!
    
    @IBOutlet weak var attackNow: UIButton!
    
    @IBOutlet weak var manaNow: UIButton!
    
    @IBOutlet weak var goldNow: UIButton!
    
    @IBAction func startLevelButton(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        
        stageLabel.text = String(lvlDifficulty)
        
        if gameViewController == nil {
            gameViewController = GameViewController()
        }

        if playerStat == nil {
            gameViewController.loadGameProgress()
            self.stageLabel.text = String(lvlDifficulty)
            print("MAIN __ LOAD")
            if playerStat == nil {
                playerStat = PlayerStat(manaMax: 10, healthMax: 30, armorMax: 50, attack: 10, spellArr: ["Null","Null","Null","Null"])
                playerStat.needRevive = false
                gameViewController.saveGameProgress()
                self.stageLabel.text = String(lvlDifficulty)
                print("MAIN __ INIT ON START --\(playerStat.attack) <-> \(playerStat.healthMax)-\(playerStat.healthNow) <-> \(playerStat.armorMax)-\(playerStat.armorNow)")
            }
        }
        else {
            if playerStat.needRevive == true {
                playerStat.needRevive = false
                playerStat = PlayerStat(manaMax: 10, healthMax: 30, armorMax: 50, attack: 10, spellArr: ["Null","Null","Null","Null"])
                lvlDifficulty = 0
                print("MAIN __ REVIVE --\(playerStat.attack) <-> \(playerStat.healthMax)-\(playerStat.healthNow) <-> \(playerStat.armorMax)-\(playerStat.armorNow)")
                lvlDifficulty = 0
                self.stageLabel.text = String(lvlDifficulty)
                gameViewController.saveGameProgress()
            }
            else {
                gameViewController.saveGameProgress()
                self.stageLabel.text = String(lvlDifficulty)
                print("MAIN __ ALREADY PLAY --\(playerStat.attack) <-> \(playerStat.healthMax)-\(playerStat.healthNow) <-> \(playerStat.armorMax)-\(playerStat.armorNow)")
            }
        }
        
        
        healthNow.setTitle(String(playerStat.healthNow), for: .normal)
        armorNow.setTitle(String(playerStat.armorNow), for: .normal)
        attackNow.setTitle(String(playerStat.attack), for: .normal)
        manaNow.setTitle(String(playerStat.manaNow), for: .normal)
        goldNow.setTitle(String(playerStat.gold), for: .normal)

        UILabel.animate(withDuration: 1, animations: {
            self.labelForTable.frame.size.width += 10
            self.labelForTable.frame.size.height += 10

            self.labelForSoulStone.frame.size.width += 10
            self.labelForSoulStone.frame.size.height += 10
            
            self.labelForSpellChanger.frame.size.width += 10
            self.labelForSpellChanger.frame.size.height += 10
        }) { _ in
            UIView.animate(withDuration: 1, delay: 0.25, options: [.autoreverse, .repeat], animations: {
                self.labelForTable.frame.origin.y -= 10
                
                self.labelForSoulStone.frame.origin.y -= 10
                
                self.labelForSpellChanger.frame.origin.y -= 10
            })
        }
        
        var soulStoneImageArr = [UIImage]()
        var spellChangerImageArr = [UIImage]()
        var playerImageArr = [UIImage]()
        
        for i in 0...3 {
            playerImageArr.append(UIImage(named: "Player-Stand-\(i).png")!)
            spellChangerImageArr.append(UIImage(named: "SpellChanger-\(i).png")!)
            soulStoneImageArr.append(UIImage(named: "SoulStone-\(i).png")!)
        }
        
        playerImage.animationImages = playerImageArr
        playerImage.animationDuration = 1
        playerImage.startAnimating()
        
        
        soulStone.setImage(UIImage(named: "SoulStone-0.png"), for: .normal)
        soulStone.imageView?.animationImages = soulStoneImageArr
        soulStone.imageView?.animationDuration = 1.7
        soulStone.imageView?.startAnimating()
        
        
        spellChanger.setImage(UIImage(named: "SpellChanger-0.png"), for: .normal)
        spellChanger.imageView?.animationImages = spellChangerImageArr
        spellChanger.imageView?.animationDuration = 1.5
        spellChanger.imageView?.startAnimating()
        
        
        print("START ANIMATION")
        
        super.viewDidLoad()
    }




}
