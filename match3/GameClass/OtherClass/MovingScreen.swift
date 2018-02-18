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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func presentScene() {
        print("NewScene")
        
        if lvlName == "0-2" {
            playerStat.spellArr[0] = "SkullJail"
            playerStat.mana = 6
        }
        
        gameScene = GameScene(enemyArr: checkEnemy(enemy: loadEnemy[indexLevel]),
                              playerSpell: playerStat.spellArr,
                              bg: checkBG(bgName: loadBg[indexLevel]),
                              size: checkBoardSize(size: loadBoardSize[indexLevel]))
        
        if lvlName == "0-1" {
            gameScene.levelArr = [
                [Match.chain, Match.skull, Match.chain ,Match.skull, Match.chain],
                [Match.skull, Match.skull, Match.attack ,Match.skull, Match.skull],
                [Match.chain, Match.attack, Match.chain ,Match.attack, Match.chain],
                [Match.skull, Match.skull, Match.chain ,Match.skull, Match.skull],
                [Match.chain, Match.skull, Match.chain ,Match.skull, Match.chain]
            ]
        }
        
        if lvlName == "0-2" {
            gameScene.levelArr = [
                [Match.chain, Match.skull, Match.chain ,Match.skull, Match.chain],
                [Match.skull, Match.skull, Match.attack ,Match.skull, Match.skull],
                [Match.chain, Match.attack, Match.skull ,Match.attack, Match.chain],
                [Match.skull, Match.skull, Match.chain ,Match.skull, Match.skull],
                [Match.chain, Match.skull, Match.chain ,Match.skull, Match.chain]
            ]
        }
        
        gameScene.gameViewController = self.gameViewController

        let transition = SKTransition.crossFade(withDuration: 0.0)
        gameScene.scaleMode = SKSceneScaleMode.aspectFit
        self.scene!.view?.presentScene(gameScene, transition: transition)
    }
    
    func checkBG(bgName: String) -> String {
        print("Current BG --- \(bg)")
        if bgName == "" {
            return getRandomBG()
        }
        else {
            return bgName
        }
    }
    
    func checkEnemy(enemy: [String]) -> [String] {
        print("Current enemy --- \(enemy)")
        var newArrEnemy = enemy
        for i in 0...newArrEnemy.count-1 {
            if newArrEnemy[i] == "" {
                newArrEnemy[i] = "Random"
            }
        }
        print("Random Arr Enemy ----- \(newArrEnemy)")
        return newArrEnemy
    }
    
    func checkBoardSize(size: [Int]) -> CGSize {
        print("Current boardSize --- \(boardSize)")
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
        print("Random BG ---- \(x)");
        return x
    }

    override func didMove(to view: SKView) {
        
        print("Moving Screen")
        
        if indexLevel >= loadEnemy.count {
            print("----------------WIN----------------")
            var lvlNow = levelStorage[lvlOnReady]["LvlNow"] as! Int
            var lvlMax = levelStorage[lvlOnReady]["LvlMax"] as! Int
            if lvlNow > lvlMax {
                lvlNow = lvlMax
            }
            else {
                levelStorage[lvlOnReady]["LvlNow"] = lvlNow + 1
            }
            self.gameViewController.presentMenu()
        }
        else {
            print("----------------LOAD LVL----------------")
            
            self.removeAllActions()
            
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
            
            let fadeOut = SKAction.fadeOut(withDuration: 1)
            let fadeIn = SKAction.fadeIn(withDuration: 1)
            let wait = SKAction.wait(forDuration: 1)
            
            let startLevel = SKAction.run {
                if indexLevel < loadEnemy.count {
                    print("\(indexLevel) < \(loadEnemy.count) --- Present scene")
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
