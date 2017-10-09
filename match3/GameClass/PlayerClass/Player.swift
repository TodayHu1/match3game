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
    var attack: Int = 1
    var health: Int = 20
    var shield: Int = 500
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
        }
        else {
            self.health -= damage
        }
        
        print("После атаки врага shield \(self.shield)  -\(damage)-  health \(self.health)")
        print("===================================================================")
        labelOverHead(shield: self.shield, health: self.health, initLabel: false)
    }
    
    func getMove(move: Int) {
        self.move -= move
    }
    
    func echo() {
        print(self)
    }
    
}
