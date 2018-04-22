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
    
    var playerArrWalking = [SKTexture]()
    var playerAtlasWalking = SKTextureAtlas()
    
    var playerArrStrongAttack = [SKTexture]()
    var playerAtlasStrongAttack = SKTextureAtlas()
    
    var playerArrSpellBuff = [SKTexture]()
    var playerAtlasSpellBuff = SKTextureAtlas()
    
    var playerArrSpellAttack = [SKTexture]()
    var playerAtlasSpellAttack = SKTextureAtlas()
    
    var playerArrDeath = [SKTexture]()
    var playerAtlasDeath = SKTextureAtlas()
    
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
    var armor: Int = 50
    var move: Int = 0
    var mana: Int = 0
    var gold: Int = 0
    
    //Position
    var positionAnchor: CGPoint =  CGPoint(x: -100, y: 140)
    var positionCenter: CGPoint = CGPoint(x: 0, y: 0)

    //Size
    var playerSize = CGSize(width: 508, height: 444)
    
    var gameScene: GameScene!
    
    ///Специальные способности
    var specialAbilities = [
        "SpawnAttackOnDefense": 0,
        "SpawnArmorOnDefense": 0,
        "SpawnManaOnDefense": 0,
        "SpawnChainInstedSkullOnDefense": 0,
    ] as [String : Int]
    
    init() {
        super.init(texture: SKTexture(imageNamed: "Player-Stand-0"), color: UIColor.clear, size: playerSize)
        
        self.setScale(0.3)
        self.position = positionAnchor
        self.name = "Player"
        self.anchorPoint.x = 0.5
        self.anchorPoint.y = 0
        self.positionCenter = CGPoint(x: positionAnchor.x, y: positionAnchor.y + (self.size.height/2))
        self.zPosition = 3000
        
        playerAtlasAttack = SKTextureAtlas(named: self.name! + "-Attack")
        playerAtlasStand = SKTextureAtlas(named: self.name! + "-Stand")
        playerAtlasWalking = SKTextureAtlas(named: self.name! + "-Walking")
        playerAtlasStrongAttack = SKTextureAtlas(named: self.name! + "-StrongAttack")
        playerAtlasSpellBuff = SKTextureAtlas(named: self.name! + "-SpellBuff")
        playerAtlasSpellAttack = SKTextureAtlas(named: self.name! + "-SpellAttack")
        playerAtlasDeath = SKTextureAtlas(named: self.name! + "-Death")
        
        for i in 0...playerAtlasAttack.textureNames.count-1 {
            let name = self.name! + "-" + "Attack" + "-\(i).png"
            playerArrAttack.append(SKTexture(imageNamed: name))
        }
        
        for i in 0...playerAtlasStand.textureNames.count-1 {
            let name = self.name! + "-" + "Stand" + "-\(i).png"
            playerArrStand.append(SKTexture(imageNamed: name))
        }
        
        for i in 0...playerAtlasWalking.textureNames.count-1 {
            let name = self.name! + "-" + "Walking" + "-\(i).png"
            playerArrWalking.append(SKTexture(imageNamed: name))
        }
        
        for i in 0...playerAtlasStrongAttack.textureNames.count-1 {
            let name = self.name! + "-" + "StrongAttack" + "-\(i).png"
            playerArrStrongAttack.append(SKTexture(imageNamed: name))
        }
        
        for i in 0...playerAtlasSpellBuff.textureNames.count-1 {
            let name = self.name! + "-" + "SpellBuff" + "-\(i).png"
            playerArrSpellBuff.append(SKTexture(imageNamed: name))
        }
        
        for i in 0...playerAtlasSpellAttack.textureNames.count-1 {
            let name = self.name! + "-" + "SpellAttack" + "-\(i).png"
            playerArrSpellAttack.append(SKTexture(imageNamed: name))
        }
        
        for i in 0...playerAtlasDeath.textureNames.count-1 {
            let name = self.name! + "-" + "Death" + "-\(i).png"
            playerArrDeath.append(SKTexture(imageNamed: name))
        }
        
    }
    
    init(gameScene: GameScene) {
        super.init(texture: SKTexture(imageNamed: "Player-Stand-0"), color: UIColor.clear, size: playerSize)
        
        self.name = String(RAND_MAX)
        print("\(self) --- Player INIT")
        
        self.gameScene = gameScene
        self.setScale(0.3)
        self.position = positionAnchor
        self.name = "Player"
        self.anchorPoint.x = 0.5
        self.anchorPoint.y = 0
        self.positionCenter = CGPoint(x: positionAnchor.x, y: positionAnchor.y + (self.size.height/2))
        
        self.attack = playerStat.attack
        self.armor = playerStat.armorNow
        self.health = playerStat.healthNow
        self.mana = playerStat.manaNow
        self.gold = playerStat.gold
        
        
        initShadow()
        labelOverHead(shield: self.armor, health: self.health, initLabel: true)
        initLegendItem()
        
        playerAtlasAttack = SKTextureAtlas(named: self.name! + "-Attack")
        playerAtlasStand = SKTextureAtlas(named: self.name! + "-Stand")
        playerAtlasWalking = SKTextureAtlas(named: self.name! + "-Walking")
        playerAtlasStrongAttack = SKTextureAtlas(named: self.name! + "-StrongAttack")
        playerAtlasSpellBuff = SKTextureAtlas(named: self.name! + "-SpellBuff")
        playerAtlasSpellAttack = SKTextureAtlas(named: self.name! + "-SpellAttack")
        playerAtlasDeath = SKTextureAtlas(named: self.name! + "-Death")
        
        for i in 0...playerAtlasAttack.textureNames.count-1 {
            let name = self.name! + "-" + "Attack" + "-\(i).png"
            playerArrAttack.append(SKTexture(imageNamed: name))
        }
        
        for i in 0...playerAtlasStand.textureNames.count-1 {
            let name = self.name! + "-" + "Stand" + "-\(i).png"
            playerArrStand.append(SKTexture(imageNamed: name))
        }
        
        for i in 0...playerAtlasWalking.textureNames.count-1 {
            let name = self.name! + "-" + "Walking" + "-\(i).png"
            playerArrWalking.append(SKTexture(imageNamed: name))
        }
        
        for i in 0...playerAtlasStrongAttack.textureNames.count-1 {
            let name = self.name! + "-" + "StrongAttack" + "-\(i).png"
            playerArrStrongAttack.append(SKTexture(imageNamed: name))
        }
        
        for i in 0...playerAtlasSpellBuff.textureNames.count-1 {
            let name = self.name! + "-" + "SpellBuff" + "-\(i).png"
            playerArrSpellBuff.append(SKTexture(imageNamed: name))
        }
        
        for i in 0...playerAtlasSpellAttack.textureNames.count-1 {
            let name = self.name! + "-" + "SpellAttack" + "-\(i).png"
            playerArrSpellAttack.append(SKTexture(imageNamed: name))
        }
        
        for i in 0...playerAtlasDeath.textureNames.count-1 {
            let name = self.name! + "-" + "Death" + "-\(i).png"
            playerArrDeath.append(SKTexture(imageNamed: name))
        }
        
        self.zPosition = 3000
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
        
        onDefense()
        
        print("Enemy get damage \(damage)")
        

        
        if self.armor > 0 {
            self.armor -= damage
            if self.armor < 0 {
                self.health += self.armor
                self.armor = 0
            }
        }
        else {
            self.health -= damage
        }
        
        
        self.updateLabelOverHead()
    
        let getDamage = SKAction.colorize(with: UIColor(displayP3Red: 255, green: 0, blue: 0, alpha: 1), colorBlendFactor: 1, duration: 0.05)
        let toNormalColor = SKAction.colorize(with: UIColor(displayP3Red: 255, green: 0, blue: 0, alpha: 1), colorBlendFactor: 0, duration: 0.2)
        
        self.run(SKAction.sequence([getDamage,toNormalColor]))
    }
    
    func playerDie() {
        if self.health < 1 {
            self.animationDeath()
            self.gameScene.actionGesture(gesture: false)
            let color = SKAction.colorize(with: UIColor(displayP3Red: 255, green: 0, blue: 0, alpha: 1), colorBlendFactor: 1, duration: 0.05)
            let wait = SKAction.wait(forDuration: 1.5)
            let die = SKAction.run {
                print("GameOver")
                gameViewController.saveGameProgress()
                self.removeFromParent()
                self.removeAllActions()
                self.removeAllChildren()
                self.gameScene.gameOverScreen()
            }
            
            let seq = SKAction.sequence([color,wait,die])
            self.run(seq)
        }
    }
    
    func fullAttackStandAnimation(damage: Int, attackType: attackType) {
        if self.health > 0 {
            self.removeAllActions()
            
            print("fullAttackStandAnimation --- Player")
            
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
                animationAttack(attackType: attackType)!,
                shakeScene,
                attackMod,
                SKAction.wait(forDuration: 0.6),
                moveBack,
                animationStand()!
                ])
            
            self.run(fullAttackAnimation)
        }
    }
    
    enum attackType {
        case basic
        case spell
        case strong
    }
    
    func animationAttack(attackType: attackType) -> SKAction? {
        if self.health > 0 {
            self.removeAllActions()
            
            var playerAnimAttack = SKAction.animate(with: playerArrAttack, timePerFrame: 0.07)
            
            switch attackType {
            case .basic:
                playerAnimAttack = SKAction.animate(with: playerArrAttack, timePerFrame: 0.07)
            case .strong:
                playerAnimAttack = SKAction.animate(with: playerArrStrongAttack, timePerFrame: 0.07)
            case .spell:
                playerAnimAttack = SKAction.animate(with: playerArrSpellAttack, timePerFrame: 0.08)
            }
            
            
            self.run(playerAnimAttack)
            return playerAnimAttack
        }
        else {
            return animationNil()
        }

    }
    
    func animationNil() -> SKAction {
        updateLabelOverHead()
        self.buffParticle(name: "Death")
        return SKAction.wait(forDuration: 1)
    }

    func animationStand() -> SKAction? {
        if self.health > 0 {
            self.removeAllActions()
            
            let playerAnimStand = SKAction.repeatForever(
                SKAction.animate(with: playerArrStand, timePerFrame: 0.2)
            )
            
            self.run(playerAnimStand)
            return playerAnimStand
        }
        else {
            return animationNil()
        }
    }
    
    func animationSpellBuffAndStand() {
        if self.health > 0 {
            self.removeAllActions()
            
            let playerAnimStand = SKAction.animate(with: playerArrSpellBuff, timePerFrame: 0.1)
            
            let moveBack = SKAction.move(to: positionAnchor, duration: 0.1)
            
            let seq = SKAction.sequence([playerAnimStand, moveBack, animationStand()!])
            
            self.run(seq)
        }
    }
    
    
    
    func animationWalking(){
        self.removeAllActions()
        
        let playerAnimWalking = SKAction.repeatForever(
            SKAction.animate(with: playerArrWalking, timePerFrame: 0.15)
        )

        self.run(playerAnimWalking)
    }
    
    func animationDeath(){
        self.removeAllActions()
        
        let playerAnimWalking = SKAction.repeatForever(
            SKAction.animate(with: playerArrDeath, timePerFrame: 0.15)
        )
        
        self.run(playerAnimWalking)
    }
    
    func getMove(move: Int) {
        self.move -= move
    }

    func wait() {
        self.run(SKAction.wait(forDuration: 0.5))
    }
    
    func buffParticle(name: String) {
        let loadBuff = Bundle.main.path(forResource: name, ofType: "sks")
        let buffParticle = NSKeyedUnarchiver.unarchiveObject(withFile: loadBuff!) as! SKEmitterNode
        self.addChild(buffParticle)
        //        buffParticle.position = self.positionCenter
        buffParticle.position.y = self.positionCenter.y
        buffParticle.zPosition = self.zPosition + 1
    }

    func initLegendItem() {
        let legend = playerStat.legendArr
        
        if !legend.isEmpty {
            for i in 0...legend.count-1 {
                switch legend[i] {
                case "Fire feather":
                    self.specialAbilities["SpawnAttackOnDefense"] = 2
                case "Belt of truth":
                    self.specialAbilities["SpawnChainInstedSkullOnDefense"] = 1
                default:
                    break
                }
            }
        }
    }
    
}
