//
//  Enemy_Vampire.swift
//  match3
//
//  Created by Женя on 07.10.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import SpriteKit

extension EnemyUnit {
    
    //Health = (Attack * 3) * %Vamp
    func vampireAttackMod() {
        let path = Bundle.main.path(forResource: "Blood", ofType: "sks")
        var rainParticle = NSKeyedUnarchiver.unarchiveObject(withFile: path!) as! SKEmitterNode
        self.addChild(rainParticle)
        
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
