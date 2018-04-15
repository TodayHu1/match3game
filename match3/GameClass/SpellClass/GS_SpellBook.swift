//
//  GS_SpellBook.swift
//  match3
//
//  Created by Женя on 15.11.17.
//  Copyright © 2017 Женя. All rights reserved.
//

//Спелл - За 20 маны дает 1 золото (ManaGold)

//Легендарка - Добавляет атаку равную вашему золоту (Sword of midas)

import Foundation
import SpriteKit
import GameplayKit

extension GameScene {
    
    
    func spellBook(skillName: String, spellIndex: Int) -> Spell {
        var skillPosition: CGPoint
        if spellIndex < 3 {
            skillPosition = CGPoint(x: -140+((spellIndex-1)*70), y: 80)
        }
        else {
            skillPosition = CGPoint(x: 0+((spellIndex-2)*70), y: 80)
        }

        
        var mana = 0
        var health = 0
        var armor = 0
        var coin = 0
        var description = "Oops..."

        
        switch skillName {
        case "Null":
            mana = 0
            health = 0
            armor = 0
            coin = 0
            description = "U dont see it <_<"
            
        case "SkullJail":
            mana = 6
            health = 0
            armor = 2
            coin = 0
            description = "Replaces skull matches for matches of chains"
            
        case "HeartAttack":
            mana = 1
            health = 5
            armor = 0
            coin = 0
            description = "Takes away a part of lives in exchange for four match of attack"
            
        case "Nemesis":
            mana = 3
            health = 1
            armor = 1
            coin = 0
            description = "Replaces match shields for attack matches"
            
        case "NoOneStepBack":
            mana = 2
            health = 1
            armor = 2
            coin = 0
            description = ""
            
        case "FirstAid":
            mana = 1
            health = 0
            armor = 5
            coin = 0
            description = "Heals you on the number of skulls on the table"
            
        case "EnergyAttack":
            if playerStat.manaNow > 0 {
                mana = playerStat.manaNow
            }
            else {
                mana = 1
            }
            health = 0
            armor = 0
            coin = 0
            description = "Absorbs all mana, attacks on [ mana points * attack power / 3 ]"
            
        case "SilverSword":
            mana = 2
            health = 0
            armor = 5
            coin = 0
            description = "Attacking the enemy on [ skulls * attack / 6 ]"
            
        case "ScullingTheSkulls":
            mana = 3
            health = 0
            armor = 0
            coin = 0
            description = "Spawns 3 matches of the skull, attacking the enemy on [ skulls * attack / 7 ]"
            
        case "GoldenHeart":
            mana = 1
            health = 1
            armor = 1
            coin = 1
            description = "Heals for 7 health"
            
        case "ManaHealth":
            mana = 8
            health = 0
            armor = 0
            coin = 0
            description = "Heals for 8 health"
            
        case "UnstableTreatment":
            mana = 2
            health = 0
            armor = 0
            coin = 0
            description = "Spawns 3 poison matches and heals for 10 health"
            
        default:
            mana = 0
            health = 0
            armor = 0
            coin = 0
            description = ""
        }
        
        return Spell(skillName: skillName, texture: SKTexture(imageNamed: "Spell"+skillName),
                     mana: mana, health: health, armor: armor, coin: coin,
                     name: "Spell"+String(spellIndex), position: skillPosition, description: description,gameScene: self)
    }
    
  
    func castSpell(skillName: String) {
        switch skillName {
        case "Null":
            let test = GeneratRandomUnit(playerLvl: 1, gameScene: self)
            test.echo()
        case "SkullJail":
            player.animationSpellBuffAndStand()
            var duration: Double = 0
            let interval: Double = self.durationSpawnMatchAnimation()
            for i in 0...matchBoard.verticalCount-1 {
                for j in 0...matchBoard.horizontalCount-1 {
                    if matchTypeOnTable[i][j] == Match.skull {
                        duration += interval
                        matchMoveToBoard(matchType: Match.chain,
                                         nodePosition: player,
                                         i: i,
                                         j: j,
                                         waitTimeToAnimation: TimeInterval(duration),
                                         durationAnimation: interval
                        )
                    }
                }
            }
        case "HeartAttack":
            player.animationSpellBuffAndStand()
            var duration: Double = 0
            let interval: Double = self.durationSpawnMatchAnimation()
            for _ in 0...5 {
                duration += interval
                matchMoveToBoard(matchType: Match.attack,
                                 nodePosition: player,
                                 i: matchBoard.getRandomMatchVertical(),
                                 j: matchBoard.getRandomMatchHorizontal(),
                                 waitTimeToAnimation: TimeInterval(duration),
                                 durationAnimation: interval
                )
            }
        case "FirstAid":
            player.animationSpellBuffAndStand()
            var heal = 0
            for i in 0...matchBoard.verticalCount-1 {
                for j in 0...matchBoard.horizontalCount-1 {
                    if matchTypeOnTable[i][j] == Match.skull  {
                        heal += 1
                    }
                }
            }
            player.health += heal
            player.updateLabelOverHead()
            player.buffParticle(name: "Heart")
        case "Nemesis":
            player.animationSpellBuffAndStand()
            var duration: Double = 0
            let interval: Double = self.durationSpawnMatchAnimation()
            for i in 0...matchBoard.verticalCount-1 {
                for j in 0...matchBoard.horizontalCount-1 {
                    if matchTypeOnTable[i][j] == Match.armor  {
                        duration += interval
                        matchMoveToBoard(matchType: Match.attack,
                                         nodePosition: player,
                                         i: i,
                                         j: j,
                                         waitTimeToAnimation: TimeInterval(duration),
                                         durationAnimation: interval
                        )
                    }
                }
            }
        case "EnergyAttack":
            let power = (playerStat.manaNow * playerStat.attack)
            let damage = Int(power / 3)
            print("\(damage) --\(power)-- ENERGY DAMAGE")
            player.fullAttackStandAnimation(damage: damage, attackType: .spell)
        case "SilverSword":
            var skullCount = 0
            for i in 0...matchBoard.verticalCount-1 {
                for j in 0...matchBoard.horizontalCount-1 {
                    if matchTypeOnTable[i][j] == .skull {
                        skullCount += 1
                    }
                }
            }
            
            let power = (playerStat.attack * skullCount)
            let damage = Int(power / 6)
            print("\(damage) --\(power)-- ENERGY DAMAGE")
            player.fullAttackStandAnimation(damage: damage, attackType: .spell)
        case "ScullingTheSkulls":

            self.spawnMatchOnRandomPosition(matchType: .skull, nodePosition: player, numberOfMatch: 3)

            let skullCount = self.numberOfMatch(matchType: .skull)

            let power = (playerStat.attack * skullCount)
            let damage = Int(power / 7)
            print("\(damage) --\(power)-- ENERGY DAMAGE")
            self.player.fullAttackStandAnimation(damage: damage, attackType: .spell)

        case "GoldenHeart":
            player.animationSpellBuffAndStand()
            player.health += 7
            player.updateLabelOverHead()
            player.buffParticle(name: "Heart")
            
        case "ManaHealth":
            player.animationSpellBuffAndStand()
            player.health += 8
            player.updateLabelOverHead()
            player.buffParticle(name: "Heart")
            
        case "UnstableTreatment":
            player.animationSpellBuffAndStand()
            player.health += 10
            player.updateLabelOverHead()
            player.buffParticle(name: "Heart")
            
            spawnMatchOnRandomPosition(matchType: .poison, nodePosition: player, numberOfMatch: 3)
            
        default:
            break
        }
        
        if skillName != "Null" {
            self.gameViewController.presentText(text: skillName, color: #colorLiteral(red: 0.6977043144, green: 0.5854419424, blue: 0.9686274529, alpha: 1))
        }

       
        
        
    }
    
    func spawnMatchOnRandomPosition(matchType: Match, nodePosition: SKSpriteNode, numberOfMatch: Int) {
        var duration: Double = 0
        let interval: Double = self.durationSpawnMatchAnimation()
        for _ in 0...numberOfMatch-1 {
            duration += interval
            matchMoveToBoard(matchType: matchType,
                             nodePosition: nodePosition,
                             i: matchBoard.getRandomMatchVertical(),
                             j: matchBoard.getRandomMatchHorizontal(),
                             waitTimeToAnimation: TimeInterval(duration),
                             durationAnimation: interval
            )
        }
    }
    
    func numberOfMatch(matchType: Match) -> Int {
        var count = 0
        for i in 0...self.matchBoard.verticalCount-1 {
            for j in 0...self.matchBoard.horizontalCount-1 {
                if self.matchTypeOnTable[i][j] == matchType {
                    count += 1
                }
            }
        }
        
        return count
    }
    
}
