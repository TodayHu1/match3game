//
//  Enemy_Vampire.swift
//  match3
//
//  Created by Женя on 07.10.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation

extension EnemyUnit {
    
    
    //Health = (Attack * 3) * %Vamp
    func vampireAttackMod() {
        self.health += Int(
            Float(self.attack * 3) * Float(self.vampireAttack)
        )
        labelOverHead(shield: self.attack, health: self.health, initLabel: false)
    }
    
    //Shield = Shield + Attack
    func armorAttackMod() {
        self.shield += self.attack
        labelOverHead(shield: self.attack, health: self.health, initLabel: false)
    }
    
    
    
}
