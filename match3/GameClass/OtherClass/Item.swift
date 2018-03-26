//
//  Item.swift
//  match3
//
//  Created by Евгений on 26.03.2018.
//  Copyright © 2018 Женя. All rights reserved.
//

import Foundation

class Item {
    
    var armor: Int = 0
    var health: Int = 0
    var attack: Int = 0
    var mana: Int = 0
    
    var img: String = ""
    var name: String = ""
    var description: String = ""
    
    var vampirism: Int = 0
    var evasion: Int = 0
    var critacal: Int = 0
    var blockDamage: Int = 0
    
    var spellName: String!
    
    var type: itemType!
    
    enum itemType {
        case item
        case spell
    }
    
    ///Инициализация для предмета
    init(armor: Int, health: Int, attack: Int, mana: Int, img: String, name: String, description: String) {
        self.armor = armor
        self.health = health
        self.attack = attack
        self.mana = mana
        
        self.img = img
        self.name = "[Item] \(name)"
        self.description = description
        
        self.type = .item
    }
    
    ///Инициализация для редкого предмета
    init (vampirism: Int, evasion: Int, critacal: Int, blockDamage: Int, img: String, name: String, description: String) {
        self.img = img
        self.name = "[Rare] \(name)"
        self.description = description
        
        self.type = .item
    }
    
    ///Инициализация для легендарного предмета
    init (img: String, name: String, description: String) {
        self.img = img
        self.name = "[Legendary] \(name)"
        self.description = description
        
        self.type = .item
    }
    
    ///Инициализация для активной способности
    init (name: String) {
        let gameScene = GameScene()
        let spell = gameScene.spellBook(skillName: name, spellIndex: 0)
        
        self.img = "Spell\(name)"
        self.name = "[Spell] \(name)"
        self.spellName = name
        self.description = spell.skillDescription
        
        self.type = .spell
    }
}
