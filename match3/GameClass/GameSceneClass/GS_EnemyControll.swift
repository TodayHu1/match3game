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
        print("!!!!!!!!!!!!!!!!!!!!!!!!!! " + String(gesture))
        matchActionGesture = gesture
    }
    
    public func newEnemy() {
        enemyUnit.removeFromParent()
        enemyUnit.removeAllChildren()
        enemyUnit = EnemyUnit(enemyName: "Fitments", attack: 10, health: 20)
        self.addChild(enemyUnit)
        enemyUnit.animationStand()
    }
    
    public func attackQueue() {
        if player.move > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                enemyUnit.fullAttackStandAnimation()
                player.move = 3
            }
        }
    }
    
}
