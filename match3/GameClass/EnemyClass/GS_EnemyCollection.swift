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
            //4
            case "ChainScale":
                createEnemyUnit.attack = 8
                createEnemyUnit.health = 30
                createEnemyUnit.armor = 45
                createEnemyUnit.size = CGSize(width: 130, height: 130)
                createEnemyUnit.specialAbilities["SkullOnDefense"] = 1
                createEnemyUnit.specialAbilities["ChainInstedArmor"] = true
            //5
            case "SteamPunkPunch":
                createEnemyUnit.attack = 12
                createEnemyUnit.health = 51
                createEnemyUnit.armor = 51
                createEnemyUnit.size = CGSize(width: 120, height: 120)
            //6
            case "RoyalMage":
                createEnemyUnit.attack = 22
                createEnemyUnit.health = 65
                createEnemyUnit.armor = 5
                createEnemyUnit.size = CGSize(width: 140, height: 140)
            //7
            case "Geoe":
                createEnemyUnit.attack = 16
                createEnemyUnit.health = 20
                createEnemyUnit.armor = 81
                createEnemyUnit.size = CGSize(width: 120, height: 120)
                createEnemyUnit.specialAbilities["AttackUpOnDefense"] = 1.1
            //8
            case "SteamPunkFlameThrower":
                createEnemyUnit.attack = 15
                createEnemyUnit.health = 55
                createEnemyUnit.armor = 55
                createEnemyUnit.size = CGSize(width: 270, height: 120)
            //9
            case "Ram":
                createEnemyUnit.attack = 33
                createEnemyUnit.health = 65
                createEnemyUnit.armor = 22
                createEnemyUnit.size = CGSize(width: 140, height: 140)
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
                createEnemyUnit.specialAbilities["VampireAttack"] = 0.33
            //15
            case "SteamPunkGuard":
                createEnemyUnit.attack = 25
                createEnemyUnit.health = 141
                createEnemyUnit.armor = 0
                createEnemyUnit.size = CGSize(width: 180, height: 150)
                createEnemyUnit.specialAbilities["CogOnDefense"] = 2
            //20
            case "SilverKnightsSpear":
                createEnemyUnit.attack = 41
                createEnemyUnit.health = 20
                createEnemyUnit.armor = 111
                createEnemyUnit.size = CGSize(width: 240, height: 165)
                createEnemyUnit.specialAbilities["PoisonOnDefense"] = 1
            //22
            case "SilverKnightsPriest":
                createEnemyUnit.attack = 44
                createEnemyUnit.health = 30
                createEnemyUnit.armor = 151
                createEnemyUnit.size = CGSize(width: 130, height: 150)
                createEnemyUnit.specialAbilities["PoisonOnDefense"] = 1
            //25
            case "SilverKnightsStandardBearer":
                createEnemyUnit.attack = 42
                createEnemyUnit.health = 40
                createEnemyUnit.armor = 191
                createEnemyUnit.size = CGSize(width: 180, height: 190)
                createEnemyUnit.specialAbilities["PoisonOnDefense"] = 1
                
            //Boss 1
            case "Doppelganger":
                createEnemyUnit.attack = playerStat.attack
                createEnemyUnit.health = playerStat.healthNow
                createEnemyUnit.armor = playerStat.armorNow
                createEnemyUnit.size = CGSize(width: 155, height: 130)
                createEnemyUnit.specialAbilities["ChainInstedArmor"] = true
                createEnemyUnit.specialAbilities["SkullOnBoard"] = 3
                createEnemyUnit.specialAbilities["SkullOnDefense"] = 1
                
            //Boss 2
            case "SteamPunkWalker":
                createEnemyUnit.attack = 19
                createEnemyUnit.health = 210
                createEnemyUnit.armor = 210
                createEnemyUnit.size = CGSize(width: 260, height: 160)
                createEnemyUnit.isBoss = true
                createEnemyUnit.specialAbilities["SteamPunkWalkerTrasform"] = true
                createEnemyUnit.specialAbilities["SpecialSpell"] = true
                createEnemyUnit.specialAbilities["CogOnDefense"] = 1
                
            //Boss 3
            case "SilverKnightsPaladin":
                createEnemyUnit.attack = 3
                createEnemyUnit.health = 22
                createEnemyUnit.armor = 444
                createEnemyUnit.size = CGSize(width: 505, height: 259)
                createEnemyUnit.isBoss = true
                createEnemyUnit.specialAbilities["VampireAttack"] = 0.1
                createEnemyUnit.specialAbilities["AttackUpOnDefense"] = 1.5
            default:
                break
            }
            
            createEnemyUnit.updateLabelOverHead()
            return createEnemyUnit
        }
        
    }
}

///["SilverKnightsPaladin","ChainScale","Ram","SilverKnightsStandardBearer","SilverKnightsSpear","SilverKnightsPriest","Geoe"]
