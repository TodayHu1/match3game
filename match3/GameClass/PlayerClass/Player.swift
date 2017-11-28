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
    var labelHealth = SKCountingLabel(fontNamed: "Arial")
    var labelShield = SKCountingLabel(fontNamed: "Arial")
        //Icon for label
        let iconHeart = SKSpriteNode(imageNamed: "Icon_Heart")
        let iconShield = SKSpriteNode(imageNamed: "Icon_Shield")
    
    //Stats
    var attack: Int = 10
    var health: Int = 50
    var shield: Int = 50
    var move: Int = 3
    var mana: Int = 999
    var coin: Int = 0
    
    //Position
    var positionAnchor: CGPoint =  CGPoint(x: -100, y: 140)
    var positionCenter: CGPoint = CGPoint(x: 0, y: 0)

    var gameScene: GameScene!
    
    init(gameScene: GameScene) {
        super.init(texture: SKTexture(imageNamed: "Player-Stand-0"), color: UIColor.clear, size: CGSize(width: 150, height: 400))
        
        self.gameScene = gameScene
        self.setScale(0.3)
        self.position = positionAnchor
        self.name = "Player"
        self.anchorPoint.x = 0.5
        self.anchorPoint.y = 0
        self.size.width = 170
        self.positionCenter = CGPoint(x: positionAnchor.x, y: positionAnchor.y + (self.size.height/2))
        
        initShadow()
        labelOverHead(shield: self.shield, health: self.health, initLabel: true)
        
        playerAtlasAttack = SKTextureAtlas(named: self.name! + "-Attack")
        playerAtlasStand = SKTextureAtlas(named: self.name! + "-Stand")
        
        for i in 0...playerAtlasAttack.textureNames.count-1 {
            let name = self.name! + "-" + "Attack" + "-\(i).png"
            playerArrAttack.append(SKTexture(imageNamed: name))
        }
        
        for i in 0...playerAtlasStand.textureNames.count-1 {
            let name = self.name! + "-" + "Stand" + "-\(i).png"
            playerArrStand.append(SKTexture(imageNamed: name))
        }
        
        self.zPosition = 3000
        print(self.labelBoard.zPosition)
        print(self.labelHealth.zPosition)
        print(self.labelShield.zPosition)
        
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
        shadowNode.alpha = 0.4
        shadowNode.anchorPoint.x = 0.5
        shadowNode.anchorPoint.y = 0.4
        self.addChild(shadowNode)
    }
    
    func takeDamage(damage: Int) {

        if self.shield > 0 {
            self.shield -= damage
            if self.shield < 0 {
                self.health += self.shield
                self.shield = 0
            }
        }
        else {
            self.health -= damage
        }
        
        labelOverHead(shield: self.shield, health: self.health, initLabel: false)
    
        let getDamage = SKAction.colorize(with: UIColor(displayP3Red: 255, green: 0, blue: 0, alpha: 1), colorBlendFactor: 1, duration: 0.05)
        let toNormalColor = SKAction.colorize(with: UIColor(displayP3Red: 255, green: 0, blue: 0, alpha: 1), colorBlendFactor: 0, duration: 0.2)
        
        self.run(SKAction.sequence([getDamage,toNormalColor]))
        
    }
    
    func fullAttackStandAnimation(damage: Int) {
        self.removeAllActions()
        
        let moveForward = SKAction.move(to: CGPoint(x: -50, y: positionAnchor.y), duration: 0.25)
        let moveBack = SKAction.move(to: positionAnchor, duration: 0.1)
        
        moveForward.timingMode = .easeOut
        moveBack.timingMode = .easeOut
        
        let attackMod = SKAction.run {
            self.gameScene.enemyUnit.takeDamage(damage: damage)
        }
        
        let shakeScene = SKAction.run {
            self.gameScene.sceneShake(shakeCount: 10, intensity: CGVector(dx: 10, dy: 10), shakeDuration: 0.1)
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
        
//        let playerAnimStand = SKAction.repeatForever(
//            SKAction.sequence(
//                [SKAction.animate(with: playerArrStand, timePerFrame: 0.2),
//                 SKAction.wait(forDuration: 1.5)]
//            )
//        )
        
        let playerAnimStand = SKAction.repeatForever(
                SKAction.animate(with: playerArrStand, timePerFrame: 0.2)
            )

        
        self.run(playerAnimStand)
        return playerAnimStand
        
    }
    
    func getMove(move: Int) {
        self.move -= move
    }

    func wait() {
        self.run(SKAction.wait(forDuration: 0.5))
    }
    
}
