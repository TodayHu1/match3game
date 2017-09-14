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
    
    var enemyArrAttack = [SKTexture?](repeating: nil, count: 18)
    var enemyArrStand = [SKTexture?](repeating: nil, count: 25)
    
    var attack: Int = 10
    var health: Int = 20000
    
    var labelNode: SKLabelNode = SKLabelNode(text: "")
    
    var pos: CGPoint =  CGPoint(x: 100, y: 180)
    
    
    init(enemyName: String) {
        super.init(texture: SKTexture(imageNamed: enemyName + "-Stand-0"), color: UIColor.clear, size: SKTexture(imageNamed: enemyName + "-Stand-0").size())

//        self.color = UIColor(colorLiteralRed: 1, green: 0, blue: 0, alpha: 0)
//        self.blendMode = SKBlendMode(rawValue: 5)!
        self.setScale(0.2)
        self.zPosition = 1000
        self.position = pos
        self.name = "enemyUnit"
        
        initShadow()
        labelStat(attack: self.attack, health: self.health, initLabel: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func animationStand(enemyName: String) -> SKAction {
        for i in 0...24 {
            enemyArrStand[i] = SKTexture(imageNamed: enemyName + "-Stand-" + String(i))
        }
        
        let enemyAnimStand = SKAction.repeatForever(SKAction.animate(with: enemyArrStand as! [SKTexture], timePerFrame: 0.07))
        enemyAnimStand.timingMode = .easeOut
        

        self.run(enemyAnimStand)
        return enemyAnimStand

        
    }
    
    func animationAttack(enemyName: String) -> SKAction {
        
        for i in 0...17 {
            enemyArrAttack[i] = SKTexture(imageNamed: enemyName + "-Attack-" + String(i))
        }
        
        let enemyAnimAttack = SKAction.animate(with: enemyArrAttack as! [SKTexture], timePerFrame: 0.04)
        enemyAnimAttack.timingMode = .easeOut
        
        self.run(enemyAnimAttack)
        return enemyAnimAttack
    }
    
    func fullAttackStandAnimation(enemyName: String) {
        
        let moveForward = SKAction.move(to: CGPoint(x: pos.x - self.size.width/2,y: pos.y), duration: 0.25)
        let moveBack = SKAction.move(to: pos, duration: 0.1)
        
        moveForward.timingMode = .easeOut
        moveBack.timingMode = .easeOut
        
        let shakeScene = SKAction.run {
            //            //let qwe = GameScene()
            //GameScene.sceneShake(shakeCount: 10, intensity: CGVector(dx: 10, dy: 10), shakeDuration: 0.1)
        }
        
        let fullAttackAnimation = SKAction.sequence([moveForward, animationAttack(enemyName: enemyName), shakeScene, moveBack, animationStand(enemyName: enemyName)])
        
        self.run(fullAttackAnimation)
    }
    
    private func initShadow() {
        let shadowNode = SKSpriteNode(imageNamed: "shadow")
        shadowNode.zPosition = -1
        
        shadowNode.position.y += -270
        
        shadowNode.size.height = 130
        shadowNode.size.width = 750
        
        shadowNode.alpha = 0.3
        
        self.addChild(shadowNode)
    }
    
    private func labelStat(attack: Int, health: Int, initLabel: Bool) {
        
        //Init label bar
        let textFrame = " 🛡" + String(attack) + " ⚔" + String(health)
        
        //Set text to label
        self.labelNode.text = textFrame

        //Init option
        if initLabel {
            labelNode.zPosition = 1
            labelNode.fontSize = 100
            labelNode.position.y += 300
            labelNode.alpha = 0.9
            self.addChild(labelNode)
        }
        
    }
    
    func takeDamage(damage: Int) {
        
        self.health -= damage
        
        //Change label
        labelStat(attack: self.attack, health: self.health , initLabel: false)
        
        //Animation
        let flash = SKAction.colorize(with: UIColor(red: 1, green: 1, blue: 1, alpha: 0), colorBlendFactor: 1, duration: 0.1)
        let seq = SKAction.sequence([flash, flash.reversed()])
        self.run(seq)
    }
    
    func echo() {
        print(self)
    }
    
}
