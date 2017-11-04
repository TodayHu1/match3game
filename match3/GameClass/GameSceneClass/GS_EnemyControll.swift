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

extension GameScene {
    
    public func actionGesture(gesture: Bool) {
//        print("!!!!!!!!!!!!!!!!!!!!!!!!!! " + String(gesture))
        matchActionGesture = gesture
    }
    
    public func newEnemy() {
        print("enemyIndex \(enemyIndexNow)")
        if enemyIndexNow < enemyOnLevelArr.count-1 {
            let moveOut = SKAction.move(to: CGPoint(x: 500, y: 140), duration: 1)
            let reverse = SKAction.scaleX(to: -0.3, duration: 0.3)
            let pulse = SKAction.fadeIn(withDuration: 10)
            let newEnemy = SKAction.run {
                enemyUnit.removeFromParent()
                enemyUnit.removeAllChildren()
                enemyIndexNow+=1
                enemyUnit = enemyOnLevelArr[enemyIndexNow]
                self.addChild(enemyUnit)
                enemyUnit.run(pulse)
                enemyUnit.animationStand()
                print("create new Enemy \(enemyIndexNow)")
            }
            enemyUnit.run(SKAction.sequence([reverse,moveOut,newEnemy]))

        }
        else {
            enemyUnit.removeFromParent()
            enemyUnit.removeAllChildren()
            print("delet all \(enemyIndexNow)")
        }
    }
    
    public func attackQueue() {
//        if player.move > 0 {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
//                enemyUnit.fullAttackStandAnimation()
//                player.move = 3
//            }
//        }
    }
    
    public func checkArrForAction() {
        for i in 0...actionOnTurn.count-1 {
            if actionOnTurn[i] > 0 {
                switch i {
                case 0:
                    print("НОЛИК")
                case 1:
                    enemyUnit.fullAttackStandAnimation(damage: enemyUnit.attack * actionOnTurn[1])
                case 2:
                    player.shield += actionOnTurn[2] * 10
                    player.labelOverHead(shield: player.shield, health: player.health, initLabel: false)
                case 3:
                    player.mana += actionOnTurn[3]
                    print(player.mana)
                    print(actionOnTurn[3])
                    manaLabel.text = String(player.mana)
                case 4:
                    player.fullAttackStandAnimation(damage: (player.attack * actionOnTurn[4]))
                default: break
//                    print("ERORR: checkArrForAction() invalid value \(i)")
                }
            }
        }
        
        let statIn = SKAction.fadeIn(withDuration: 0.1)
        let statHide = SKAction.fadeOut(withDuration: 2)
        let statWait = SKAction.wait(forDuration: 2)
        let statText = SKAction.run({
            statLabel.text = "\(player.attack * actionOnTurn[4]) vs \(enemyUnit.attack * actionOnTurn[1])"
        })
        let sdf = SKAction.removeFromParent()
        let statInitArr = SKAction.run {
            for i in 0...actionOnTurn.count-1 {
                actionOnTurn[i] = 0
            }
        }
        statLabel.run(
            SKAction.sequence(
                [statIn,statText,statWait,statHide,statInitArr]
            )
        )
    }
}
