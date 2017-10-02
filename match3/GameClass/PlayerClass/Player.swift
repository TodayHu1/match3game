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
    var labelBoard = SKLabelNode(text: "LOL")
    var labelHealth = SKLabelNode(text: "x-Health_Label-x")
    var labelShield = SKLabelNode(text: "x-Shield_Label-x")
        //Icon for label
        let iconHeart = SKSpriteNode(imageNamed: "Icon_Heart")
        let iconShield = SKSpriteNode(imageNamed: "Icon_Shield")
    
    //Stats
    var attack: Int = 999
    var health: Int = 999
    var shield: Int = 999
    var move: Int = 3
    
    //Position
    var pos: CGPoint =  CGPoint(x: -100, y: 205)
    

    
    init() {
        super.init(texture: SKTexture(imageNamed: "player"), color: UIColor.clear, size: SKTexture(imageNamed: "player").size())
        
        self.setScale(0.33)
        self.zPosition = 1000
        self.position = pos
        self.name = "playerUnit"

        initShadow()
        labelOverHead(shield: self.shield, health: self.health, initLabel: true)
    
        
        print("INIT DONE")
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
        
        self.health -= damage
        
        //Change label
//        labelStat(attack: self.attack, health: self.health, initLabel: false)
        
        //Animation
        let flash = SKAction.colorize(with: UIColor(red: 1, green: 1, blue: 1, alpha: 0), colorBlendFactor: 1, duration: 0.1)
        let seq = SKAction.sequence([flash, flash.reversed()])
        self.run(seq)
    }
    
    func getMove(move: Int) {
        self.move -= move
    }
    
    func echo() {
        print(self)
    }
    
}
