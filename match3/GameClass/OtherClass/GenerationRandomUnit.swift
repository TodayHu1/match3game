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
    
    func getSprite() -> String {
        let spriteArr = ["ShadowRin", "Stony", "StoneScale", "RoyalMage", "NeutralTurtle"]
        let x = spriteArr[Int(arc4random_uniform(UInt32(spriteArr.count)))]
        print("Random Sprite \(x)");
        return x
    }


    
    func generate() -> EnemyUnit {
        echo()
        
        var skills = [0,0,0]
        
        var numberOfSpell = lroundf(Float(unitSpell / 10))
        
        print("Number of spell --- \(numberOfSpell)")
        
        for i in 0...numberOfSpell {
            skills[(self.gameScene.random(number: skills.count))-1] = 1
        }
        
        print("Скиллы --  \(skills)")
        
        let armorOnAttack = skills[0]
        let poisonOnAttack = skills[1]
        let skullOnAttack = skills[2]
        

        unit = EnemyUnit(enemyName: getSprite(),
                         attack: unitNumberAttack,
                         health: unitNumberHealth,
                         shield: unitNumberArmor,
                         size: CGSize(width: 150, height: 150),
                         vampireOnAttack: 0,
                         armorOnAttack: armorOnAttack,
                         poisonOnAttack: poisonOnAttack,
                         skullOnAttack: skullOnAttack,
                         chainInstedArmorOnBreakArmor: false,
                         cogOnDefense: 0,
                         gameScene: gameScene)
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

