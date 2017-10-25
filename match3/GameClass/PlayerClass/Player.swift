//
//  player.swift
//  match3
//
//  Created by Женя on 29.08.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import SpriteKit

class Player: SKSpriteNode {
    
    //PlayerParts
    var body = SKSpriteNode(imageNamed: "enemy")
    
    //Label
    var labelBoard = SKLabelNode(text: "")
    var labelHealth = SKLabelNode(text: "x-Health_Label-x")
    var labelShield = SKLabelNode(text: "x-Shield_Label-x")
        //Icon for label
        let iconHeart = SKSpriteNode(imageNamed: "Icon_Heart")
        let iconShield = SKSpriteNode(imageNamed: "Icon_Shield")
    
    //Stats
    var attack: Int = 10
    var health: Int = 20
    var shield: Int = 20
    var move: Int = 3
    
    //Position
    var pos: CGPoint =  CGPoint(x: -100, y: 205)
    

    
    init() {
        super.init(texture: SKTexture(imageNamed: "enemy"), color: UIColor.clear, size: SKTexture(imageNamed: "enemy").size())
        
        self.setScale(0.23)
        self.zPosition = 1000
        self.position = pos
        self.name = "playerUnit"

        initShadow()
        labelOverHead(shield: self.shield, health: self.health, initLabel: true)
    
        
//        print("INIT DONE")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initShadow() {
        let shadowNode = SKSpriteNode(imageNamed: "shadow")
        shadowNode.zPosition = -1
        
        shadowNode.position.y += -270
        
        shadowNode.size.height = 100
        shadowNode.size.width = 350
        
        shadowNode.alpha = 0.3
        
        self.addChild(shadowNode)
    }
    
    func initStat(attack: Int, health: Int) {
        let textFrame = " 🛡" + String(attack) + " ⚔" + String(health)
        let labelNode = SKLabelNode(text: textFrame)
        labelNode.zPosition = 1
        labelNode.fontSize = 80
        labelNode.position.y += 300
        
        labelNode.alpha = 1
        self.addChild(labelNode)
        
    }
    
    func takeDamage(damage: Int) {
        
        print("До атаки врага shield \(self.shield)  -\(damage)-  health \(self.health)")
        
        if self.shield > 0 {
            self.shield -= damage
            if self.shield < 0 {
                print(self.health)
                self.health += self.shield
                print(self.health)
                self.shield = 0
            }
        }
        else {
            self.health -= damage
        }
        
        print("После атаки врага shield \(self.shield)  -\(damage)-  health \(self.health)")
        print("===================================================================")
        labelOverHead(shield: self.shield, health: self.health, initLabel: false)
        
        
        let a = SKAction.colorize(with: UIColor(displayP3Red: 255, green: 0, blue: 0, alpha: 1), colorBlendFactor: 0, duration: 0.05)
        let b = SKAction.colorize(with: UIColor(displayP3Red: 255, green: 0, blue: 0, alpha: 1), colorBlendFactor: 1, duration: 0.1)
//        let q = SKAction.fadeOut(withDuration: 0.05)
//        let w = SKAction.fadeIn(withDuration: 0.05)
        
        self.run(SKAction.sequence([b,a]))
        
    }
    
    func fullAttackStandAnimation(damage: Int) {

        
        self.removeAllActions()
        
        let moveForward = SKAction.move(to: CGPoint(x: pos.x + self.size.width/2,y: pos.y), duration: 0.25)
        let moveBack = SKAction.move(to: pos, duration: 0.1)
        
        moveForward.timingMode = .easeOut
        moveBack.timingMode = .easeOut
        
        let attackMod = SKAction.run {
            enemyUnit.takeDamage(damage: damage)
        }
        
        let fullAttackAnimation = SKAction.sequence([
            SKAction.wait(forDuration: 0.6),
            moveForward,
            attackMod,
            SKAction.wait(forDuration: 0.6),
            moveBack,
        ])
        
        self.run(fullAttackAnimation)
    }
    
    func getMove(move: Int) {
        self.move -= move
    }
    
    func echo() {
        print(self)
    }
    
    func wait() {
        self.run(SKAction.wait(forDuration: 0.5))
    }
    
}
