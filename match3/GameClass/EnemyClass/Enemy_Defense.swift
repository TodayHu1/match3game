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
        spawnCogOnDefense(number: specialAbilities["CogOnDefense"] as! Int)
        attackUpOnDefense(attack: specialAbilities["AttackUpOnDefense"] as! Double)
        spawnPoisonOnDefense()
        spawnSkullOnDefense()
    }

    func attackUpOnDefense(attack: Double) {
        if attack != 0.0 {
            gameViewController.presentText(text: "Power up", whoIs: .enemy)
            self.gameScene.nodeAnimationPulseUp(node: self, duration: 2, percentValuePulsation: 0.2)
            self.attack = Int(Double(self.attack) * attack)
            updateLabelOverHead()
            print("\(self.attack) ---- ATTACK UP")
        }
    }
    
    func spawnCogOnDefense(number: Int) {
        if number > 0 {
//            gameViewController.presentText(text: "Cog", color: #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1), whoIs: .enemy)
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
    
    
    
    //Кол-во выпускаемых матчей
    func spawnPoisonOnDefense() {
        if specialAbilities["PoisonOnDefense"] as! Int > 0 {
            var duration: Double = 0
            let interval: Double = self.gameScene.durationSpawnMatchAnimation()
            for _ in 1...(specialAbilities["PoisonOnDefense"] as! Int) {
                duration += interval
                self.gameScene.matchMoveToBoard(
                    matchType: Match.poison,
                    nodePosition: self,
                    i: self.gameScene.random(number: self.gameScene.matchBoard.verticalCount) - 1,
                    j: self.gameScene.random(number: self.gameScene.matchBoard.horizontalCount) - 1,
                    waitTimeToAnimation: duration,
                    durationAnimation: interval
                )
            }
        }
    }
    
    //Кол-во выпускаемых матчей
    func spawnSkullOnDefense() {
        if specialAbilities["SkullOnDefense"] as! Int > 0 {
            var duration: Double = 0
            let interval: Double = self.gameScene.durationSpawnMatchAnimation()
            for _ in 1...(specialAbilities["SkullOnDefense"] as! Int) {
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
