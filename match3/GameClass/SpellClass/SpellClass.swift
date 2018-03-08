//
//  SpellClass.swift
//  match3
//
//  Created by Евгений on 19.11.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import SpriteKit
import Flurry_iOS_SDK

class Spell: SKSpriteNode {
    
    private var manaToUse = 0
    private var healthToUse = 0
    private var armorToUse = 0
    private var coinToUse = 0
    
    public var skillName = ""
    
    var gameScene: GameScene!
    
    init(name: String, position: CGPoint){
        super.init(texture: SKTexture(imageNamed: ""), color: UIColor.clear, size: CGSize(width: 41, height: 41))
        self.name = name
        self.position = position
    }

    init(skillName: String, texture: SKTexture, mana: Int, health: Int, armor: Int, coin: Int, name: String, position: CGPoint, gameScene: GameScene) {
        super.init(texture: texture, color: UIColor.clear, size: CGSize(width: 41, height: 41))
        
        self.gameScene = gameScene
        self.zPosition = 550
    
        self.skillName = skillName
        
        self.name = "Spell1"
        self.name = name
        
        self.position = position
        
        self.manaToUse = mana
        self.healthToUse = health
        self.armorToUse = armor
        self.coinToUse = coin
        
        self.initStatSpell()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///Вызывает использование способности
    func useSpell() {
        if self.conditionToUse() {
            self.changePlayerStat()
            gameScene.nodeAnimationPulseUp(node: self, duration: 0.3, percentValuePulsation: 40)
            gameScene.castSpell(skillName: skillName)
            Flurry.logEvent("SkillUse", withParameters: ["Skill": skillName])
        }
    }
    
    ///Инициализация графики для ресурсов способности
    private func initStatSpell() {
        let radius: CGFloat = 1.8
        let fontSize = 25
        let iconSize = 24
        let zIndex = CGFloat(300)
        
        if manaToUse > 0 {
            let labelMana = SKLabelNode(text: "\(manaToUse)")
            labelMana.position = CGPoint(x: self.frame.width/radius , y: -self.frame.height/radius)
            labelMana.zPosition = zIndex
            labelMana.horizontalAlignmentMode = .center
            labelMana.verticalAlignmentMode = .center
            labelMana.fontName = "MunroSmall"
            labelMana.fontColor = .white
            labelMana.fontSize = CGFloat(fontSize)
            self.addChild(labelMana)
            let iconMana = SKSpriteNode(imageNamed: "manaBar-1.png")
            iconMana.size = CGSize(width: iconSize, height: iconSize)
            iconMana.zPosition -= 1
            labelMana.addChild(iconMana)
        }
        
        if armorToUse > 0 {
            let labelArmor = SKLabelNode(text: "\(armorToUse)")
            labelArmor.position = CGPoint(x: -self.frame.width/radius , y: self.frame.height/radius)
            labelArmor.zPosition = zIndex
            labelArmor.horizontalAlignmentMode = .center
            labelArmor.verticalAlignmentMode = .center
            labelArmor.fontName = "MunroSmall"
            labelArmor.fontColor = .white
            labelArmor.fontSize = CGFloat(fontSize)
            self.addChild(labelArmor)
            let iconArmor = SKSpriteNode(imageNamed: "Icon_Shield.png")
            iconArmor.size = CGSize(width: iconSize, height: iconSize)
            iconArmor.zPosition -= 1
            labelArmor.addChild(iconArmor)
        }
        
        if healthToUse > 0 {
            let labelHealth = SKLabelNode(text: "\(healthToUse)")
            labelHealth.position = CGPoint(x: self.frame.width/radius , y: self.frame.height/radius)
            labelHealth.zPosition = zIndex
            labelHealth.horizontalAlignmentMode = .center
            labelHealth.verticalAlignmentMode = .center
            labelHealth.fontName = "MunroSmall"
            labelHealth.fontColor = .white
            labelHealth.fontSize = CGFloat(fontSize)
            self.addChild(labelHealth)
            let iconHeart = SKSpriteNode(imageNamed: "Icon_Heart.png")
            iconHeart.size = CGSize(width: iconSize, height: iconSize)
            iconHeart.zPosition -= 1
            labelHealth.addChild(iconHeart)
        }
        
        if coinToUse > 0 {
            let labelCoin = SKLabelNode(text: "\(coinToUse)")
            labelCoin.position = CGPoint(x: -self.frame.width/radius , y: -self.frame.height/radius)
            labelCoin.zPosition = zIndex
            labelCoin.horizontalAlignmentMode = .center
            labelCoin.verticalAlignmentMode = .center
            labelCoin.fontName = "MunroSmall"
            labelCoin.fontColor = .white
            labelCoin.fontSize = CGFloat(fontSize)
            self.addChild(labelCoin)
            let iconCoin = SKSpriteNode(imageNamed: "MatchCoin.png")
            iconCoin.size = CGSize(width: iconSize, height: iconSize)
            iconCoin.zPosition -= 1
            labelCoin.addChild(iconCoin)
        }
    }
    
    ///Условие для использование способности
    private func conditionToUse() -> Bool {
        if self.gameScene.player.mana >= manaToUse &&
            self.gameScene.player.health >= healthToUse &&
            self.gameScene.player.armor >= armorToUse &&
            self.gameScene.player.coin >= coinToUse  {
            return true
        }
        else {
            return false
        }
    }
    
    ///Изменение ресурсов игрока после использования способности
    private func changePlayerStat() {
        self.gameScene.player.armor -= armorToUse
        self.gameScene.player.health -= healthToUse
        self.gameScene.player.coin -= coinToUse
        self.gameScene.player.mana -= manaToUse

        self.gameScene.changeManaLabel()
        self.gameScene.player.labelOverHead(shield: self.gameScene.player.armor, health: self.gameScene.player.health, initLabel: false)
        
//        let wait = SKAction.wait(forDuration: 1)
//        let code = SKAction.run {
//            self.gameScene.player.takeDamage(damage: 0)
//        }
//
//        let run = SKAction.sequence([wait,code])
//        self.gameScene.player.run(run)
    }
    
    
    
}
