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
    
    func attackOnMove() {
        if specialAbilities["MatchMoveOnAttack"] as! Int != 0 {
//            print("\(self.playerMove) %%% \(self.gameScene.player.move) --- \(self.gameScene.player.move % self.playerMove) == 1")
            if self.gameScene.player.move % (specialAbilities["MatchMoveOnAttack"] as! Int) == 1 {
                self.fullAttackStandAnimation(damage: self.attack)
            }
        }
    }
    
    func attackMod() {
        self.vampireOnAttackMod()
        self.reactiveArmorOnAttackMod()
        self.spawnPoisonOnAttackMod()
        self.spawnSkullOnAttackMod()
    }
    
    //Health = (Attack * 3) * %Vamp
    func vampireOnAttackMod() {
        if specialAbilities["VampireAttack"] as! Double > 0 {
            self.health += Int(
                Float(self.attack * 3) * Float(specialAbilities["VampireAttack"] as! Double)
            )
            buffParticle(name: "Heart")
            updateLabelOverHead()
        }
    }
    
    //Shield = Shield + Attack
    func reactiveArmorOnAttackMod() {
        if specialAbilities["ReactiveArmor"] as! Int > 0 {
            self.armor += self.attack * (specialAbilities["ReactiveArmor"] as! Int)
            buffParticle(name: "Armor")
            updateLabelOverHead()
        }
    }
    
    

    //Кол-во выпускаемых матчей
    func spawnPoisonOnAttackMod() {
        if specialAbilities["PoisonOnBoard"] as! Int > 0 {
            var duration: Double = 0
            let interval: Double = self.gameScene.durationSpawnMatchAnimation()
            for _ in 1...(specialAbilities["PoisonOnBoard"] as! Int) {
                duration += interval
                self.gameScene.matchMoveToBoard(
                    matchType: Match.poison,
                    nodePosition: self,
                    i: self.gameScene.random(number: self.gameScene.matchBoard.verticalCount) - 1,
                    j: self.gameScene.random(number: self.gameScene.matchBoard.horizontalCount) - 1,
                    waitTimeToAnimation: duration,
                    durationAnimation: interval)
            }
        }
    }
    
    func spawnSkullOnAttackMod() {
        if specialAbilities["SkullOnBoard"] as! Int > 0 {
            var duration: Double = 0
            let interval: Double = self.gameScene.durationSpawnMatchAnimation()
            for _ in 1...(specialAbilities["SkullOnBoard"] as! Int) {
                duration += interval
                self.gameScene.matchMoveToBoard(
                    matchType: Match.skull,
                    nodePosition: self,
                    i: self.gameScene.random(number: self.gameScene.matchBoard.verticalCount) - 1,
                    j: self.gameScene.random(number: self.gameScene.matchBoard.horizontalCount) - 1,
                    waitTimeToAnimation: duration,
                    durationAnimation: interval
                )
            }
        }
    }
    

    
    
}
