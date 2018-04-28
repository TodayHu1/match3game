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
        steamPunkWalkerTrasform()
        spawnPoisonOnBreakMod()
        spawnFireOnBreakMod()
    }
    
    func steamPunkWalkerTrasform() {
        print("TRAS")
        if specialAbilities["SteamPunkWalkerTrasform"] as! Bool
            && specialAbilities["SpecialSpell"] as! Bool
        {
            self.run(SKAction.sequence([SKAction.wait(forDuration: 0.5), SKAction.run(
                {
                    gameViewController.presentText(text: "Catapult", whoIs: .enemy)
                    self.gameScene.sceneShake(shakeCount: 10, intensity: CGVector(dx: 0, dy: 20), shakeDuration: 0.5)
                    self.enemyName = "SteamPunkPunch"
                    self.size = CGSize(width: 120, height: 120)
                    self.initEnemyAnimationTexture()
                    self.fullAttackStandAnimation(damage: 0)
                    self.specialAbilities["SpecialSpell"] = false
                    self.specialAbilities["AttackUpOnDefense"] = 1.2
                    self.specialAbilities["CogOnDefense"] = 0
                    
                }
                )]))
            var duration: Double = 0
            let interval: Double = gameScene.durationSpawnMatchAnimation()
            for i in 0...self.gameScene.matchBoard.verticalCount-1 {
                for j in 0...self.gameScene.matchBoard.horizontalCount-1 {
                    if self.gameScene.matchTypeOnTable[i][j] == Match.armor ||
                        self.gameScene.matchTypeOnTable[i][j] == Match.coin ||
                        self.gameScene.matchTypeOnTable[i][j] == Match.chain {
                        duration += interval
                        gameScene.matchMoveToBoard(matchType: Match.cog,
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
    
    func spawnChainInstedArmorMod() {
        if (specialAbilities["ChainInstedArmor"] as! Bool) {
            self.run(SKAction.sequence([SKAction.wait(forDuration: 0.5), SKAction.run(
                {
                    gameViewController.presentText(text: "Break armor", color: .cyan, whoIs: .enemy)
                    
                }
            )]))
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
    
    
    func spawnPoisonOnBreakMod() {
        if (specialAbilities["PoisonOnBreakMod"] as! Bool) {
            self.run(SKAction.sequence([SKAction.wait(forDuration: 0.5), SKAction.run(
                {
                    gameViewController.presentText(text: "Poison nova", color: .cyan, whoIs: .enemy)
                    
                }
                )]))
            var duration: Double = 0
            let interval: Double = gameScene.durationSpawnMatchAnimation()
            for i in 0...self.gameScene.matchBoard.verticalCount-1 {
                for j in 0...self.gameScene.matchBoard.horizontalCount-1 {
                    if self.gameScene.matchTypeOnTable[i][j] == Match.armor || self.gameScene.matchTypeOnTable[i][j] == Match.coin  {
                        duration += interval
                        gameScene.matchMoveToBoard(matchType: Match.poison,
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
    
    func spawnFireOnBreakMod() {
        if (specialAbilities["FireOnBreakMod"] as! Bool) {
            var duration: Double = 0
            let interval: Double = self.gameScene.durationSpawnMatchAnimation()
            for _ in 1...6 {
                duration += interval
                self.gameScene.matchMoveToBoard(
                    matchType: Match.fire,
                    nodePosition: self,
                    i: self.gameScene.random(number: self.gameScene.matchBoard.verticalCount) - 1,
                    j: self.gameScene.random(number: self.gameScene.matchBoard.horizontalCount) - 1,
                    waitTimeToAnimation: duration,
                    durationAnimation: interval
                )
            }
            gameViewController.presentText(text: "Fire storm", color: .cyan, whoIs: .enemy)
        }
    }

    
}

