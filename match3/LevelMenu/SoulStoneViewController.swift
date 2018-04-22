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
    @IBOutlet weak var SoulGemLabel: UILabel!
    
    
    @IBOutlet weak var addToHealth: UIButton!
    @IBOutlet weak var addToHealthLabel: UILabel!
    
    @IBOutlet weak var addToArmor: UIButton!
    @IBOutlet weak var addToArmorLabel: UILabel!
    
    @IBOutlet weak var addToMana: UIButton!
    @IBOutlet weak var addToManaLabel: UILabel!
    
    @IBOutlet weak var stoneImage: UIImageView!
    @IBOutlet weak var soulStoneShadow: UIImageView!
    
    @IBOutlet weak var ItemChestGoldLabel: UILabel!
    @IBOutlet weak var LegendaryChestGoldLabel: UILabel!
    
    @IBOutlet weak var ItemChestGemLabel: UILabel!
    @IBOutlet weak var LegandaryChestGemLabel: UILabel!
    
    
    
    let buyHealthConstant = 2
    let buyArmorConstant = 2
    let buyManaConstant = 2
    
    let buyItemChestGoldConstant = 13
    let buyLegendChestGoldConstant = 40
    
    let buyItemChestGemConstant = 40
    let buyLegendChestGemConstant = 150
    
    override func viewDidLoad() {
        
        addToHealthLabel.text = "\(buyHealthConstant) GOLD"
        addToArmorLabel.text = "\(buyArmorConstant) GOLD"
        addToManaLabel.text = "\(buyManaConstant) GOLD"
        
        ItemChestGoldLabel.text = "\(buyItemChestGoldConstant) GOLD"
        LegendaryChestGoldLabel.text = "\(buyLegendChestGoldConstant) GOLD"
        
        ItemChestGemLabel.text = "\(buyItemChestGemConstant) GEM"
        LegandaryChestGemLabel.text = "\(buyLegendChestGemConstant) GEM"

        
        super.viewDidLoad()
        initStatBoard()
        
        UIView.animate(withDuration: 1, delay: 0.25, options: [.autoreverse, .repeat], animations: {
            self.stoneImage.frame.origin.y -= 10
            self.soulStoneShadow.frame.size.width -= 12
            self.soulStoneShadow.frame.size.height -= 4
        })
    }
    
    func initStatBoard() {
        AttackLabel.text = "\(playerStat.attack)"
        HealthLabel.text = "\(playerStat.healthNow)/\(playerStat.healthMax)"
        ArmorLabel.text = "\(playerStat.armorNow)/\(playerStat.armorMax)"
        ManaLabel.text = "\(playerStat.manaNow)/\(playerStat.manaMax)"
        CoinLabel.text = "\(playerStat.gold)"
        SoulGemLabel.text = "\(soulGem)"
    }
    
    @IBAction func buyHealth(_ sender: Any) {
        let addHealth = playerStat.healthNow + Int(playerStat.healthMax / 5)
        if playerStat.gold >= buyHealthConstant {
            if addHealth > playerStat.healthMax {
                playerStat.healthNow = playerStat.healthMax
            }
            else {
                playerStat.healthNow = addHealth
            }
            playerStat.gold -= buyHealthConstant
            initStatBoard()
        }
        else {
            addToHealth.shake()
        }
    }
    
    @IBAction func buyArmor(_ sender: Any) {
        let addArmor = playerStat.armorNow + Int(playerStat.armorMax / 5)
        if playerStat.gold >= buyArmorConstant {
            if addArmor > playerStat.armorMax {
                playerStat.armorNow = playerStat.armorMax
            }
            else {
                playerStat.armorNow = addArmor
            }
            playerStat.gold -= buyArmorConstant
            initStatBoard()
        }
        else {
            addToArmor.shake()
        }
    }
    
    @IBAction func buyMana(_ sender: Any) {
        let addMana = playerStat.manaNow + Int(playerStat.manaMax / 5)
        if playerStat.gold >= buyManaConstant {
            if addMana > playerStat.manaMax {
                playerStat.manaNow = playerStat.manaMax
            }
            else {
                playerStat.manaNow = addMana
            }
            playerStat.gold -= buyManaConstant
            initStatBoard()
        }
        else {
            addToMana.shake()
        }
    }
    
    
    @IBAction func byChestBuyGold(_ sender: UIButton) {
        if playerStat.gold >= buyItemChestGoldConstant {
            playerStat.gold -= buyItemChestGoldConstant
            initStatBoard()
            openChest(chestType: .spellAndItemсhest)
        }
        else {
            sender.shake()
        }
    }
    
    @IBAction func byLegendaryChestByGold(_ sender: UIButton) {
        if playerStat.gold >= buyLegendChestGoldConstant {
            playerStat.gold -= buyLegendChestGoldConstant
            initStatBoard()
            openChest(chestType: .oneLegendChest)
        }
        else {
            sender.shake()
        }
    }
    
    @IBAction func byChestBuyGem(_ sender: UIButton) {
        if soulGem >= buyItemChestGemConstant {
            soulGem -= buyItemChestGemConstant
            initStatBoard()
            openChest(chestType: .spellAndItemсhest)
        }
        else {
            sender.shake()
        }
    }
    
    @IBAction func byLegendaryBuyGem(_ sender: UIButton) {
        if soulGem >= buyLegendChestGemConstant {
            soulGem -= buyLegendChestGemConstant
            initStatBoard()
            openChest(chestType: .legendaryChest)
        }
        else {
            sender.shake()
        }
    }
    
    
    
    func openChest(chestType: ChestType) {
        if let storyboard = storyboard {
            print(storyboard)
            let toMainMenu = storyboard.instantiateViewController(withIdentifier: "ChooseScreen") as! SelectItemViewController
            toMainMenu.chestType = chestType
            navigationController?.pushViewController(toMainMenu, animated: false)
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
