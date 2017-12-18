//
//  GS_EnemyControll.swift
//  match3
//
//  Created by Женя on 19.09.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import SceneKit
import SpriteKit
import GameplayKit

var matchActionGesture = true
var loopOnSpawnMatch = false //Появление собирающихся матчей после генерации
var boardSizeUp = true //Увеличение доски после победы над врагом

extension GameScene {
    
    public func actionGesture(gesture: Bool) {
        matchActionGesture = gesture
        testGameLabel.text = "Game gesture - \(gesture)"
    }
    
    public func newEnemy() {
        if self.enemyIndexNow < self.enemyOnLevelArr.count-1 {
            let moveOut = SKAction.move(to: CGPoint(x: 400, y: 140), duration: 0.5)
            let reverse = SKAction.scaleX(to: -0.3, duration: 0.3)
            let pulse = SKAction.fadeIn(withDuration: 10)
            let newEnemy = SKAction.run {
                self.enemyUnit.removeFromParent()
                self.enemyUnit.removeAllChildren()
                
                self.enemyIndexNow+=1
                self.enemyUnit = self.initNewClassForEnemy(enemyName: self.enemyOnLevelArr[self.enemyIndexNow])

                self.addChild(self.enemyUnit)
                
                self.enemyUnit.run(pulse)
                self.enemyUnit.animationStand()
                
                self.boardSizeChange()
            }
            let gestureTrue = SKAction.run {
                self.actionGesture(gesture: true)
            }
            let gestureFalse = SKAction.run {
                self.actionGesture(gesture: false)
            }
            enemyUnit.run(SKAction.sequence([gestureFalse, reverse, moveOut, newEnemy, gestureTrue]))

        }
        else {
            enemyUnit.removeFromParent()
            enemyUnit.removeAllChildren()
            
            indexLevel+=1
            
            let waitScene = SKAction.wait(forDuration: 0.8)
            let scene = SKAction.run {
                self.presentScene()
            }
            let seq = SKAction.sequence([waitScene, scene])
            self.run(seq)

        }
    }
    
    
    public func checkArrForAction() {
        for i in 0...actionOnTurn.count-1 {
            if actionOnTurn[i] > 0 {
                switch i {
                    case Match.skull.rawValue:
                        enemyUnit.fullAttackStandAnimation(damage: enemyUnit.attack * actionOnTurn[Match.skull.rawValue])
                    
                    case Match.armor.rawValue:
                        player.shield += actionOnTurn[Match.armor.rawValue] * 10
                    
                    case Match.energy.rawValue:
                        player.mana += actionOnTurn[Match.energy.rawValue]
                    
                    case Match.attack.rawValue:
                        player.fullAttackStandAnimation(damage: (player.attack * actionOnTurn[Match.attack.rawValue]))
                    
                    case Match.cog.rawValue:
                        enemyUnit.shield += 20
                    
                    default: break
                }
            }
        }
        
        
        
//        let statIn = SKAction.fadeIn(withDuration: 0.1)
//        let statHide = SKAction.fadeOut(withDuration: 2)
//        let statWait = SKAction.wait(forDuration: 2)
//        let statText = SKAction.run({
//        })
//        let sdf = SKAction.removeFromParent()
//        let statInitArr = SKAction.run {
            for i in 0...actionOnTurn.count-1 {
                actionOnTurn[i] = 0
            }
//        }
//        statLabel.run(
//            SKAction.sequence(
//                [statIn,statText,statWait,statHide,statInitArr]
//            )
//        )
    }
}
