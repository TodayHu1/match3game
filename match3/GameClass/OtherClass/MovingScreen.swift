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
        let secondScene = GameScene(enemyArr: enemyA[enemyIndexA])
        let transition = SKTransition.crossFade(withDuration: 0.0)
        secondScene.scaleMode = SKSceneScaleMode.aspectFill
        self.scene!.view?.presentScene(secondScene, transition: transition)
    }
    
    override func didMove(to view: SKView) {
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
            if enemyIndexA < 2 {
                self.presentScene()
            }
            else {
                
            }

        }
        let chageLabel = SKAction.run {
            if enemyIndexA < 2 {
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
        
        let player = Player()
        self.addChild(player)
    }

}
