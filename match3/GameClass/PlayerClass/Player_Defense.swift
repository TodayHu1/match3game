//
//  Player_Defense.swift
//  match3
//
//  Created by Евгений on 15.04.2018.
//  Copyright © 2018 Женя. All rights reserved.
//

import Foundation
import SpriteKit

extension Player {
    
    func onDefense() {
        spawnAttackOnDefense()
        spawnChainInstedSkullOnDefense()
    }
    
    func spawnAttackOnDefense() {
        let aOnd = self.specialAbilities["SpawnAttackOnDefense"]
        if aOnd! > 0 {
            self.gameScene.spawnMatchOnRandomPosition(matchType: .attack, nodePosition: self, numberOfMatch: aOnd!)
        }
    }
    
    func spawnChainInstedSkullOnDefense() {
        let aOnd = self.specialAbilities["SpawnChainInstedSkullOnDefense"]
        if aOnd! > 0 {
            var x = 0
            var y = 0
            for i in 0...self.gameScene.matchBoard.verticalCount-1 {
                for j in 0...self.gameScene.matchBoard.horizontalCount-1 {
                    if self.gameScene.matchTypeOnTable[i][j] == .skull {
                        x = i
                        y = j
                    }
                }
            }
            
            let interval: Double = self.gameScene.durationSpawnMatchAnimation()
            self.gameScene.matchMoveToBoard(matchType: Match.chain,
                             nodePosition: self,
                             i: x,
                             j: y,
                             waitTimeToAnimation: TimeInterval(interval),
                             durationAnimation: interval
            )

            
            
        }
    }
}
