//
//  GS_EnemyCollection.swift
//  match3
//
//  Created by Женя on 04.11.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import SceneKit
import SpriteKit
import GameplayKit

extension GameScene {

    func initNewClassForEnemy(enemyName: String) -> EnemyUnit {
        
        var size = CGSize(width: 150, height: 150)
        
        var attack = 5
        var health = 10
        var armor = 30
        
        //Attack
        var vampireOnAttack = 0
        var reactiveArmorOnAttack = 0
        var poisonOnAttack = 0
        var skullOnAttack = 0
        
        //BreakArmor
        var chainInstedArmorOnBreakArmor = false
        
        //Defense
        var cogOnDefense = 0
        
        switch enemyName {
        case "Stony":
            //Size
            size = CGSize(width: 130, height: 130)
            
            //Stat
            attack = 5
            health = 30
            armor = 10
            
            //Special
            poisonOnAttack = 1
            chainInstedArmorOnBreakArmor = true
            
        case "RoyalMage":
            //Size
            size = CGSize(width: 140, height: 140)
            
            //Stat
            attack = 5
            health = 30
            armor = 70
            
        case "SteamPunkPunch":
            //Size
            size = CGSize(width: 120, height: 120)
            
            //Stat
            attack = 4
            health = 40
            armor = 10
            
            //Special
            reactiveArmorOnAttack = 3
            
        case "SteamPunkFlameThrower":
            
            //Size
            size = CGSize(width: 270, height: 120)
            
            //Stat
            attack = 5
            health = 30
            armor = 70
            
        case "SteamPunkWalker":
            
            //Size
            size = CGSize(width: 260, height: 160)
            
            //Stat
            attack = 8
            health = 40
            armor = 40
        case "Random":
            //Генерация юнита
            return randomUnit.generate()
            
        default:
            break
        }
        
        return EnemyUnit(enemyName: enemyName,
                         attack: attack, health: health, shield: armor,
                         size: size,
                         vampireOnAttack: Float(vampireOnAttack),
                         armorOnAttack: reactiveArmorOnAttack,
                         poisonOnAttack: poisonOnAttack,
                         skullOnAttack: skullOnAttack,
                         chainInstedArmorOnBreakArmor: chainInstedArmorOnBreakArmor,
                         cogOnDefense: cogOnDefense,
                         gameScene: self)
        
    }
}
