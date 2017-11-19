//
//  SpellClass.swift
//  match3
//
//  Created by Евгений on 19.11.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import SpriteKit

class Spell: SKSpriteNode {
    
    private var manaToUse = 0
    private var healthToUse = 0
    private var armorToUse = 0
    private var coinToUse = 0
    
    private var skillName = ""
    
    init(name: String, position: CGPoint){
        super.init(texture: SKTexture(imageNamed: ""), color: UIColor.clear, size: CGSize(width: 41, height: 41))
        self.name = name
        self.position = position
    }

    init(skillName: String, texture: SKTexture, mana: Int, health: Int, armor: Int, coin: Int) {
        super.init(texture: texture, color: UIColor.clear, size: CGSize(width: 41, height: 41))
        self.zPosition = 9600
    
        self.skillName = skillName
        
        self.name = "Spell1"
        self.position = CGPoint(x: -140, y: 80)
        
        self.manaToUse = mana
        self.healthToUse = health
        self.armorToUse = armor
        self.coinToUse = coin
        
        self.initStatSpell()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func useSpell() {
        if self.conditionToUse() {
            print("GO")
            self.changePlayerStat()
            gameScene.nodeAnimationPulseUp(node: self, duration: 0.3, percentValuePulsation: 20)
            gameScene.castSpell(skillName: skillName)
        }
        else {
            print("UNGO")
        }
    }
    
    private func initStatSpell() {
        let radius: CGFloat = 1.8
        let fontSize = 25
        
        if manaToUse > 0 {
            let labelMana = SKLabelNode(text: "\(manaToUse)")
            self.addChild(labelMana)
            labelMana.position = CGPoint(x: self.frame.width/radius , y: -self.frame.height/radius)
            labelMana.zPosition = 9999
            labelMana.horizontalAlignmentMode = .center
            labelMana.verticalAlignmentMode = .center
            labelMana.fontName = "MunroSmall"
            labelMana.fontColor = .purple
            labelMana.fontSize = CGFloat(fontSize)
        }

        
        if armorToUse > 0 {
            let labelArmor = SKLabelNode(text: "\(armorToUse)")
            self.addChild(labelArmor)
            labelArmor.position = CGPoint(x: -self.frame.width/radius , y: self.frame.height/radius)
            labelArmor.zPosition = 9999
            labelArmor.horizontalAlignmentMode = .center
            labelArmor.verticalAlignmentMode = .center
            labelArmor.fontName = "MunroSmall"
            labelArmor.fontColor = .blue
            labelArmor.fontSize = CGFloat(fontSize)
        }
        
        if healthToUse > 0 {
            let labelHealth = SKLabelNode(text: "\(healthToUse)")
            self.addChild(labelHealth)
            labelHealth.position = CGPoint(x: self.frame.width/radius , y: self.frame.height/radius)
            labelHealth.zPosition = 9999
            labelHealth.horizontalAlignmentMode = .center
            labelHealth.verticalAlignmentMode = .center
            labelHealth.fontName = "MunroSmall"
            labelHealth.fontColor = .red
            labelHealth.fontSize = CGFloat(fontSize)
        }
        
        if coinToUse > 0 {
            let labelCoin = SKLabelNode(text: "\(coinToUse)")
            self.addChild(labelCoin)
            labelCoin.position = CGPoint(x: -self.frame.width/radius , y: -self.frame.height/radius)
            labelCoin.zPosition = 9999
            labelCoin.horizontalAlignmentMode = .center
            labelCoin.verticalAlignmentMode = .center
            labelCoin.fontName = "MunroSmall"
            labelCoin.fontColor = .yellow
            labelCoin.fontSize = CGFloat(fontSize)
        }
    }
    
    private func conditionToUse() -> Bool {
        if player.mana >= manaToUse &&
            player.health >= healthToUse &&
            player.shield >= armorToUse &&
            player.coin >= coinToUse  {
            return true
        }
        else {
            return false
        }
    }
    
    private func changePlayerStat() {
        player.shield -= armorToUse
        player.health -= healthToUse
        player.coin -= coinToUse
        player.mana -= manaToUse

        player.labelOverHead(shield: player.shield, health: player.health, initLabel: false)
    }
    
}
