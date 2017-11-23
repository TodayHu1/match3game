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
        testGameLabel.text = "GO UNARMOR"
        var duration: Double = 0
        let interval: Double = gameScene.durationSpawnMatchAnimation()
        for i in 0...matchBoard.verticalCount-1 {
            for j in 0...matchBoard.horizontalCount-1 {
                if levelArr[i][j] == 2 || levelArr[i][j] == 3 || levelArr[i][j] == 4 || levelArr[i][j] == 5 {
                    duration += interval
                    gameScene.matchMoveToBoard(matchIndex: 0,
                                               nodePosition: enemyUnit,
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

