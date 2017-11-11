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
                             attack: 5, health: 30, shield: 70,
                             size: CGSize(width: 110, height: 110),
                             vampire: 0, reactiveArmor: 0)
        case "MotherStony":
            return EnemyUnit(enemyName: "Stony",
                             attack: 5, health: 30, shield: 70,
                             size: CGSize(width: 150, height: 150),
                             vampire: 0, reactiveArmor: 0)
        case "StoneScale":
            return EnemyUnit(enemyName: "StoneScale",
                             attack: 5, health: 30, shield: 70,
                             size: CGSize(width: 150, height: 150),
                             vampire: 0, reactiveArmor: 0)
        case "RoyalMage":
            return EnemyUnit(enemyName: "RoyalMage",
                             attack: 5, health: 30, shield: 70,
                             size: CGSize(width: 140, height: 140),
                             vampire: 0, reactiveArmor: 0)
        case "SteamPunkPunch":
            return EnemyUnit(enemyName: "SteamPunkPunch",
                             attack: 5, health: 30, shield: 70,
                             size: CGSize(width: 120, height: 120),
                             vampire: 0, reactiveArmor: 0)
        case "SteamPunkFlameThrower":
            return EnemyUnit(enemyName: "SteamPunkFlameThrower",
                             attack: 5, health: 30, shield: 70,
                             size: CGSize(width: 270, height: 120),
                             vampire: 0, reactiveArmor: 0)
        case "SteamPunkWalker":
            return EnemyUnit(enemyName: "SteamPunkWalker",
                             attack: 5, health: 1, shield: 500,
                             size: CGSize(width: 260, height: 160),
                             vampire: 0, reactiveArmor: 3)
        case "ShadowRin":
            return EnemyUnit(enemyName: "ShadowRin",
                             attack: 3, health: 200, shield: 0,
                             size: CGSize(width: 150, height: 150),
                             vampire: 0, reactiveArmor: 0)
        default:
            return EnemyUnit(enemyName: "SteamPunkWalker",
                             attack: 5, health: 999, shield: 999,
                             size: CGSize(width: 999, height: 999),
                             vampire: 0, reactiveArmor: 0)
        }
    }
}
