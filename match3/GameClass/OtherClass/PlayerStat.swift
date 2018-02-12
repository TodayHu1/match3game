//
//  PlayerStat.swift
//  match3
//
//  Created by Евгений on 07.02.2018.
//  Copyright © 2018 Женя. All rights reserved.
//

import Foundation

class PlayerStat {
    
    var mana = 0
    var health = 0
    var armor = 0
    var attack = 0
    
    var gold = 0
    
    init(mana: Int, health: Int, armor: Int, gold: Int, attack: Int) {
        self.mana = mana
        self.health = health
        self.armor = armor
        self.attack = attack
        
        self.gold = gold
    }
}
