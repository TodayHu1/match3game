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
        switch self.enemyName {
            case "SteamPunkWalker":
                spawnCog(number: 2)
            case "SteamPunkPunch":
                spawnCog(number: 1)
            case "SteamPunkFlameThrower":
                spawnCog(number: 1)
            default:
                break
        }
    }
    
    func spawnCog(number: Int) {
        var duration: Double = 0
        let interval: Double = gameScene.durationSpawnMatchAnimation()
        for _ in 1...number {
            gameScene.matchMoveToBoard(matchIndex: 7,
                                       nodePosition: enemyUnit,
                                       i: matchBoard.getRandomMatchVertical(),
                                       j: matchBoard.getRandomMatchHorizontal(),
                                       waitTimeToAnimation: TimeInterval(duration),
                                       durationAnimation: interval
            )
            duration += interval
        }

    }
    
}
