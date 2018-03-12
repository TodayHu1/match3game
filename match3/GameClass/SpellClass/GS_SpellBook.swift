//
//  GS_SpellBook.swift
//  match3
//
//  Created by Женя on 15.11.17.
//  Copyright © 2017 Женя. All rights reserved.
//

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
            armor = 0
            coin = 0
            description = "Replaces skull matches for matches of chains"
            
        case "HeartAttack":
            mana = 0
            health = 4
            armor = 0
            coin = 0
            description = "Takes away a part of lives in exchange for four match of attack"
            
        case "Nemesis":
            mana = 4
            health = 1
            armor = 2
            coin = 0
            description = "Replaces match shields for attack matches"
            
        case "NoOneStepBack":
            mana = 2
            health = 1
            armor = 2
            coin = 0
            description = ""
            
        case "FirstAid":
            mana = 0
            health = 0
            armor = 1
            coin = 0
            description = "Heals you on the number of skulls on the table"
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
        default:
            break
        }
        
       
        
        
    }
    
}
