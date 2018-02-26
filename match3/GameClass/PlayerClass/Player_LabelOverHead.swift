//
//  Player_LabelOverHead.swift
//  match3
//
//  Created by Женя on 01.10.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import SpriteKit

extension Player {

    func labelOverHead(shield: Int, health: Int, initLabel: Bool) {
        
        if initLabel {
            self.labelBoard.removeFromParent()
            self.labelBoard.removeAllChildren()
            
            //Board
            self.labelBoard.zPosition = self.zPosition - 500
//            self.labelBoard.position.y = self.position.y + self.size.height + 120
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
            self.labelShield.text = String(shield)
            self.labelShield.position.x = self.labelBoard.position.x - 90
            self.labelShield.fontSize = 70
            self.labelBoard.addChild(self.labelShield)
            self.iconShield.size = CGSize(width: 120, height: 120)
            self.iconShield.zPosition = self.iconShield.zPosition - 1
            self.iconShield.position.y += 15
            self.labelShield.addChild(self.iconShield)
            
            
        }
        
        
        self.labelHealth.countFrom(fromValue: self.gameScene.stringToFloat(value: self.labelHealth.text!),
                                   to: Float(self.health),
                                   withDuration: 1,
                                   andAnimationType: .EaseOut,
                                   andCountingType: .Int)
        self.labelShield.countFrom(fromValue: self.gameScene.stringToFloat(value: self.labelShield.text!),
                                   to: Float(self.shield),
                                   withDuration: 1,
                                   andAnimationType: .EaseOut,
                                   andCountingType: .Int)
    }
    
}
