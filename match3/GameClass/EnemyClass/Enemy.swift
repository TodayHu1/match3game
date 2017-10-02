//
//  Enemy.swift
//  match3
//
//  Created by Женя on 29.08.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import SpriteKit

class EnemyUnit: SKSpriteNode {
    
    var enemyArrAttack = [SKTexture]()
    var enemyAtlasAttack = SKTextureAtlas()
    
    var enemyArrStand = [SKTexture]()
    var enemyAtlasStand = SKTextureAtlas()
    
    var attack: Int = 0
    var health: Int = 0
    var shield: Int = 0
    
    //Label
    var labelBoard = SKLabelNode(text: "")
    var labelUnitName = SKLabelNode(text: "x-UnitName_Label-x")
    var labelHealth = SKLabelNode(text: "x-Health_Label-x")
    var labelShield = SKLabelNode(text: "x-Shield_Label-x")
        //Icon for label
        let iconHeart = SKSpriteNode(imageNamed: "Icon_Heart")
        let iconShield = SKSpriteNode(imageNamed: "Icon_Shield")
    
    var pos: CGPoint =  CGPoint(x: 100, y: 210)
    
    var enemyName = ""
    
    
    init(enemyName: String, attack: Int, health: Int) {
        super.init(texture: SKTexture(imageNamed: enemyName + "-" + "Stand" + "-0"), color: UIColor.clear, size: SKTexture(imageNamed: enemyName + "-" + "Stand" + "-0").size())


        self.setScale(0.33)
        self.zPosition = 1000
        self.position = pos
        self.name = "enemyUnit"
        
//        self.xScale = -0.2
        
        self.attack = attack
        self.health = health
//        self.colorBlendFactor = CGFloat(gameScene.randomFloat())
//        self.color = UIColor(colorLiteralRed: gameScene.randomFloat(), green: gameScene.randomFloat(), blue: gameScene.randomFloat(), alpha: 1)
//        
        initShadow()

        labelOverHead(shield: self.attack, health: self.health, initLabel: true)
        
        enemyAtlasAttack = SKTextureAtlas(named: enemyName + "-Attack")
        enemyAtlasStand = SKTextureAtlas(named: enemyName + "-Stand")
        
        for i in 0...enemyAtlasAttack.textureNames.count-1 {
            let name = enemyName + "-" + "Attack" + "-\(i).png"
            enemyArrAttack.append(SKTexture(imageNamed: name))
        }
        
        for i in 0...enemyAtlasStand.textureNames.count-1 {
            let name = enemyName + "-" + "Stand" + "-\(i).png"
            enemyArrStand.append(SKTexture(imageNamed: name))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func animationStand() -> SKAction{
        
        self.removeAllActions()

        let enemyAnimStand = SKAction.repeatForever(
            SKAction.sequence(
                [SKAction.animate(with: enemyArrStand, timePerFrame: 0.2),
                 SKAction.wait(forDuration: 1)]
            )
        )
        
        self.run(enemyAnimStand)
        return enemyAnimStand

    }

    func animationAttack() -> SKAction {
        
        self.removeAllActions()

        let enemyAnimAttack = SKAction.animate(with: enemyArrAttack, timePerFrame: 0.1)

        self.run(enemyAnimAttack)
        return enemyAnimAttack
    }
    
    func fullAttackStandAnimation() {
        
        self.removeAllActions()

//        gameScene.actionGesture(gesture: false)

        let moveForward = SKAction.move(to: CGPoint(x: pos.x - self.size.width/2,y: pos.y), duration: 0.25)
        let moveBack = SKAction.move(to: pos, duration: 0.1)

        moveForward.timingMode = .easeOut
        moveBack.timingMode = .easeOut


        let matchGestureTrue = SKAction.run {
//            gameScene.actionGesture(gesture: true)
        }

        let shakeScene = SKAction.run {
            gameScene.sceneShake(shakeCount: 10, intensity: CGVector(dx: 10, dy: 10), shakeDuration: 0.1)
        }

        let fullAttackAnimation = SKAction.sequence([moveForward, animationAttack(), shakeScene, moveBack,matchGestureTrue, animationStand()])

        self.run(fullAttackAnimation)
    }
    
    private func initShadow() {
        let shadowNode = SKSpriteNode(imageNamed: "shadow")
        shadowNode.zPosition = -1
        shadowNode.position.y -= (self.size.height + self.size.height/2 - 10)
        shadowNode.size.height = 100
        shadowNode.size.width = self.size.width * 3.3
        shadowNode.alpha = 0.3
        self.addChild(shadowNode)
    }
    

    
    func takeDamage(damage: Int) {
        
        self.health -= damage
        
        //Change label
//        labelStat(attack: self.attack, health: self.health , initLabel: false)
        if self.health < 1 {
            gameScene.newEnemy()
        }
        //Animation
//        let flash = SKAction.colorize(with: UIColor(red: 1, green: 1, blue: 1, alpha: 0), colorBlendFactor: 1, duration: 0.1)
//        let seq = SKAction.sequence([flash, flash.reversed()])
//        self.run(seq)
    }
    
    func echo() {
        print(self)
    }
    
}
