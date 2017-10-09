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
    
    //Texture staff
    var enemyArrAttack = [SKTexture]()
    var enemyAtlasAttack = SKTextureAtlas()
    
    var enemyArrStand = [SKTexture]()
    var enemyAtlasStand = SKTextureAtlas()
    
    
    //Main Stat
    var attack: Int = 0
    var health: Int = 0
    var shield: Int = 0
    
    
    //Attack modificator
    var vampireAttack: Float = 0
    
    
    //Label
    var labelBoard = SKSpriteNode()
    var labelUnitName = SKLabelNode(text: "x-UnitName_Label-x")
    var labelHealth = SKLabelNode(text: "x-Health_Label-x")
    var labelShield = SKLabelNode(text: "x-Shield_Label-x")
        //Icon for label
        let iconHeart = SKSpriteNode(imageNamed: "Icon_Heart")
        let iconShield = SKSpriteNode(imageNamed: "Icon_Shield")
    
    
    //Position
    var pos: CGPoint =  CGPoint(x: 100, y: 145)
    
    
    //Enemy name
    var enemyName = ""
    
    
    init(enemyName: String, attack: Int, health: Int, shield: Int, scale: Float, vampire: Float) {
        super.init(texture: SKTexture(imageNamed: enemyName + "-" + "Stand" + "-0"), color: UIColor.clear, size: SKTexture(imageNamed: enemyName + "-" + "Stand" + "-0").size())

        self.anchorPoint.x = 0.5
        self.anchorPoint.y = 0
        
        self.zPosition = 1000
        self.position = pos
        self.name = "enemyUnit"
        
        
        //init main value
        self.setScale(CGFloat(scale))
        self.attack = attack
        self.health = health
        self.shield = shield
        self.vampireAttack = vampire
        
        self.colorBlendFactor = CGFloat(0)
        self.color = UIColor(colorLiteralRed: vampireAttack, green: 0, blue: 0, alpha: 1)
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
        
//        print("FGHJKLFGHJKLFGHJKLDFGHJKL:")
        
        self.removeAllActions()

        let enemyAnimStand = SKAction.repeatForever(
            SKAction.sequence(
                [SKAction.animate(with: enemyArrStand, timePerFrame: 0.2),
                 SKAction.wait(forDuration: 1.5)]
            )
        )
        
        self.run(enemyAnimStand)
        return enemyAnimStand

    }

    func animationAttack() -> SKAction {
        
        self.removeAllActions()

        let enemyAnimAttack = SKAction.animate(with: enemyArrAttack, timePerFrame: 0.15)

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
        
        let attackMod = SKAction.run {
            self.vampireAttackMod()
        }

        let fullAttackAnimation = SKAction.sequence([SKAction.wait(forDuration: 0.6),moveForward,
                                                     animationAttack(),
                                                     attackMod,
                                                     shakeScene,
                                                     moveBack,
                                                     matchGestureTrue,
                                                     animationStand()
            ])

        self.run(fullAttackAnimation)
    }
    
    private func initShadow() {
        let shadowNode = SKSpriteNode(imageNamed: "shadow")
        shadowNode.zPosition = -1
//        shadowNode.position.y = self.position.y
        shadowNode.size.height = 90
        shadowNode.size.width = self.size.width * 4
        shadowNode.alpha = 0.2
        shadowNode.anchorPoint.x = 0.5
        shadowNode.anchorPoint.y = 0.4
        self.addChild(shadowNode)
    }
    

    
    func takeDamage(damage: Int) {
        print("До атаки Игрока shield \(self.shield)  -\(damage)-  health \(self.health)")
        if self.shield > 0 {
            self.shield -= damage
        }
        else {
            self.health -= damage
        }
        print("После атаки Игрока shield \(self.shield)  -\(damage)-  health \(self.health)")
        print("===================================================================")
        labelOverHead(shield: self.shield, health: self.health, initLabel: false)
    }
    
    func echo() {
        print(self)
    }
    
}
