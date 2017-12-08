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
    
    override init() {
        super.init(size: CGSize(width: 375, height: 665))
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func presentScene() {
        print("NewScene")
        let secondScene = GameScene(enemyArr: enemyA[enemyIndexA],
                                    playerSpell: ["SkullJail","Nemesis","Null","SkullJail"],
                                    bg: getRandomBG(index: enemyIndexA),
                                    size: CGSize(width: 6, height: 6))
        let transition = SKTransition.crossFade(withDuration: 0.0)
        secondScene.scaleMode = SKSceneScaleMode.aspectFit
        self.scene!.view?.presentScene(secondScene, transition: transition)
    }
    
    func getRandomBG(index: Int) -> String {
//        switch index {
//        case 0:
//            return "GrassLand.png"
//        case 1:
//            return "TableInner.png"
//        default:
//            return "CharPlaceHolder.png"
//        }
        return "SteamPunkBackground"
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
            if enemyIndexA < enemyA.count {
                self.presentScene()
            }
            else {
                
            }

        }
        let chageLabel = SKAction.run {
            if enemyIndexA < enemyA.count {
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
