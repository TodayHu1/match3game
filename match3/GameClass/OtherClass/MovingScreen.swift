//
//  MovingScreen.swift
//  match3
//
//  Created by Евгений on 29.11.2017.
//  Copyright © 2017 Женя. All rights reserved.
//

import SpriteKit
import GameplayKit

class MovingScreen: SKScene {
    
    var enemy: [[String]]!
    var bg: String!
    var boardSize: [Int]!
    
    var lvlName: String!
    
    var gameViewController: GameViewController!
    var gameScene: GameScene!
    
    override init() {
        super.init(size: CGSize(width: 375, height: 665))
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.removeAllActions()
        self.removeFromParent()
        self.removeAllChildren()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func skillLevelRule() {
        if lvlName == "0-3" {
            playerStat.spellArr[0] = "SkullJail"
            playerStat.mana = 10
        }
        
        if lvlName == "0-4" {
            playerStat.mana = 3
        }
        
        if lvlName == "0-6" {
            playerStat.spellArr[1] = "HeartAttack"
            playerStat.mana = 6
        }
        
        if lvlName == "1-1" {
            playerStat.spellArr[2] = "Nemesis"
            playerStat.mana = 6
        }
    }
    
    func arrLevelRule() {
        if lvlName == "0-1" {
            gameScene.levelArr = [
                [Match.chain, Match.attack, Match.chain ,Match.attack, Match.chain],
                [Match.attack, Match.chain, Match.attack ,Match.chain, Match.attack],
                [Match.chain, Match.attack, Match.chain ,Match.attack, Match.chain],
                [Match.attack, Match.chain, Match.attack ,Match.chain, Match.attack],
                [Match.chain, Match.attack, Match.chain ,Match.attack, Match.chain]
            ]
        }
        
        if lvlName == "0-2" {
            gameScene.levelArr = [
                [Match.skull, Match.skull, Match.chain ,Match.skull, Match.skull],
                [Match.chain, Match.skull, Match.attack ,Match.skull, Match.chain],
                [Match.skull, Match.attack, Match.chain ,Match.attack, Match.skull],
                [Match.chain, Match.skull, Match.chain ,Match.skull, Match.chain],
                [Match.skull, Match.skull, Match.chain ,Match.skull, Match.skull]
            ]
        }
        
        if lvlName == "0-3" {
            gameScene.levelArr = [
                [Match.skull, Match.chain, Match.skull ,Match.chain, Match.skull],
                [Match.chain, Match.skull, Match.attack ,Match.skull, Match.chain],
                [Match.skull, Match.attack, Match.skull ,Match.attack, Match.skull],
                [Match.chain, Match.skull, Match.chain ,Match.skull, Match.chain],
                [Match.skull, Match.chain, Match.skull ,Match.chain, Match.skull]
            ]
        }
        
        if lvlName == "0-4" {
            gameScene.levelArr = [
                [Match.skull, Match.energy, Match.skull ,Match.chain, Match.skull],
                [Match.energy, Match.chain, Match.energy ,Match.skull, Match.chain],
                [Match.skull, Match.chain, Match.skull ,Match.attack, Match.skull],
                [Match.skull, Match.skull, Match.attack ,Match.skull, Match.attack],
                [Match.chain, Match.skull, Match.chain ,Match.skull, Match.chain]
            ]
        }
        
        if lvlName == "0-5" {
            gameScene.levelArr = [
                [Match.chain, Match.energy, Match.chain ,Match.energy, Match.chain],
                [Match.chain, Match.coin, Match.energy ,Match.coin, Match.chain],
                [Match.chain, Match.armor, Match.coin ,Match.armor, Match.chain],
                [Match.chain, Match.attack, Match.armor ,Match.attack, Match.chain],
                [Match.chain, Match.chain, Match.attack ,Match.chain, Match.chain]
            ]
        }
        
        if lvlName == "0-6" {
            gameScene.levelArr = [
                [Match.chain, Match.chain, Match.chain ,Match.chain, Match.chain],
                [Match.chain, Match.chain, Match.chain ,Match.chain, Match.chain],
                [Match.chain, Match.chain, Match.chain ,Match.chain, Match.chain],
                [Match.chain, Match.chain, Match.chain ,Match.chain, Match.chain],
                [Match.chain, Match.chain, Match.chain ,Match.chain, Match.chain]
            ]
        }
    }
    
    func presentScene() {

        skillLevelRule()
        
        gameScene = GameScene(enemyArr: checkEnemy(enemy: loadEnemy[indexLevel]),
                              playerSpell: playerStat.spellArr,
                              bg: checkBG(bgName: loadBg[indexLevel]),
                              size: checkBoardSize(size: loadBoardSize[indexLevel]))
        
        arrLevelRule()
        
        gameScene.gameViewController = self.gameViewController

        let transition = SKTransition.crossFade(withDuration: 0.0)
        gameScene.scaleMode = SKSceneScaleMode.aspectFit
        self.scene!.view?.presentScene(gameScene, transition: transition)
    }
    
    func checkBG(bgName: String) -> String {
        if bgName == "" {
            return getRandomBG()
        }
        else {
            return bgName
        }
    }
    
    func checkEnemy(enemy: [String]) -> [String] {
        var newArrEnemy = enemy
        for i in 0...newArrEnemy.count-1 {
            if newArrEnemy[i] == "" {
                newArrEnemy[i] = "Random"
            }
        }
        return newArrEnemy
    }
    
    func checkBoardSize(size: [Int]) -> CGSize {
        if loadBoardSize[indexLevel][0] == 0 || loadBoardSize[indexLevel][1] == 0 {
            return CGSize(width: (Int(arc4random_uniform(UInt32(4)))+4), height: (Int(arc4random_uniform(UInt32(4)))+4))
        }
        else {
            return CGSize(width: loadBoardSize[indexLevel][0], height: loadBoardSize[indexLevel][1])
        }
    }
    
    
    func getRandomBG() -> String {
        let bg = ["GrassLand", "Dungeon"]
        let x = bg[Int(arc4random_uniform(UInt32(bg.count)))]
        return x
    }

    override func didMove(to view: SKView) {
        
        self.removeAllActions()
        self.removeFromParent()
        self.removeAllChildren()
        
        self.name = String(RAND_MAX)
        print("\(self) --- MovingScreen")
        
        if indexLevel >= loadEnemy.count {
            print("\(indexLevel)----------------WIN---------------- >= \(loadEnemy.count)")
            var lvlNow = levelStorage[lvlOnReady]["LvlNow"] as! Int
            var lvlMax = levelStorage[lvlOnReady]["LvlMax"] as! Int
            if lvlNow > lvlMax {
                lvlNow = lvlMax
            }
            else {
                levelStorage[lvlOnReady]["LvlNow"] = lvlNow + 1
            }
            self.removeAllActions()
            self.removeFromParent()
            self.removeAllChildren()
            self.gameViewController.victoryScreen()
        }
        else {
            print("\(indexLevel)----------------LOAD LVL---------------- < \(loadEnemy.count)")
            
            self.removeAllActions()
            self.removeFromParent()
            self.removeAllChildren()
            
            let player = Player()
            self.addChild(player)
            player.animationWalking()
            
            let blackSreen = SKSpriteNode(imageNamed: "BlackScreen.png")
            blackSreen.size = CGSize(width: 600, height: 900)
            blackSreen.zPosition = 1
            self.addChild(blackSreen)
            
            let movingLabel = SKLabelNode(text: "Moving...")
            movingLabel.fontSize = 40
            movingLabel.zPosition = 2
            movingLabel.fontName = "MunroSmall"
            self.addChild(movingLabel)
            
            print("DONE INIT SPRITE")
            
            
            let fadeOut = SKAction.fadeOut(withDuration: 1)
            let fadeIn = SKAction.fadeIn(withDuration: 1)
            let wait = SKAction.wait(forDuration: 1)
            
            let startLevel = SKAction.run {
                if indexLevel < loadEnemy.count {
                    self.presentScene()
                }
            }
            
            let chageLabel = SKAction.run {
                if indexLevel >= loadEnemy.count {
                    movingLabel.text = "ENEMY AHEAD!"
                }
            }
            
            movingLabel.run(SKAction.sequence([fadeOut,
                                               fadeIn,
                                               fadeOut,
                                               fadeIn,
                                               chageLabel,
                                               wait,
                                               fadeOut,
                                               startLevel]))
            
        }
    }

}
