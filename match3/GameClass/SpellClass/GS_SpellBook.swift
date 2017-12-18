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
    
/*
 TODO
    - Поочередность атаки (Спелл - Враг - Игрок)
    - Блокировка управления пользователя во время экшена (Gesture)
    - Инициализатор для сцены
    - Анимация смерти персон
     ажа + меню
    - Анимация победы персонажа + меню
    - Анимация появленя врага
    - Счетчик монет + анимация
*/
    
/*
     TODO Спеллы
     Герой:
     - cпавнит 3 матчейЖизни "FirstAid"
     - заменяет все матчиЧерепа на матчиЗащиты "ArmorUp"
     - теряет всю эннергию и получает 10 монет "MagicMoney"
     - атакует врага обычной атакой "MagicAttack"
     - получает 50 брони "MagicArmor"
     - теряет всю броню и наносит урон равный потерянной броне "ShieldSlam"
     - теряет 10 жизней и получает 15 маны "BloodMind"
     - теряет 5 жизней и спавнит 3 матчаЖизни "HeartOfHope"
     - атакует врага и лечит себя от нанесенного урона "VampiricAttack"
     - получает 100 жизней и 100 брони, но теряет способность использовать магию до конца матча "PowerOverwhelming" (Референс: https://youtu.be/AJKx1XDBqNo)
     - теряет 20 монет и получает 10 брони, 10 жизней и 10 маны "AllHavePrice"
*/
    
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
                         mana: 1, health: 0, armor: 0, coin: 0,
                         name: "Spell"+String(spellIndex), position: skillPosition, gameScene: self)
        case "SkullJail":
            return Spell(skillName: skillName, texture: SKTexture(imageNamed: "Spell"+skillName),
                         mana: 6, health: 0, armor: 0, coin: 0,
                         name: "Spell"+String(spellIndex), position: skillPosition, gameScene: self)
        case "Nemesis":
            return Spell(skillName: skillName, texture: SKTexture(imageNamed: "Spell"+skillName),
                         mana: 0, health: 10, armor: 0, coin: 0,
                         name: "Spell"+String(spellIndex), position: skillPosition, gameScene: self)
        case "TouchOfMidas":
            return Spell(skillName: skillName, texture: SKTexture(imageNamed: "Spell"+skillName),
                         mana: 6, health: 0, armor: 0, coin: 0,
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
    
//
//    0 –– MatchChain.png
//    1 –– MatchSkull.png
//    2 –– MatchArmor.png
//    3 –– MatchEnergy.png
//    4 –– MatchAttack.png
//    5 –– MatchCoin.png
//    6 –– MatchPoison.png
//
    
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
                        matchMoveToBoard(matchIndex: Match.chain,
                                         nodePosition: player,
                                         i: i,
                                         j: j,
                                         waitTimeToAnimation: TimeInterval(duration),
                                         durationAnimation: interval
                        )
                    }
                }
            }
        case "Nemesis":
            var duration: Double = 0
            let interval: Double = self.durationSpawnMatchAnimation()
            for i in 0...matchBoard.verticalCount-1 {
                for j in 0...matchBoard.horizontalCount-1 {
                    if levelArr[i][j] == Match.chain  {
                        duration += interval
                        matchMoveToBoard(matchIndex: Match.armor,
                                         nodePosition: player,
                                         i: i,
                                         j: j,
                                         waitTimeToAnimation: TimeInterval(duration),
                                         durationAnimation: interval
                        )
                    }
                    if levelArr[i][j] == Match.skull {
                        duration += interval
                        matchMoveToBoard(matchIndex: Match.attack,
                                         nodePosition: player,
                                         i: i,
                                         j: j,
                                         waitTimeToAnimation: TimeInterval(duration),
                                         durationAnimation: interval
                        )
                    }
                }
            }
        //  - спавнит 6 матчейМонет "TouchOfMidas"
        case "TouchOfMidas":
            var duration: Double = 0
            let interval: Double = self.durationSpawnMatchAnimation()
            for _ in 0...5 {
                duration += interval
                matchMoveToBoard(matchIndex: Match.coin,
                                 nodePosition: player,
                                 i: matchBoard.getRandomMatchVertical(),
                                 j: matchBoard.getRandomMatchHorizontal(),
                                 waitTimeToAnimation: TimeInterval(duration),
                                 durationAnimation: interval
                )
            }
        //  - заменяет все матчиАтака на матчиЗащиты "NoOneStepBack"
        case "NoOneStepBack":
            var duration: Double = 0
            let interval: Double = self.durationSpawnMatchAnimation()
            for i in 0...matchBoard.verticalCount-1 {
                for j in 0...matchBoard.horizontalCount-1 {
                    if levelArr[i][j] == Match.attack  {
                        duration += interval
                        matchMoveToBoard(matchIndex: Match.armor,
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

    
/*
    TODO Модификаторы
    При атаке:
    - забирает Ману
    При получение урона:
    - спавнит матчЧереп в рандомном месте
    Когда теряет все броню:
    - заменяет все матчиБрони на матчиЦепей
    При смерти:
    - спавнит 5 матчейЯда в рандомных местах
 */
    
/*
     TODO МатчМеханика
     Огонь
        - распростроняется по полю, если не убрать с самого начала
        Спавнится 1 штука в углу
     АнтиМагия
        - отнимает очки маны у игрока
     Яд
        - отнимает очки жизни игнорируя броню
     ЛомательЩита
        - отнимает очки защиты
     Жизни
        - лечит игрока
     ЖизниДляВрага
        - лечит врага
*/
    
}
