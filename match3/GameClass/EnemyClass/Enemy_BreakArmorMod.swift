//
//  Enemy_BreakArmorMod.swift
//  match3
//
//  Created by Евгений on 23.11.2017.
//  Copyright © 2017 Женя. All rights reserved.
//


import Foundation
import SpriteKit

extension EnemyUnit {
    
    func breakArmor() {
        
        if self.specialSpell && self.enemyName == "SteamPunkWalker"  {
            spawnCog(number: 6)
            self.specialSpell = false
        }

    }
    
    func spawnChainInstedPositiveMatch() {
        var duration: Double = 0
        let interval: Double = gameScene.durationSpawnMatchAnimation()
        for i in 0...self.gameScene.matchBoard.verticalCount-1 {
            for j in 0...self.gameScene.matchBoard.horizontalCount-1 {
                if self.gameScene.levelArr[i][j] == 2 || self.gameScene.levelArr[i][j] == 3 || self.gameScene.levelArr[i][j] == 4 || self.gameScene.levelArr[i][j] == 5 {
                    duration += interval
                    gameScene.matchMoveToBoard(matchIndex: 0,
                                               nodePosition: self,
                                               i: i,
                                               j: j,
                                               waitTimeToAnimation: TimeInterval(duration),
                                               durationAnimation: interval
                    )
                }
            }
        }
    }
    

    
}

