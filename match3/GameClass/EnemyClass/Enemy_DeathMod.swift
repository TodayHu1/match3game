//
//  Enemy_DeathMod.swift
//  match3
//
//  Created by Женя on 15.11.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import SpriteKit

extension EnemyUnit {
    
    func spawnSkullOnDieMod() -> SKAction {
        var duration: Double = 0
        let interval: Double = 0.2
        if self.spawnSkullOnDie > 0 {
            for _ in 1...self.spawnSkullOnDie {
                duration += interval
                gameScene.matchMoveToBoard(
                    matchIndex: 1,
                    nodePosition: self,
                    i: gameScene.random(number: matchBoard.verticalCount) - 1,
                    j: gameScene.random(number: matchBoard.horizontalCount) - 1,
                    waitTimeToAnimation: duration,
                    durationAnimation: interval)
            }
        }
        return SKAction.wait(forDuration: duration)
    }
    
}
