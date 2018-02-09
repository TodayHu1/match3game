//
//  PlayerStat.swift
//  match3
//
//  Created by Евгений on 07.02.2018.
//  Copyright © 2018 Женя. All rights reserved.
//

import Foundation

class PlayerStat {
    
    var mana = 10
    var health = 20
    var armor = 30
    var attack = 10
    
    var gold = 40
    
    init(mana: Int, health: Int, armor: Int, gold: Int, attack: Int) {
        self.mana = mana
        self.health = health
        self.armor = armor
        self.attack = attack
        
        self.gold = gold
    }
}
