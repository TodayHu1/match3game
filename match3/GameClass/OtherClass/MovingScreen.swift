//
//  MovingScreen.swift
//  match3
//
//  Created by Евгений on 29.11.2017.
//  Copyright © 2017 Женя. All rights reserved.
//

import SpriteKit
import GameplayKit
import Flurry_iOS_SDK


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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///Функция удаляющая со сцены Node, Action и Scene
    func removeAll() {
        self.removeAllActions()
        self.removeFromParent()
        self.removeAllChildren()
    }
    
    func arrLevelRule() {
        
        if lvlDifficulty == 1 {
            gameScene.matchTypeOnTable = [
                [Match.chain, Match.attack, Match.chain ,Match.attack, Match.chain],
                [Match.attack, Match.chain, Match.attack ,Match.chain, Match.attack],
                [Match.chain, Match.attack, Match.chain ,Match.attack, Match.chain],
                [Match.attack, Match.chain, Match.attack ,Match.chain, Match.attack],
                [Match.chain, Match.attack, Match.chain ,Match.attack, Match.chain]
            ]
        }
        
    }
    
    func presentScene() {
        
        gameScene = GameScene(enemyArr: checkEnemy(enemy: loadEnemy[indexLevel]),
                              playerSpell: playerStat.spellOnBoard,
                              bg: checkBG(bgName: loadBg[indexLevel]),
                              size: checkBoardSize(size: loadBoardSize[indexLevel]))
        
        arrLevelRule()
        
        gameScene.gameViewController = self.gameViewController

        let transition = SKTransition.crossFade(withDuration: 0.0)
        gameScene.scaleMode = scaleMode
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
        if lvlDifficulty == 1 {
            return ["Dummy"]
        }
        else {
            var newArrEnemy = enemy
            for i in 0...newArrEnemy.count-1 {
                if newArrEnemy[i] == "" {
                    newArrEnemy[i] = "Random"
                }
            }
            return newArrEnemy
        }
        


    }
    
    func checkBoardSize(size: [Int]) -> CGSize {
        if lvlDifficulty == 1 {
            return CGSize(width: 5, height: 5)
        }
        else {
            if loadBoardSize[indexLevel][0] == 0 || loadBoardSize[indexLevel][1] == 0 {
                return CGSize(width: (Int(arc4random_uniform(UInt32(4)))+4), height: (Int(arc4random_uniform(UInt32(4)))+4))
            }
            else {
                return CGSize(width: loadBoardSize[indexLevel][0], height: loadBoardSize[indexLevel][1])
            }
        }
    }
    
    
    func getRandomBG() -> String {
        let bg = ["GrassLand", "Dungeon","SandStorm"]
        let x = bg[Int(arc4random_uniform(UInt32(bg.count)))]
        return x
    }

    override func didMove(to view: SKView) {
        
        removeAll()
        
        print("\(self) --- MovingScreen")
        
        if indexLevel >= loadEnemy.count {
            print("\(indexLevel)----------------WIN---------------- >= \(loadEnemy.count)")
//            var lvlNow = levelStorage[lvlOnReady]["LvlNow"] as! Int
//            let lvlMax = levelStorage[lvlOnReady]["LvlMax"] as! Int
//            if lvlNow > lvlMax {
//                lvlNow = lvlMax
//            }
//            else {
//                levelStorage[lvlOnReady]["LvlNow"] = lvlNow + 1
//            }

            removeAll()
            
            Flurry.logEvent("Victory", withParameters: ["VictoryLvl": lvlDifficulty])
            
            self.gameViewController.victoryScreen()
        }
        else {
            print("\(indexLevel)----------------LOAD LVL---------------- < \(loadEnemy.count)")
            
            removeAll()

            
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

            
            let startLevel = SKAction.run {
                if indexLevel < loadEnemy.count {
                    self.presentScene()
                }
            }
            
//            let chageLabel = SKAction.run {
//                movingLabel.text = "ENEMY AHEAD!"
//            }
            
            movingLabel.run(SKAction.sequence([
//                                               fadeOut,
//                                               fadeIn,
//                                               chageLabel,
//                                               wait,
//                                               fadeOut,
                                               startLevel]))
            
        }
    }

}
