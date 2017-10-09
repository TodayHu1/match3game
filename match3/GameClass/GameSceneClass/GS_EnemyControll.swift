//
//  GS_EnemyControll.swift
//  match3
//
//  Created by Женя on 19.09.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation

var matchActionGesture = true

extension GameScene {
    
    public func actionGesture(gesture: Bool) {
//        print("!!!!!!!!!!!!!!!!!!!!!!!!!! " + String(gesture))
        matchActionGesture = gesture
    }
    
    public func newEnemy() {
//        enemyUnit.removeFromParent()
//        enemyUnit.removeAllChildren()
//        enemyUnit = EnemyUnit(enemyName: "Stony", attack: 10, health: 20)
//        self.addChild(enemyUnit)
//        enemyUnit.animationStand()
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
                    enemyUnit.fullAttackStandAnimation()
                    player.takeDamage(damage: enemyUnit.attack * actionOnTurn[1])
                case 2:
                    player.shield += actionOnTurn[2]
                case 4:
                    enemyUnit.takeDamage(damage: (player.attack * actionOnTurn[4]))
                default: break
//                    print("ERORR: checkArrForAction() invalid value \(i)")
                }
            }
            actionOnTurn[i] = 0
        }
    }

}
