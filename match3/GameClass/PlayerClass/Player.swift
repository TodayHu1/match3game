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
    
    //Texture staff
    var playerArrAttack = [SKTexture]()
    var playerAtlasAttack = SKTextureAtlas()
    
    var playerArrStand = [SKTexture]()
    var playerAtlasStand = SKTextureAtlas()
    
    //Label
    var labelBoard = SKSpriteNode()
    var labelHealth = SKLabelNode(text: "x-Health_Label-x")
    var labelShield = SKLabelNode(text: "x-Shield_Label-x")
        //Icon for label
        let iconHeart = SKSpriteNode(imageNamed: "Icon_Heart")
        let iconShield = SKSpriteNode(imageNamed: "Icon_Shield")
    
    //Stats
    var attack: Int = 10
    var health: Int = 50
    var shield: Int = 50
    var move: Int = 3
    
    //Position
    var pos: CGPoint =  CGPoint(x: -100, y: 140)
    

    
    init() {
        super.init(texture: SKTexture(imageNamed: "CharPlaceHolder"), color: UIColor.clear, size: SKTexture(imageNamed: "CharPlaceHolder").size())
        
        self.setScale(0.3)
        self.zPosition = 1000
        self.position = pos
        self.name = "Player"
        self.anchorPoint.x = 0.5
        self.anchorPoint.y = 0

        initShadow()
        labelOverHead(shield: self.shield, health: self.health, initLabel: true)
        
        playerAtlasAttack = SKTextureAtlas(named: self.name! + "-Attack")
//        playerAtlasStand = SKTextureAtlas(named: self.name! + "-Stand")
        
        for i in 0...playerAtlasAttack.textureNames.count-1 {
            let name = self.name! + "-" + "Attack" + "-\(i).png"
            playerArrAttack.append(SKTexture(imageNamed: name))
        }
        
        for i in 0...1 {
            let name = self.name! + "-" + "Attack" + "-\(i).png"
            playerArrStand.append(SKTexture(imageNamed: name))
        }
//
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initShadow() {
        let shadowNode = SKSpriteNode(imageNamed: "shadow")
        shadowNode.zPosition = -1
        //        shadowNode.position.y = self.position.y
        shadowNode.size.height = 90
        shadowNode.size.width = self.size.width * 2
        shadowNode.alpha = 0.2
        shadowNode.anchorPoint.x = 0.5
        shadowNode.anchorPoint.y = 0.3
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
        
        
        let getDamage = SKAction.colorize(with: UIColor(displayP3Red: 255, green: 0, blue: 0, alpha: 1), colorBlendFactor: 1, duration: 0.05)
        let toNormalColor = SKAction.colorize(with: UIColor(displayP3Red: 255, green: 0, blue: 0, alpha: 1), colorBlendFactor: 0, duration: 0.2)
        
        self.run(SKAction.sequence([getDamage,toNormalColor]))
        
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
        
        let shakeScene = SKAction.run {
            gameScene.sceneShake(shakeCount: 10, intensity: CGVector(dx: 10, dy: 10), shakeDuration: 0.1)
        }
        let fullAttackAnimation = SKAction.sequence([
            SKAction.wait(forDuration: 0.6),
            moveForward,
            animationAttack(),
            shakeScene,
            attackMod,
            SKAction.wait(forDuration: 0.6),
            moveBack,
            animationStand()
        ])
        
        self.run(fullAttackAnimation)
    }
    
    func animationAttack() -> SKAction {
        
        self.removeAllActions()
        
        let playerAnimAttack = SKAction.animate(with: playerArrAttack, timePerFrame: 0.10)
        
        self.run(playerAnimAttack)
        return playerAnimAttack
    }
    
    func animationStand() -> SKAction{
        
        self.removeAllActions()
        
        let playerAnimStand = SKAction.repeatForever(
            SKAction.sequence(
                [SKAction.animate(with: playerArrStand, timePerFrame: 0.2),
                 SKAction.wait(forDuration: 1.5)]
            )
        )
        
        self.run(playerAnimStand)
        return playerAnimStand
        
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
