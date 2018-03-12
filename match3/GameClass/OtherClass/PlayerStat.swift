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
        aCoder.encode(manaNow, forKey: "manaNow")
        aCoder.encode(manaMax, forKey: "manaMax")
        
        aCoder.encode(healthNow, forKey: "healthNow")
        aCoder.encode(healthMax, forKey: "healthMax")
        
        aCoder.encode(armorNow, forKey: "armorNow")
        aCoder.encode(armorMax, forKey: "armorMax")
        
        aCoder.encode(attack, forKey: "attack")
        
        aCoder.encode(gold, forKey: "gold")
        
        aCoder.encode(spellOnBoard, forKey: "spellArr")
        
        aCoder.encode(spellInBag, forKey: "spellInBag")
    }
    
    
    required convenience init?(coder aDecoder: NSCoder) {
        let manaNow = aDecoder.decodeInteger(forKey: "manaNow")
        let manaMax = aDecoder.decodeInteger(forKey: "manaMax")
        
        let healthNow = aDecoder.decodeInteger(forKey: "healthNow")
        let healthMax = aDecoder.decodeInteger(forKey: "healthMax")
        
        let armorNow = aDecoder.decodeInteger(forKey: "armorNow")
        let armorMax = aDecoder.decodeInteger(forKey: "armorMax")
        
        let gold = aDecoder.decodeInteger(forKey: "gold")
        
        let attack = aDecoder.decodeInteger(forKey: "attack")
        
        let spellArr = aDecoder.decodeObject(forKey: "spellArr") as! [String]
        
        var spellInBag = [String]()
        
        if nil != aDecoder.decodeObject(forKey: "spellInBag") as? [String] {
            spellInBag = aDecoder.decodeObject(forKey: "spellInBag") as! [String]
        }
        else {
            spellInBag = []
        }
        
        self.init(manaNow: manaNow, manaMax: manaMax, healthNow: healthNow, healthMax: healthMax, armorNow: armorNow, armorMax: armorMax, gold: gold, attack: attack, spellArr: spellArr, spellInBag: spellInBag)
    }
    
    var manaNow = 0
    var manaMax = 0
    
    var healthNow = 0
    var healthMax = 0
    
    var armorNow = 0
    var armorMax = 0
    
    var attack = 0
    
    var gold = 0
    
    var spellOnBoard = ["Null","Null","Null","Null"]
    
    var spellInBag = [String]()
    
    ///Полная инициализация класса
    init(manaNow: Int, manaMax: Int, healthNow: Int, healthMax: Int, armorNow: Int, armorMax: Int, gold: Int, attack: Int, spellArr: [String], spellInBag: [String]) {
        
        print("ПОЛНАЯ ИНИЦ \(armorMax)")
        
        self.manaMax = manaMax
        self.healthMax = healthMax
        self.armorMax = armorMax
        
        self.attack = attack
        
        self.manaNow = manaNow
        self.healthNow = healthNow
        self.armorNow = armorNow
        
        self.gold = gold
        
        self.spellOnBoard = spellArr
        self.spellInBag = spellInBag
    }
    
    init(manaMax: Int, healthMax: Int, armorMax: Int, attack: Int, spellArr: [String]) {
        
        print("МАХ ИНИЦ \(armorMax)")
        
        self.manaMax = manaMax
        self.healthMax = healthMax
        self.armorMax = armorMax
        self.attack = attack
        
        self.spellOnBoard = spellArr
        
        self.manaNow = manaMax
        self.healthNow = healthMax
        self.armorNow = armorMax
        
        self.gold = 0
    }
}
