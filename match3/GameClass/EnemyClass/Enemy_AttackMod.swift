//
//  Enemy_Vampire.swift
//  match3
//
//  Created by Женя on 07.10.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import SpriteKit

extension EnemyUnit {
    
    //Health = (Attack * 3) * %Vamp
    func vampireAttackMod() {
        if self.vampireAttack > 0 {
            let path = Bundle.main.path(forResource: "Blood", ofType: "sks")
            var rainParticle = NSKeyedUnarchiver.unarchiveObject(withFile: path!) as! SKEmitterNode
            self.addChild(rainParticle)
            
            self.health += Int(
                Float(self.attack * 3) * Float(self.vampireAttack)
            )
            labelOverHead(shield: self.attack, health: self.health, initLabel: false)
        }
    }
    
    //Shield = Shield + Attack
    func reactiveArmorMod() {
        if reactiveArmor > 0 {
            self.shield += self.attack * self.reactiveArmor
            labelOverHead(shield: self.attack, health: self.health, initLabel: false)
        }

    }
    
    
    func spawnPoisonOnBoardMod() {
        if self.spawnPoisonOnBoard > 0 {
            var interval: Double = 0
            for _ in 1...self.spawnPoisonOnBoard {
                interval += 0.2
                gameScene.matchMoveToBoard(matchIndex: 6, startPosition: self.positionCenter, i: gameScene.random(number: matchBoard.verticalCount-1), j: gameScene.random(number: matchBoard.horizontalCount-1), waitTimeToAnimation: TimeInterval(interval))
            }
            self.spawnPoisonOnBoard += 1
        }
    }
    
    
    
}
