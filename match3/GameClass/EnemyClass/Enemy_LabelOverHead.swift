//
//  Enemy_LabelOverHead.swift
//  match3
//
//  Created by Женя on 01.10.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import SpriteKit

extension EnemyUnit {
    
//    func setLabelForRandomUnit() {
//        self.labelRandomUnit.fontName = "MunroSmall"
//        self.labelRandomUnit.position.x = self.zPosition + 1
//        self.labelRandomUnit.fontSize = 70
//
//    }
    
    func updateLabelOverHead() {
        setLabelOverHead(armor: self.armor, health: self.health, initLabel: false)
    }
    
    func setLabelOverHead(armor: Int, health: Int, initLabel: Bool) {
        
        if initLabel {
            self.labelBoard.removeFromParent()
            self.labelBoard.removeAllChildren()
            
            //Board
            self.labelBoard.zPosition = self.zPosition + 1
//            self.labelBoard.position.y = self.position.y + self.size.height * 1.5  + 120
            self.addChild(self.labelBoard)
            
            //Health
            self.labelHealth.fontName = "MunroSmall"
            self.labelHealth.text = String(health)
            self.labelHealth.position.x = self.labelBoard.position.x + 90
            self.labelHealth.fontSize = 70
            self.labelBoard.addChild(self.labelHealth)
            self.iconHeart.size = CGSize(width: 120, height: 120)
            self.iconHeart.zPosition = self.iconHeart.zPosition - 1
            self.iconHeart.position.y += 15
            self.labelHealth.addChild(self.iconHeart)
            
            
            //Shield
            self.labelShield.fontName = "MunroSmall"
            self.labelShield.color = UIColor.green
            self.labelShield.text = String(armor)
            self.labelShield.position.x = self.labelBoard.position.x - 90
            self.labelShield.fontSize = 70
            self.labelBoard.addChild(self.labelShield)
            self.iconShield.size = CGSize(width: 120, height: 120)
            self.iconShield.zPosition = self.iconShield.zPosition - 1
            self.iconShield.position.y += 15
            self.labelShield.addChild(self.iconShield)
            
            
            switch self.enemyName {
            case "SteamPunkWalker":
                self.labelRandomUnit.fontSize = 60
                self.labelRandomUnit.text = "Walker"
                self.labelRandomUnit.fontColor = #colorLiteral(red: 0.9753871606, green: 0.9700832951, blue: 1, alpha: 1)
            case "Doppelganger":
                self.labelRandomUnit.fontSize = 60
                self.labelRandomUnit.text = "Doppelganger"
                self.labelRandomUnit.fontColor = #colorLiteral(red: 0.9753871606, green: 0.9700832951, blue: 1, alpha: 1)
            case "SilverKnightsPaladin":
                self.labelRandomUnit.fontSize = 60
                self.labelRandomUnit.text = "Paladin"
                self.labelRandomUnit.fontColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            default:
                self.labelRandomUnit.fontSize = 1
                self.labelRandomUnit.text = ""
                self.labelRandomUnit.fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            }
            self.labelRandomUnit.fontName = "MunroSmall"
            self.labelRandomUnit.position.x = self.labelBoard.position.x - 10
            self.labelRandomUnit.position.y = self.labelBoard.position.y - 50
            self.labelBoard.addChild(self.labelRandomUnit)

            
            
        }
        
//        if self.isRandomUnit == true {
//            self.labelRandomUnit.fontName = "MunroSmall"
//            self.labelRandomUnit.position.x = self.labelBoard.position.x - 10
//            self.labelRandomUnit.position.y = self.labelBoard.position.y - 50
//            self.labelRandomUnit.fontSize = 60
//            self.labelRandomUnit.text = "modify"
//            self.labelRandomUnit.fontColor = #colorLiteral(red: 0.3927484786, green: 0.7920169734, blue: 0.7022099548, alpha: 1)
//            self.labelBoard.addChild(self.labelRandomUnit)
//        }
//        

        self.labelHealth.countFrom(fromValue: self.gameScene.stringToFloat(value: self.labelHealth.text!),
                                   to: Float(self.health),
                                   withDuration: 1,
                                   andAnimationType: .EaseOut,
                                   andCountingType: .Int)
        
        self.labelShield.countFrom(fromValue: self.gameScene.stringToFloat(value: self.labelShield.text!),
                                   to: Float(self.armor),
                                   withDuration: 1,
                                   andAnimationType: .EaseOut,
                                   andCountingType: .Int)
        
      
    }
}
