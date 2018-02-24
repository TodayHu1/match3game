//
//  PlayerStat.swift
//  match3
//
//  Created by Евгений on 07.02.2018.
//  Copyright © 2018 Женя. All rights reserved.
//

import Foundation

class PlayerStat: NSObject, NSCoding {
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(mana, forKey: "mana")
        aCoder.encode(health, forKey: "health")
        aCoder.encode(armor, forKey: "armor")
        aCoder.encode(attack, forKey: "attack")
        
        aCoder.encode(gold, forKey: "gold")
        
        aCoder.encode(spellArr, forKey: "spellArr")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let mana = aDecoder.decodeInteger(forKey: "mana")
        let health = aDecoder.decodeInteger(forKey: "health")
        let armor = aDecoder.decodeInteger(forKey: "armor")
        let attack = aDecoder.decodeInteger(forKey: "attack")
        
        let gold = aDecoder.decodeInteger(forKey: "gold")
        
        let spellArr = aDecoder.decodeObject(forKey: "spellArr") as! [String]
        
        self.init(mana: mana, health: health, armor: armor, gold: gold, attack: attack, spellArr: spellArr)
    }
    
    
    var mana = 0
    var health = 0
    var armor = 0
    var attack = 0
    
    var gold = 0
    
    var spellArr = ["Null","Null","Null","Null"]
    
    init(mana: Int, health: Int, armor: Int, gold: Int, attack: Int, spellArr: [String]) {
        self.mana = mana
        self.health = health
        self.armor = armor
        self.attack = attack
        
        self.gold = gold
        
        self.spellArr = spellArr
        
    }
}
