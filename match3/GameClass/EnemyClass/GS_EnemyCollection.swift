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
//Dungeon
//GrassLand
//SteamPunkBackground
    
    
    func initNewClassForEnemy(enemyName: String) -> EnemyUnit {
        
        if enemyName == "Random" {
            //Генерация случайного юнита
            return randomUnit.generate()
        }
        else {
            var createEnemyUnit = EnemyUnit(enemyName: enemyName,
                                      attack: 0, health: 0, shield: 0,
                                      size: CGSize(width: 150, height: 150),
                                      gameScene: self)
        
            print("\(enemyName) --- ENEMY NAME")
            
            switch enemyName {
            case "Dummy":
                createEnemyUnit.attack = 999
                createEnemyUnit.health = 1
                createEnemyUnit.armor = 0
                createEnemyUnit.size = CGSize(width: 100, height: 100)
                
            case "CultistsProphet":
                createEnemyUnit.attack = 30
                createEnemyUnit.health = 100
                createEnemyUnit.armor = 10
                createEnemyUnit.size = CGSize(width: 170, height: 220)
                createEnemyUnit.specialAbilities["VampireAttack"] = 1
                
            case "SteamPunkGuard":
                createEnemyUnit.attack = 20
                createEnemyUnit.health = 10
                createEnemyUnit.armor = 200
                createEnemyUnit.size = CGSize(width: 180, height: 150)
                createEnemyUnit.specialAbilities["CogOnDefense"] = 2
                
            case "NeutralTurtle":
                createEnemyUnit.attack = 20
                createEnemyUnit.health = 150
                createEnemyUnit.armor = 50
                createEnemyUnit.size = CGSize(width: 125, height: 115)
                createEnemyUnit.specialAbilities["ChainInstedArmor"] = true
                
            case "StoneScale":
                createEnemyUnit.attack = 10
                createEnemyUnit.health = 50
                createEnemyUnit.armor = 100
                createEnemyUnit.size = CGSize(width: 130, height: 130)
                createEnemyUnit.specialAbilities["SkullOnBoard"] = 2
                
            case "Stony":
                createEnemyUnit.attack = 10
                createEnemyUnit.health = 50
                createEnemyUnit.armor = 50
                createEnemyUnit.size = CGSize(width: 130, height: 130)
                createEnemyUnit.specialAbilities["PoisonOnBoard"] = 1

            case "RoyalMage":
                createEnemyUnit.attack = 20
                createEnemyUnit.health = 100
                createEnemyUnit.armor = 0
                createEnemyUnit.size = CGSize(width: 140, height: 140)
                
            case "SteamPunkPunch":
                createEnemyUnit.attack = 10
                createEnemyUnit.health = 50
                createEnemyUnit.armor = 50
                createEnemyUnit.size = CGSize(width: 120, height: 120)
                
            case "SteamPunkFlameThrower":
                createEnemyUnit.attack = 15
                createEnemyUnit.health = 50
                createEnemyUnit.armor = 100
                createEnemyUnit.size = CGSize(width: 270, height: 120)
                
            case "SteamPunkWalker":
                createEnemyUnit.attack = 15
                createEnemyUnit.health = 200
                createEnemyUnit.armor = 200
                createEnemyUnit.size = CGSize(width: 260, height: 160)
                createEnemyUnit.isBoss = true
                createEnemyUnit.specialAbilities["SteamPunkWalkerTrasform"] = true
                createEnemyUnit.specialAbilities["SpecialSpell"] = true
                createEnemyUnit.specialAbilities["CogOnDefense"] = 1
            default:
                break
            }
            
            createEnemyUnit.updateLabelOverHead()
            return createEnemyUnit
        }
        
    }
}
