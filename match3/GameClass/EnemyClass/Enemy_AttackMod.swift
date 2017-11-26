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
    
    func attackMod() {
        self.vampireAttackMod()
        self.reactiveArmorMod()
        self.spawnPoisonOnAttackMod()
    }
    
    //Health = (Attack * 3) * %Vamp
    func vampireAttackMod() {
        if self.vampireAttack > 0 {            
            self.health += Int(
                Float(self.attack * 3) * Float(self.vampireAttack)
            )
            buffParticle(name: "Heart")
            setLabelOverHead(shield: self.attack, health: self.health, initLabel: false)
        }
    }
    
    //Shield = Shield + Attack
    func reactiveArmorMod() {
        if reactiveArmor > 0 {
            self.shield += self.attack * self.reactiveArmor
            buffParticle(name: "Armor")
            setLabelOverHead(shield: self.attack, health: self.health, initLabel: false)
        }
    }
    
    
    
    //TODO Poison DMG = ATTACK * 6
    //Кол-во выпускаемых матчей
    func spawnPoisonOnAttackMod() {
        if self.spawnPoisonOnBoard > 0 {
            var duration: Double = 0
            let interval: Double = self.gameScene.durationSpawnMatchAnimation()
            for _ in 1...self.spawnPoisonOnBoard {
                duration += interval
                self.gameScene.matchMoveToBoard(
                    matchIndex: 6,
                    nodePosition: self,
                    i: self.gameScene.random(number: self.gameScene.matchBoard.verticalCount) - 1,
                    j: self.gameScene.random(number: self.gameScene.matchBoard.horizontalCount) - 1,
                    waitTimeToAnimation: duration,
                    durationAnimation: interval)
            }
            self.spawnPoisonOnBoard += 1
        }
    }
    
    func spawnSkullOnAttackMod() {
        if self.spawnSkullOnBoard > 0 {
            var duration: Double = 0
            let interval: Double = self.gameScene.durationSpawnMatchAnimation()
            duration += interval
            self.gameScene.matchMoveToBoard(
                matchIndex: 1,
                nodePosition: self,
                i: self.gameScene.random(number: self.gameScene.matchBoard.verticalCount) - 1,
                j: self.gameScene.random(number: self.gameScene.matchBoard.horizontalCount) - 1,
                waitTimeToAnimation: duration,
                durationAnimation: interval)
        }
    }
    
    
}
