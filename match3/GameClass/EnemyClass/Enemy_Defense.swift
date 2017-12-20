//
//  Enemy_Defense.swift
//  match3
//
//  Created by Евгений on 23.11.2017.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import SpriteKit

extension EnemyUnit {
    
    func defenseMod() {
        spawnCogOnDefense(number: spawnCogOnDefense)
    }
    
    func spawnCogOnDefense(number: Int) {
        if number != 0 {
            var duration: Double = 0
            let interval: Double = self.gameScene.durationSpawnMatchAnimation()
            for _ in 1...number {
                self.gameScene.matchMoveToBoard(matchType: Match.cog,
                                                nodePosition: self,
                                                i: self.gameScene.matchBoard.getRandomMatchVertical(),
                                                j: self.gameScene.matchBoard.getRandomMatchHorizontal(),
                                                waitTimeToAnimation: TimeInterval(duration),
                                                durationAnimation: interval
                )
                duration += interval
            }
        }
    }
    
}
