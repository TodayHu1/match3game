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
    
    func breakArmorMod() {
        print("Break Armor Mod")
        spawnChainInstedArmorMod()
        
        
//        if self.specialSpell && self.enemyName == "SteamPunkWalker"  {
//            spawnCogOnBreakArmor(number: 6)
//            self.specialSpell = false
//        }

    }
    
    func spawnChainInstedArmorMod() {
        if self.spawnChainInstedArmor {
            var duration: Double = 0
            let interval: Double = gameScene.durationSpawnMatchAnimation()
            for i in 0...self.gameScene.matchBoard.verticalCount-1 {
                for j in 0...self.gameScene.matchBoard.horizontalCount-1 {
                    if self.gameScene.matchTypeOnTable[i][j] == Match.armor  {
                        duration += interval
                        gameScene.matchMoveToBoard(matchType: Match.chain,
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
    

    
}

