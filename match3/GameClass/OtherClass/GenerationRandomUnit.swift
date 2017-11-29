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
        let lvl = playerLvl * 5
        unitPower = lroundf(Float(lvl/2))+1
        unitSpell = (unitPower / (self.gameScene.random(number: 10) + 1)) + 1
        unitStat = unitPower - unitSpell

        
        numberUnitSpell = lroundf(Float(lvl/10))
        //Добавить способности
        //...
        
        unitNumberAttack = 1 + (lroundf(Float(unitStat)))
        unitNumberArmor = self.gameScene.random(number: lroundf(Float(unitStat/2)))*10
        unitNumberHealth = (unitStat * 5) + 1
    }
    
    func echo() {
        print("==================================")
//        print("\(unitPower) -- Сила юнита")
        print("\(unitStat) -- Статы юнита")
//        print("\(unitSpell) -- Магия юнита")
        print("==================================")
        print("\(unitNumberAttack) -- Атака юнита")
        print("\(unitNumberArmor) -- Защита юнита")
        print("\(unitNumberHealth) -- Здоровье юнита")
        print("==================================")
    }

    func generate() -> EnemyUnit {
        echo()
        unit = EnemyUnit(enemyName: "RandomTestUnit",
                         attack: unitNumberAttack,
                         health: unitNumberHealth,
                         shield: unitNumberArmor,
                         size: CGSize(width: 150, height: 150),
                         vampire: 0, reactiveArmor: 0,
                         gameScene: gameScene)
//        unit.color = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
////        unit.blendMode = .screen
//        unit.colorBlendFactor = 1
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

