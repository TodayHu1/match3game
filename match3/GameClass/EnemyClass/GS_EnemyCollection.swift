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
        switch enemyName {
        case "Stony":
            return EnemyUnit(enemyName: "Stony",
                             attack: 5, health: 1, shield: 1,
                             size: CGSize(width: 130, height: 130),
                             vampire: 0, reactiveArmor: 0, gameScene: self)
        case "MotherStony":
            return EnemyUnit(enemyName: "Stony",
                             attack: 5, health: 1, shield: 1,
                             size: CGSize(width: 150, height: 150),
                             vampire: 0, reactiveArmor: 0, gameScene: self)
        case "StoneScale":
            return EnemyUnit(enemyName: "StoneScale",
                             attack: 5, health: 30, shield: 70,
                             size: CGSize(width: 150, height: 150),
                             vampire: 0, reactiveArmor: 0, gameScene: self)
        case "RoyalMage":
            return EnemyUnit(enemyName: "RoyalMage",
                             attack: 5, health: 30, shield: 70,
                             size: CGSize(width: 140, height: 140),
                             vampire: 0, reactiveArmor: 0, gameScene: self)
        case "SteamPunkPunch":
            return EnemyUnit(enemyName: "SteamPunkPunch",
                             attack: 4, health: 40, shield: 10,
                             size: CGSize(width: 120, height: 120),
                             vampire: 0, reactiveArmor: 3, gameScene: self)
        case "SteamPunkFlameThrower":
            return EnemyUnit(enemyName: "SteamPunkFlameThrower",
                             attack: 5, health: 30, shield: 70,
                             size: CGSize(width: 270, height: 120),
                             vampire: 0, reactiveArmor: 0, gameScene: self)
        case "SteamPunkWalker":
            return EnemyUnit(enemyName: "SteamPunkWalker",
                             attack: 5, health: 1, shield: 150,
                             size: CGSize(width: 260, height: 160),
                             vampire: 0, reactiveArmor: 0, gameScene: self)
        case "ShadowRin":
            return EnemyUnit(enemyName: "ShadowRin",
                             attack: 3, health: 200, shield: 0,
                             size: CGSize(width: 150, height: 150),
                             vampire: 1, reactiveArmor: 0, gameScene: self)
        case "Test":
            return EnemyUnit(enemyName: "ShadowRin",
                             attack: 3, health: 1, shield: 0,
                             size: CGSize(width: 150, height: 150),
                             vampire: 0, reactiveArmor: 0, gameScene: self)
        case "Random":
            return randomUnit.generate()
        default:
            return EnemyUnit(enemyName: "SteamPunkWalker",
                             attack: 5, health: 999, shield: 999,
                             size: CGSize(width: 999, height: 999),
                             vampire: 0, reactiveArmor: 0, gameScene: self)
        }
    }
}
