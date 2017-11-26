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
    }
    
    public func newEnemy() {
        testGameLabel.text = "enemyIndex \(enemyIndexNow)"
        if self.enemyIndexNow < self.enemyOnLevelArr.count-1 {
            let moveOut = SKAction.move(to: CGPoint(x: 500, y: 140), duration: 1)
            let reverse = SKAction.scaleX(to: -0.3, duration: 0.3)
            let pulse = SKAction.fadeIn(withDuration: 10)
            let newEnemy = SKAction.run {
                self.enemyUnit.removeFromParent()
                self.enemyUnit.removeAllChildren()
                
                self.enemyIndexNow+=1
                self.enemyUnit = self.enemyOnLevelArr[self.enemyIndexNow]
                
                self.addChild(self.enemyUnit)
                
                self.enemyUnit.run(pulse)
                self.enemyUnit.animationStand()
                
                self.boardSizeChange()
                
                self.testGameLabel.text = "create new Enemy \(self.enemyIndexNow)"
            }
            enemyUnit.run(SKAction.sequence([reverse,moveOut,newEnemy]))

        }
        else {
            enemyUnit.removeFromParent()
            enemyUnit.removeAllChildren()
            testGameLabel.text = "delete all \(enemyIndexNow)"
        }
    }
    
    public func checkArrForAction() {
        for i in 0...actionOnTurn.count-1 {
            if actionOnTurn[i] > 0 {
                switch i {
                case 0:
                    break
                case 1:
                    enemyUnit.fullAttackStandAnimation(damage: enemyUnit.attack * actionOnTurn[1])
                case 2:
                    player.shield += actionOnTurn[2] * 10
                case 3:
                    player.mana += actionOnTurn[3]
                case 4:
                    player.fullAttackStandAnimation(damage: (player.attack * actionOnTurn[4]))
                case 7:
                    enemyUnit.health += 10
                    enemyUnit.shield += 20
                default: break
                }
            }
        }
        
        
        
//        let statIn = SKAction.fadeIn(withDuration: 0.1)
//        let statHide = SKAction.fadeOut(withDuration: 2)
//        let statWait = SKAction.wait(forDuration: 2)
//        let statText = SKAction.run({
//            testGameLabel.text = "\(player.attack * actionOnTurn[4]) vs \(enemyUnit.attack * actionOnTurn[1])"
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
