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
    
    var playerArrAttack = [SKTexture?](repeating: nil, count: 18)
    var playerArrStand = [SKTexture?](repeating: nil, count: 25)
    
    var attack: Int = 12
    var health: Int = 10000
    
    var pos: CGPoint =  CGPoint(x: -100, y: 180)
    
    
    init(playerName: String) {
        super.init(texture: SKTexture(imageNamed: playerName + "-Stand-0"), color: UIColor.clear, size: SKTexture(imageNamed: playerName + "-Stand-0").size())
        
        self.setScale(0.2)
        self.zPosition = 1000
        self.position = pos
        self.name = "playerUnit"
        
        initShadow()
        initStat(attack: attack, health: health)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func animationStand(playerName: String) -> SKAction {
        
        for i in 0...24 {
            playerArrStand[i] = SKTexture(imageNamed: playerName + "-Stand-" + String(i))
        }
        
        let playerAnimStand = SKAction.repeatForever(SKAction.animate(with: playerArrStand as! [SKTexture], timePerFrame: 0.07))
        playerAnimStand.timingMode = .easeOut
        
        self.run(playerAnimStand)
        return playerAnimStand
        
    }
    
    func animationAttack(playerName: String) -> SKAction {
        
        for i in 0...17 {
            playerArrAttack[i] = SKTexture(imageNamed: playerName + "-Attack-" + String(i))
        }
        
        let playerAnimAttack = SKAction.animate(with: playerArrAttack as! [SKTexture], timePerFrame: 0.04)
        playerAnimAttack.timingMode = .easeOut
        
        self.run(playerAnimAttack,
             completion: {
                enemyUnit.takeDamage(damage: self.attack)
                gameScene.sceneShake(shakeCount: 10, intensity: CGVector(dx: 10, dy: 10), shakeDuration: 0.05)
             }
        )
        return playerAnimAttack
    }
    
    func fullAttackStandAnimation(playerName: String) {
        
        let moveForward = SKAction.move(to: CGPoint(x: pos.x + self.size.width/2,y: pos.y), duration: 0.25)
        let moveBack = SKAction.move(to: pos, duration: 0.1)
        
        moveForward.timingMode = .easeOut
        moveBack.timingMode = .easeOut
        
        let fullAttackAnimation = SKAction.sequence([moveForward, animationAttack(playerName: playerName), moveBack, animationStand(playerName: playerName)])
        
        self.run(fullAttackAnimation)
    }
    
    func initShadow() {
        let shadowNode = SKSpriteNode(imageNamed: "shadow")
        shadowNode.zPosition = -1
        
        shadowNode.position.y += -270
        
        shadowNode.size.height = 130
        shadowNode.size.width = 750
        
        shadowNode.alpha = 0.3
        
        self.addChild(shadowNode)
    }
    
    func initStat(attack: Int, health: Int) {
        let textFrame = " 🛡" + String(attack) + " ⚔" + String(health)
        let labelNode = SKLabelNode(text: textFrame)
        labelNode.zPosition = 1
        labelNode.fontSize = 100
        labelNode.position.y += 300
        
        labelNode.alpha = 0.9
        self.addChild(labelNode)
        
    }
    
    func echo() {
        print(self)
    }
    
}
