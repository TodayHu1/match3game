//
//  SoulStoneViewController.swift
//  match3
//
//  Created by Евгений on 10.04.2018.
//  Copyright © 2018 Женя. All rights reserved.
//

import UIKit

extension UIButton {
    func shake() {
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
}

class SoulStoneViewController: UIViewController {

    @IBOutlet weak var AttackLabel: UILabel!
    @IBOutlet weak var HealthLabel: UILabel!
    @IBOutlet weak var ArmorLabel: UILabel!
    @IBOutlet weak var ManaLabel: UILabel!
    @IBOutlet weak var CoinLabel: UILabel!
    
    @IBOutlet weak var addToHealth: UIButton!
    @IBOutlet weak var addToArmor: UIButton!
    @IBOutlet weak var addToMana: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initStatBoard()
    }
    
    func initStatBoard() {
        AttackLabel.text = "\(playerStat.attack)"
        HealthLabel.text = "\(playerStat.healthNow)/\(playerStat.healthMax)"
        ArmorLabel.text = "\(playerStat.armorNow)/\(playerStat.armorMax)"
        ManaLabel.text = "\(playerStat.manaNow)/\(playerStat.manaMax)"
        CoinLabel.text = "\(playerStat.gold)"
    }
    
    @IBAction func buyHealth(_ sender: Any) {
        let addHealth = playerStat.healthNow + Int(playerStat.healthMax / 5)
        if playerStat.gold >= 2 {
            if addHealth > playerStat.healthMax {
                playerStat.healthNow = playerStat.healthMax
            }
            else {
                playerStat.healthNow = addHealth
            }
            playerStat.gold -= 2
            initStatBoard()
        }
        else {
            addToHealth.shake()
        }
    }
    
    @IBAction func buyArmor(_ sender: Any) {
        let addArmor = playerStat.armorNow + Int(playerStat.armorMax / 5)
        if playerStat.gold >= 2 {
            if addArmor > playerStat.armorMax {
                playerStat.armorNow = playerStat.armorMax
            }
            else {
                playerStat.armorNow = addArmor
            }
            playerStat.gold -= 2
            initStatBoard()
        }
        else {
            addToArmor.shake()
        }
    }
    
    @IBAction func buyMana(_ sender: Any) {
        let addMana = playerStat.manaNow + Int(playerStat.manaMax / 5)
        if playerStat.gold >= 2 {
            if addMana > playerStat.manaMax {
                playerStat.manaNow = playerStat.manaMax
            }
            else {
                playerStat.manaNow = addMana
            }
            playerStat.gold -= 2
            initStatBoard()
        }
        else {
            addToMana.shake()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
