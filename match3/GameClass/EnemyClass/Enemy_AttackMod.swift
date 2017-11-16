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
            let rainParticle = NSKeyedUnarchiver.unarchiveObject(withFile: path!) as! SKEmitterNode
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
    
    
    
    //TODO Poison DMG = ATTACK * 6
    //Кол-во выпускаемых матчей
    func spawnPoisonOnAttackMod() {
        if self.spawnPoisonOnBoard > 0 {
            var duration: Double = 0
            let interval: Double = 0.2
            for _ in 1...self.spawnPoisonOnBoard {
                duration += interval
                gameScene.matchMoveToBoard(
                    matchIndex: 6,
                    nodePosition: self,
                    i: gameScene.random(number: matchBoard.verticalCount) - 1,
                    j: gameScene.random(number: matchBoard.horizontalCount) - 1,
                    waitTimeToAnimation: duration,
                    durationAnimation: interval)
            }
            self.spawnPoisonOnBoard += 1
        }
    }
    
    func spawnSkullOnAttackMod() {
        if self.spawnSkullOnBoard > 0 {
            var duration: Double = 0
            let interval: Double = 0.2
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
    
    
}
