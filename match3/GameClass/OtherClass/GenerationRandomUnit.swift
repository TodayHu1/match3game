//
//  GenerationRandomUnit.swift
//  match3
//
//  Created by Евгений on 20.11.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import SpriteKit

class GeneratRandomUnit {
    
    var unitPower: Int!
    
    var unitStat: Int!
    var unitSpell: Int!
    
    var numberUnitSpell: Int!
    
    var unitNumberAttack: Int!
    var unitNumberArmor: Int!
    var unitNumberHealth: Int!
    
    var unit: EnemyUnit!
    var gameScene: GameScene
    
    var nameEnemy: String!
    
    init(playerLvl: Int, gameScene: GameScene) {
        self.gameScene = gameScene
        let lvl = playerLvl
        unitPower = lroundf(Float(lvl/2))+1
        unitSpell = (unitPower / (self.gameScene.random(number: 10) + 1)) + 1
        unitStat = unitPower - unitSpell

        
        numberUnitSpell = lroundf(Float(lvl/10))

        unitNumberAttack = 1 + (lroundf(Float(unitStat)))
        unitNumberArmor = self.gameScene.random(number: lroundf(Float(unitStat/2)))*10
        unitNumberHealth = (unitStat * 5) + self.gameScene.random(number: unitStat)
    }
    
    ///Функция для вывода статов случайного юнита в консоль
    func echo() {
        print("==================================")
        print("\(unitPower) -- Сила юнита")
        print("\(unitStat) -- Статы юнита")
        print("\(unitSpell) -- Магия юнита")
        print("==================================")
        print("\(unitNumberAttack) -- Атака юнита")
        print("\(unitNumberArmor) -- Защита юнита")
        print("\(unitNumberHealth) -- Здоровье юнита")
        print("==================================")
    }
    
    ///Функция возврающая случайный спрайт из пула спрайтов
    func getSprite() -> String {
        let spriteArr = ["ShadowRin", "Stony", "StoneScale", "RoyalMage", "NeutralTurtle"]
        let x = spriteArr[Int(arc4random_uniform(UInt32(spriteArr.count)))]
        print("Random Sprite \(x)");
        return x
    }

    ///Функция возврающая случайные способности из пула способностей
    func generateSkills() -> [String: Int] {
        var enemySkills = [String: Int]()
        
        var skillName = ["ReactiveArmor","PoisonOnBoard","SkullOnBoard"]
        
        let numberOfSpell = lroundf(Float(unitSpell / 10))
        
        print("Number of spell --- \(numberOfSpell)")
        
        for _ in 0...numberOfSpell {
            enemySkills[skillName[(self.gameScene.random(number: enemySkills.count))-1]] = 1
        }
        
        print("Скиллы --  \(enemySkills)")
    
        return enemySkills
    }

    
    func generate() -> EnemyUnit {
        echo()
        unit = EnemyUnit(enemyName: getSprite(),
                         attack: unitNumberAttack,
                         health: unitNumberHealth,
                         shield: unitNumberArmor,
                         size: CGSize(width: 150, height: 150),
                         gameScene: gameScene)

        self.nameEnemy = getSprite()
        
        var enemySkill = generateSkills()
        
        for (name, value) in enemySkill {
            unit.specialAbilities[name] = enemySkill[name]
            print("\(name) -+- \(value)")
        }
        
//        unit.specialAbilities["ReactiveArmor"] = enemySkill[0]
//        unit.specialAbilities["PoisonOnBoard"] = enemySkill[1]
//        unit.specialAbilities["SkullOnBoard"] = enemySkill[2]
        return unit
    }
    
}


// Генерация рандомного юнита

// СилаЮнита = Округление(Уровень игрока / 2)
// СилаЮнита = Если 0, то СилаЮнита = 1

// СтатыЮнита = СилаЮнита / рандом(0...10)
// СпособностиЮнита = СилаЮнита - СтатыЮнита

//КолВоСпособностейЮнита = ОкруглениеВБольшую(Уровень игрока / 10)
//СпособностьЮнита = рандом([массивСпособностей])
//СпособностьЮнита.силаСпособности = Округление(СпособностиЮнита/КолВоСпособностейЮнита)

//СилаАтакиЮнита = Округление(СтатыЮнита/2)
//ЗащитаЮнита = Рандом(0...Округление(СтатыЮнита/2)) * 10
//ЗдоровьеЮнита = (ЗащитаЮнита * 5) + 1

