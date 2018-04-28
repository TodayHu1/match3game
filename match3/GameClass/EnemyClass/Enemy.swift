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
    var armor: Int = 0
    
    ///Специальные способности
    var specialAbilities = [
        //Attack modificator
        "VampireAttack": 0.0,
        "ReactiveArmor": 0,
        "PoisonOnBoard": 0,
        "SkullOnBoard": 0,
        
        //Defense modificator
        "CogOnDefense": 0,
        "AttackUpOnDefense": 0.0,
        "PoisonOnDefense": 0,
        "SkullOnDefense": 0,
        
        //BreakArmor modificator
        "ChainInstedArmor": false,
        "SteamPunkWalkerTrasform" : false,
        "PoisonOnBreakMod": false,
        "FireOnBreakMod": false,
        
        //Death modificator
        "SkullOnDie": 0,
        
        //Move modificator
        "MatchMoveOnAttack": 0,
        
        //Bool for special spell
        "SpecialSpell": false
        
    ] as [String : Any]
    
    
    //Label
    var labelBoard = SKSpriteNode()
    var labelUnitName = SKLabelNode(fontNamed: "Arial")
    var labelRandomUnit = SKLabelNode(fontNamed: "Arial")
    var labelHealth = SKCountingLabel(fontNamed: "Arial")
    var labelShield = SKCountingLabel(fontNamed: "Arial")
    var labelAttack = SKCountingLabel(fontNamed: "Arial")
        //Icon for label
        let iconHeart = SKSpriteNode(imageNamed: "Icon_Heart")
        let iconShield = SKSpriteNode(imageNamed: "Icon_Shield")
        let iconAttack = SKSpriteNode(imageNamed: "AttackIcon")
    

    //Position
    var positionAnchor: CGPoint =  CGPoint(x: 100, y: 140)
    var positionCenter: CGPoint = CGPoint(x: 0, y: 0)
    
    //Enemy name
    var enemyName = ""
    var isRandomUnit = false
    var isBoss = false
    
    //Color
    var normalColor: UIColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
    
    var gameScene: GameScene!
    
    init(enemyName: String,
         attack: Int, health: Int, shield: Int,
         size: CGSize,
         gameScene: GameScene
        ) {
        
        super.init(texture: SKTexture(imageNamed: enemyName + "-" + "Stand" + "-0"), color: UIColor.clear, size: SKTexture(imageNamed: enemyName + "-" + "Stand" + "-0").size())

        print("\(self.isRandomUnit) --- Enemy Name")
        
        self.gameScene = gameScene
        self.anchorPoint.x = 0.5
        self.anchorPoint.y = 0
        
        self.zPosition = 1100
        self.position = positionAnchor
        self.name = "enemyUnit"
        
        self.enemyName = enemyName
        
        //init main value
        self.setScale(CGFloat(0.3))
        self.size = size
//        self.color = normalColor
        normalColor = self.color
        self.positionCenter = CGPoint(x: positionAnchor.x, y: positionAnchor.y + (self.size.height/2))
        self.attack = attack
        self.health = health
        self.armor = shield
        
        self.colorBlendFactor = CGFloat(0)

        initShadow()

        setLabelOverHead(armor: self.attack, health: self.health, attack: self.attack, initLabel: true)
        
        initEnemyAnimationTexture()
        
        print("\(enemyName) --- Enemy Name")
    }
    
    func initEnemyAnimationTexture() {
        print("INIT ENEMY - \(self.enemyName)")
        enemyAtlasAttack = SKTextureAtlas(named: enemyName + "-Attack")
        enemyAtlasStand = SKTextureAtlas(named: enemyName + "-Stand")
        
        enemyArrStand = []
        enemyArrAttack = []
        
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
    
//    func animationStand() {
//        print("animationStand --- Enemy")
//    }
    
    func animationStand() -> SKAction? {
        if self.health > 0 {
            self.removeAllActions()
            
            print("animationStand --- Enemy")
            let enemyAnimStand = SKAction.repeatForever(
                SKAction.animate(with: enemyArrStand, timePerFrame: 0.2)
            )
            self.run(enemyAnimStand)
            //let enemyAnimStand = SKAction.wait(forDuration: 1)
            return enemyAnimStand
        }
        else {
            return animationNil()
        }
        

    }

    func animationAttack() -> SKAction? {
        if self.health > 0 {
            self.removeAllActions()
            let enemyAnimAttack = SKAction.animate(with: enemyArrAttack, timePerFrame: 0.1)
            self.run(enemyAnimAttack)
            return enemyAnimAttack
        }
        else {
            return animationNil()
        }
    }
    
    func fullAttackStandAnimation(damage: Int) {
        if self.health > 0 {
            
            print("LOH anim \(self.gameScene.player.health)")
            
            //        self.gameScene.player.takeDamage(damage: damage)
            //        self.animationAttack()
            self.removeAllActions()
            let moveForward = SKAction.move(to: CGPoint(x: 50, y: positionAnchor.y), duration: 0.25)
            let moveBack = SKAction.move(to: positionAnchor, duration: 0.1)
            
            moveForward.timingMode = .easeOut
            moveBack.timingMode = .easeOut
            
            let matchGestureTrue = SKAction.run {
                //            gameScene.actionGesture(gesture: true)
            }
            
            let shakeScene = SKAction.run {
                self.gameScene.sceneShake(shakeCount: 10, intensity: CGVector(dx: 10, dy: 10), shakeDuration: 0.1)
            }
            
            let attackMod = SKAction.run {
                //On Attack
                self.attackMod()
                self.gameScene.player.takeDamage(damage: damage)
            }
            
            let fullAttackAnimation = SKAction.sequence([
                SKAction.wait(forDuration: 0.6),
                moveForward,
                animationAttack()!,
                shakeScene,
                attackMod,
                moveBack,
                matchGestureTrue,
                animationStand()!
                ])
            
            self.run(fullAttackAnimation)
        }
    }
    
    private func initShadow() {
        let shadowNode = SKSpriteNode(imageNamed: "shadow")
        shadowNode.zPosition = -1
//        shadowNode.position.y = self.position.y
        shadowNode.size.height = 90
        shadowNode.size.width = self.size.width * 2.5
        shadowNode.alpha = 0.4
        shadowNode.anchorPoint.x = 0.5
        shadowNode.anchorPoint.y = 0.4
        self.addChild(shadowNode)
    }
    

    
    func takeDamage(damage: Int) {
        print("\(damage) TAKE ENEMY DAMAGE \(playerStat.attack)")
        if self.armor > 0 {
            self.armor -= damage
            if self.armor < 0 {
                self.health += self.armor
                self.armor = 0
                //On Break Armor
                breakArmorMod()
            }
            self.buffParticle(name: "ArmorSpark", onBack: true, target: "Armor")
        }
        else {
            self.health -= damage
            self.buffParticle(name: "HealthSpark", onBack: true, target: "Health")
        }
        
        
        if self.health < 1 {
            
            soulGem += 1
            self.gameScene.player.buffParticle(name: "SoulGem")
            
            let spawnNewEnemy = SKAction.run {
                self.gameScene.newEnemy()
            }
            //On Die
            self.run(SKAction.sequence([
//                self.spawnSkullOnDieMod(),
                spawnNewEnemy
            ]))
        }

        updateLabelOverHead()
        
        defenseMod()
        
    }
    
    func animationNil() -> SKAction {
        self.buffParticle(name: "Death")
        return SKAction.wait(forDuration: 1)
    }

    func buffParticle(name: String, onBack: Bool = false, target: String = "Player") {
        let loadBuff = Bundle.main.path(forResource: name, ofType: "sks")
        let buffParticle = NSKeyedUnarchiver.unarchiveObject(withFile: loadBuff!) as! SKEmitterNode
        
        //        buffParticle.position = self.positionCenter
        if onBack {
            buffParticle.zPosition = -1
        }
        else {
            buffParticle.zPosition = 1
        }
        
        switch target {
        case "Player":
            buffParticle.position.y = self.positionCenter.y
        case "Health":
            buffParticle.position.y = self.iconHeart.position.y + 70
        case "Armor":
            buffParticle.position.y = self.iconShield.position.y + 70
        default:
            break
        }
        
        self.addChild(buffParticle)
    }
    
}
