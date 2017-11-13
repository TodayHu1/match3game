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
    
    func labelOverHead(shield: Int, health: Int, initLabel: Bool) {
        
        if initLabel {
            self.labelBoard.removeFromParent()
            self.labelBoard.removeAllChildren()
            
            //Board
            self.labelBoard.zPosition = self.zPosition + 1
            self.labelBoard.position.y = self.position.y + self.size.height * 1.5  + 120
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
        
        self.labelHealth.text = String(self.health)
        self.labelShield.text = String(self.shield)
    }
    
}