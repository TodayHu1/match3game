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
                createEnemyUnit.attack = 50
                createEnemyUnit.health = 1
                createEnemyUnit.armor = 0
                createEnemyUnit.size = CGSize(width: 100, height: 100)
            //1
            case "Stony":
                createEnemyUnit.attack = 7
                createEnemyUnit.health = 15
                createEnemyUnit.armor = 25
                createEnemyUnit.size = CGSize(width: 130, height: 130)
                createEnemyUnit.specialAbilities["PoisonOnBoard"] = 1
            //2
            case "PoisonScale":
                createEnemyUnit.attack = 9
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
                createEnemyUnit.attack = 7
                createEnemyUnit.health = 30
                createEnemyUnit.armor = 45
                createEnemyUnit.size = CGSize(width: 130, height: 130)
                createEnemyUnit.specialAbilities["SkullOnDefense"] = 1
                createEnemyUnit.specialAbilities["ChainInstedArmor"] = true
            //5
            case "SteamPunkPunch":
                createEnemyUnit.attack = 10
                createEnemyUnit.health = 51
                createEnemyUnit.armor = 51
                createEnemyUnit.size = CGSize(width: 120, height: 120)
            //6
            case "RoyalMage":
                createEnemyUnit.attack = 18
                createEnemyUnit.health = 65
                createEnemyUnit.armor = 5
                createEnemyUnit.size = CGSize(width: 140, height: 140)
            //7
            case "Geoe":
                createEnemyUnit.attack = 14
                createEnemyUnit.health = 20
                createEnemyUnit.armor = 81
                createEnemyUnit.size = CGSize(width: 120, height: 120)
                createEnemyUnit.specialAbilities["AttackUpOnDefense"] = 1.1
            //8
            case "SteamPunkFlameThrower":
                createEnemyUnit.attack = 13
                createEnemyUnit.health = 55
                createEnemyUnit.armor = 55
                createEnemyUnit.size = CGSize(width: 270, height: 120)
            //9
            case "Ram":
                createEnemyUnit.attack = 25
                createEnemyUnit.health = 65
                createEnemyUnit.armor = 22
                createEnemyUnit.size = CGSize(width: 140, height: 140)
            //10
            case "NeutralTurtle":
                createEnemyUnit.attack = 15
                createEnemyUnit.health = 20
                createEnemyUnit.armor = 80
                createEnemyUnit.size = CGSize(width: 125, height: 115)
                createEnemyUnit.specialAbilities["ChainInstedArmor"] = true
            //13
            case "CultistsProphet":
                createEnemyUnit.attack = 25
                createEnemyUnit.health = 1
                createEnemyUnit.armor = 100
                createEnemyUnit.size = CGSize(width: 170, height: 220)
                createEnemyUnit.specialAbilities["VampireAttack"] = 0.33
            //15
            case "SteamPunkGuard":
                createEnemyUnit.attack = 22
                createEnemyUnit.health = 150
                createEnemyUnit.armor = lvlDifficulty
                createEnemyUnit.size = CGSize(width: 180, height: 150)
                createEnemyUnit.specialAbilities["CogOnDefense"] = 2
            //20
            case "SilverKnightsSpear":
                createEnemyUnit.attack = 19 + lvlDifficulty
                createEnemyUnit.health = 1 + lvlDifficulty
                createEnemyUnit.armor = 100
                createEnemyUnit.size = CGSize(width: 240, height: 165)
                createEnemyUnit.specialAbilities["PoisonOnDefense"] = 1
            //22
            case "SilverKnightsPriest":
                createEnemyUnit.attack = 20 + lvlDifficulty
                createEnemyUnit.health = 1 + lvlDifficulty
                createEnemyUnit.armor = 110
                createEnemyUnit.size = CGSize(width: 130, height: 150)
                createEnemyUnit.specialAbilities["PoisonOnDefense"] = 1
            //25
            case "SilverKnightsStandardBearer":
                createEnemyUnit.attack = 21 + lvlDifficulty
                createEnemyUnit.health = 1 + lvlDifficulty
                createEnemyUnit.armor = 120
                createEnemyUnit.size = CGSize(width: 180, height: 190)
                createEnemyUnit.specialAbilities["PoisonOnDefense"] = 1
//                createEnemyUnit.specialAbilities["PoisonOnBreakMod"] = true
            //Boss 1
            case "Doppelganger":
                createEnemyUnit.attack = playerStat.attack
                createEnemyUnit.health = playerStat.healthNow
                createEnemyUnit.armor = playerStat.armorNow
                createEnemyUnit.size = CGSize(width: 155, height: 130)
                createEnemyUnit.specialAbilities["SkullOnDefense"] = 1
                createEnemyUnit.specialAbilities["SkullOnBoard"] = 2

//                if playerStat.manaMax > 8 {
//                    createEnemyUnit.specialAbilities["SkullOnDefense"] = 2
//                }
//                else {
//                    createEnemyUnit.specialAbilities["SkullOnDefense"] = 1
//                }
//
//                
//                if playerStat.attack > 17 {
//                    createEnemyUnit.specialAbilities["ChainInstedArmor"] = true
//                }
//                else {
//                    createEnemyUnit.specialAbilities["ChainInstedArmor"] = false
//                }
//                
//                if playerStat.armorMax > 150 {
//                    createEnemyUnit.specialAbilities["SkullOnBoard"] = 3
//                }
//                else {
//                    createEnemyUnit.specialAbilities["SkullOnBoard"] = 2
//                }
//                
//                if playerStat.healthMax > 100 {
//                    createEnemyUnit.specialAbilities["PoisonOnBreakMod"] = true
//                    createEnemyUnit.attack = Int(playerStat.attack / 2)
//                }
//                else {
//                    createEnemyUnit.specialAbilities["PoisonOnBreakMod"] = false
//                }
                
            //Boss 2
            case "SteamPunkWalker":
                createEnemyUnit.attack = 22
                createEnemyUnit.health = 250
                createEnemyUnit.armor = 250
                createEnemyUnit.size = CGSize(width: 260, height: 160)
                createEnemyUnit.isBoss = true
                createEnemyUnit.specialAbilities["SteamPunkWalkerTrasform"] = true
                createEnemyUnit.specialAbilities["SpecialSpell"] = true
                createEnemyUnit.specialAbilities["CogOnDefense"] = 1
                
            //Boss 3
            case "SilverKnightsPaladin":
                createEnemyUnit.attack = 4
                createEnemyUnit.health = 44
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
