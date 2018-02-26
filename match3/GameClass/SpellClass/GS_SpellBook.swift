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

        switch skillName {
        case "Null":
            return Spell(skillName: skillName, texture: SKTexture(imageNamed: "Spell"+skillName),
                         mana: 0, health: 0, armor: 0, coin: 0,
                         name: "Spell"+String(spellIndex), position: skillPosition, gameScene: self)
        case "SkullJail":
            return Spell(skillName: skillName, texture: SKTexture(imageNamed: "Spell"+skillName),
                         mana: 6, health: 0, armor: 0, coin: 0,
                         name: "Spell"+String(spellIndex), position: skillPosition, gameScene: self)
        case "HeartAttack":
            return Spell(skillName: skillName, texture: SKTexture(imageNamed: "Spell"+skillName),
                         mana: 0, health: 4, armor: 0, coin: 0,
                         name: "Spell"+String(spellIndex), position: skillPosition, gameScene: self)
        case "Nemesis":
            return Spell(skillName: skillName, texture: SKTexture(imageNamed: "Spell"+skillName),
                         mana: 4, health: 1, armor: 2, coin: 0,
                         name: "Spell"+String(spellIndex), position: skillPosition, gameScene: self)
        case "NoOneStepBack":
            return Spell(skillName: skillName, texture: SKTexture(imageNamed: "Spell"+skillName),
                         mana: 2, health: 0, armor: 0, coin: 0,
                         name: "Spell"+String(spellIndex), position: skillPosition, gameScene: self)
        default:
            return Spell(skillName: "0", texture: SKTexture(imageNamed: ""),
                         mana: 0, health: 0, armor: 0, coin: 0,
                         name: "Spell"+String(spellIndex), position: skillPosition, gameScene: self)
        }
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
                    if levelArr[i][j] == Match.skull {
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
        case "qwe":
            var duration: Double = 0
            let interval: Double = self.durationSpawnMatchAnimation()
            for _ in 0...5 {
                duration += interval
                matchMoveToBoard(matchType: Match.coin,
                                 nodePosition: player,
                                 i: matchBoard.getRandomMatchVertical(),
                                 j: matchBoard.getRandomMatchHorizontal(),
                                 waitTimeToAnimation: TimeInterval(duration),
                                 durationAnimation: interval
                )
            }

        case "Nemesis":
            var duration: Double = 0
            let interval: Double = self.durationSpawnMatchAnimation()
            for i in 0...matchBoard.verticalCount-1 {
                for j in 0...matchBoard.horizontalCount-1 {
                    if levelArr[i][j] == Match.armor  {
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
