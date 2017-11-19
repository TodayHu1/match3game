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
    - Поочередность атаки (Враг - Игрок)
    - Блокировка управления пользователя во время экшена (Gesture)
    + Плата за скиллы
    - Инициализатор для сцены
    - Анимация смерти персонажа
    - Ходы для врага
    - Счетчик монет + анимация
    - Иконки модификаторов
    + Система спеллов в этом классе
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
    
    
    
//    let labelmana = SKLabelNode(text: "\(manaToUse)")
//    skillNode.addChild(labelmana)
//    labelmana.position = CGPoint(x: skillNode.frame.width/5 , y: skillNode.frame.height/5)
//    labelmana.zPosition = 9999
//    labelmana.horizontalAlignmentMode = .center
//    labelmana.verticalAlignmentMode = .center
//    labelmana.fontName = "MunroSmall"
//    print(labelmana)
    
    
//    func initSpellOnBoard() {
//        let spell = SKSpriteNode(imageNamed: "SpellSkullJail.png")
////        spell.position = CGPoint()
//        gameScene.addChild(spell)
//    }
//
//    func getStatSpell() -> [Int] {
//        let manaToUse = 0
//        let healthToUse = 10
//        let armorToUse = 10
//        let cointToUse = 0
//        return [manaToUse,healthToUse,armorToUse,cointToUse]
//    }
//
//

//
    func spellBook(skillName: String, spellIndex: Int) -> Spell {
        var skillPosition: CGPoint
        if spellIndex < 3 {
            skillPosition = CGPoint(x: -140+((spellIndex-1)*70), y: 80)
        }
        else {
            skillPosition = CGPoint(x: 0+((spellIndex-2)*70), y: 80)
        }
        
        print(skillPosition)

        switch skillName {
        case "SkullJail":
            return Spell(skillName: skillName, texture: SKTexture(imageNamed: "Spell"+skillName),
                         mana: 6, health: 0, armor: 0, coin: 0,
                         name: "Spell"+String(spellIndex), position: skillPosition)
        case "Nemesis":
            return Spell(skillName: skillName, texture: SKTexture(imageNamed: "Spell"+skillName),
                         mana: 0, health: 10, armor: 0, coin: 0,
                         name: "Spell"+String(spellIndex), position: skillPosition)
        case "TouchOfMidas":
            return Spell(skillName: skillName, texture: SKTexture(imageNamed: "Spell"+skillName),
                         mana: 6, health: 0, armor: 0, coin: 0,
                         name: "Spell"+String(spellIndex), position: skillPosition)
        case "NoOneStepBack":
            return Spell(skillName: skillName, texture: SKTexture(imageNamed: "Spell"+skillName),
                         mana: 2, health: 0, armor: 0, coin: 0,
                         name: "Spell"+String(spellIndex), position: skillPosition)
        default:
            return Spell(skillName: "0", texture: SKTexture(imageNamed: ""),
                         mana: 666, health: 666, armor: 666, coin: 666,
                         name: "Spell"+String(spellIndex), position: skillPosition )
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
        case "SkullJail":
            var duration: Double = 0
            let interval: Double = 0.225
            for i in 0...matchBoard.verticalCount-1 {
                for j in 0...matchBoard.horizontalCount-1 {
                    if levelArr[i][j] == 1 {
                        duration += interval
                        matchMoveToBoard(matchIndex: 0,
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
            let interval: Double = 0.225
            for i in 0...matchBoard.verticalCount-1 {
                for j in 0...matchBoard.horizontalCount-1 {
                    if levelArr[i][j] == 0  {
                        duration += interval
                        matchMoveToBoard(matchIndex: 2,
                                         nodePosition: player,
                                         i: i,
                                         j: j,
                                         waitTimeToAnimation: TimeInterval(duration),
                                         durationAnimation: interval
                        )
                    }
                    if levelArr[i][j] == 1 {
                        duration += interval
                        matchMoveToBoard(matchIndex: 4,
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
            let interval: Double = 0.225
            for _ in 0...5 {
                duration += interval
                matchMoveToBoard(matchIndex: 5,
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
            let interval: Double = 0.225
            for i in 0...matchBoard.verticalCount-1 {
                for j in 0...matchBoard.horizontalCount-1 {
                    if levelArr[i][j] == 4  {
                        duration += interval
                        matchMoveToBoard(matchIndex: 2,
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
