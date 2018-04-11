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
            //1
            case "Stony":
                createEnemyUnit.attack = 8
                createEnemyUnit.health = 15
                createEnemyUnit.armor = 25
                createEnemyUnit.size = CGSize(width: 130, height: 130)
                createEnemyUnit.specialAbilities["PoisonOnBoard"] = 1
            //2
            case "PoisonScale":
                createEnemyUnit.attack = 11
                createEnemyUnit.health = 20
                createEnemyUnit.armor = 35
                createEnemyUnit.size = CGSize(width: 125, height: 125)
                createEnemyUnit.specialAbilities["PoisonOnBoard"] = 2
            //3
            case "StoneScale":
                createEnemyUnit.attack = 9
                createEnemyUnit.health = 35
                createEnemyUnit.armor = 40
                createEnemyUnit.size = CGSize(width: 130, height: 130)
                createEnemyUnit.specialAbilities["SkullOnBoard"] = 1
            //5
            case "SteamPunkPunch":
                createEnemyUnit.attack = 12
                createEnemyUnit.health = 50
                createEnemyUnit.armor = 50
                createEnemyUnit.size = CGSize(width: 120, height: 120)
            //6
            case "RoyalMage":
                createEnemyUnit.attack = 22
                createEnemyUnit.health = 65
                createEnemyUnit.armor = 5
                createEnemyUnit.size = CGSize(width: 140, height: 140)
            //8
            case "SteamPunkFlameThrower":
                createEnemyUnit.attack = 15
                createEnemyUnit.health = 55
                createEnemyUnit.armor = 55
                createEnemyUnit.size = CGSize(width: 270, height: 120)
            //10
            case "NeutralTurtle":
                createEnemyUnit.attack = 18
                createEnemyUnit.health = 20
                createEnemyUnit.armor = 80
                createEnemyUnit.size = CGSize(width: 125, height: 115)
                createEnemyUnit.specialAbilities["ChainInstedArmor"] = true
            //13
            case "CultistsProphet":
                createEnemyUnit.attack = 33
                createEnemyUnit.health = 1
                createEnemyUnit.armor = 100
                createEnemyUnit.size = CGSize(width: 170, height: 220)
                createEnemyUnit.specialAbilities["VampireAttack"] = 1
            //15
            case "SteamPunkGuard":
                createEnemyUnit.attack = 25
                createEnemyUnit.health = 141
                createEnemyUnit.armor = 0
                createEnemyUnit.size = CGSize(width: 180, height: 150)
                createEnemyUnit.specialAbilities["CogOnDefense"] = 2
            //Boss 1
            case "SteamPunkWalker":
                createEnemyUnit.attack = 16
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
