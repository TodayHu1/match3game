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
    
    var spellArmor = 0
    var spellHealth = 0
    var spellMana = 0
    var spellGold = 0
    
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
        case legendary
        case potion
    }
    
    var percentOfheal: Int = 0
    var potion: potionType!
    
    enum potionType {
        case heal
        case mana
        case armor
    }
    
    ///Инициализация для предмета
    init(armor: Int, health: Int, attack: Int, mana: Int, img: String, name: String) {
        self.armor = armor
        self.health = health
        self.attack = attack
        self.mana = mana
        
        self.img = img
        self.name = "[Item] \(name)"
        
        self.description = generateItemDescription(armor: armor, health: health, attack: attack, mana: mana)
        
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
        
        self.type = .legendary
    }
    
    ///Инициализация для активной способности
    init (name: String) {
        let gameScene = GameScene()
        let spell = gameScene.spellBook(skillName: name, spellIndex: 0)
        
        self.spellGold = spell.coinToUse
        self.spellMana = spell.manaToUse
        self.spellArmor = spell.armorToUse
        self.spellHealth = spell.healthToUse
        
        self.img = "Spell\(name)"
        self.name = "[Spell] \(name)"
        self.spellName = name
        self.description = spell.skillDescription
        
        self.type = .spell
    }
    
    
    ///Generate description for item
    func generateItemDescription(armor: Int, health: Int, attack: Int, mana: Int) -> String {
        var desc = ""
        
        if armor > 0 || health > 0 || attack > 0 || mana > 0 {
            desc.append("Gain ")
        }
        
        if armor > 0 {
            desc.append("\(armor) armor ")
        }
        if health > 0 {
            desc.append("\(health) health ")
        }
        if attack > 0 {
            desc.append("\(attack) attack ")
        }
        if mana > 0 {
            desc.append("\(mana) mana ")
        }
        
        if armor < 0 || health < 0 || attack < 0 || mana < 0 {
            desc.append(", but lose ")
        }
        
        if armor < 0 {
            desc.append("\(abs(armor)) armor ")
        }
        if health < 0 {
            desc.append("\(abs(health)) health ")
        }
        if attack < 0 {
            desc.append("\(abs(attack)) attack ")
        }
        if mana < 0 {
            desc.append("\(abs(mana)) mana ")
        }
        
        return desc
        //return "gain 66 armor, but lose 15 health"
    }
    
}
