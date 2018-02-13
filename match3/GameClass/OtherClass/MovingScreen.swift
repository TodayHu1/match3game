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
        

//        print("-!-")
        print(self.gameViewController)
        gameScene = GameScene(enemyArr: checkEnemy(enemy: loadEnemy[indexLevel]),
                                    playerSpell: ["Null","SpellNull","",""],
                                    bg: checkBG(bgName: loadBg[indexLevel]),
                                    size: checkBoardSize(size: loadBoardSize[indexLevel]))
        
        gameScene.gameViewController = self.gameViewController
        
        if lvlName == "0-1" {
            gameScene.levelArr = [
                [Match.chain, Match.chain, Match.chain ,Match.chain, Match.chain],
                [Match.chain, Match.chain, Match.attack ,Match.chain, Match.chain],
                [Match.chain, Match.attack, Match.chain ,Match.attack, Match.chain],
                [Match.chain, Match.chain, Match.chain ,Match.chain, Match.chain],
                [Match.chain, Match.chain, Match.chain ,Match.chain, Match.chain]
            ]
        }
        
        if lvlName == "0-2" {
            gameScene.levelArr = [
                [Match.chain, Match.chain, Match.chain ,Match.chain, Match.chain],
                [Match.chain, Match.chain, Match.chain ,Match.chain, Match.chain],
                [Match.chain, Match.chain, Match.attack ,Match.chain, Match.chain],
                [Match.chain, Match.attack, Match.skull ,Match.attack, Match.chain],
                [Match.chain, Match.skull, Match.chain ,Match.skull, Match.chain],
                [Match.chain, Match.chain, Match.chain ,Match.chain, Match.chain]
            ]
        }
        
        
        
        

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
        print("Random BG ---- \(x)");
        return x
    }


    
    override func didMove(to view: SKView) {
        
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
                print("==============================")
                print("\(indexLevel) < \(loadEnemy.count)")
                self.presentScene()
            }
            else {
                print("\(indexLevel) > \(loadEnemy.count)")
//                levelStorage[lvlOnReady]["LvlNow"] = 1
//                var x = (levelStorage[lvlOnReady]["LvlNow"] is Int?) + 1
                self.gameViewController.presentMenu()
            }
        }
        
        let chageLabel = SKAction.run {
            if indexLevel < loadEnemy.count {
                movingLabel.text = "ENEMY AHEAD!"
            }
            else {
                movingLabel.text = "JOURNEY DONE!"
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
        
        
        print("\(player.size) ------- \(self.size)")
    }

}
