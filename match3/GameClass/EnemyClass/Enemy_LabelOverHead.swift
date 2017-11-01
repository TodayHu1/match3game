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
//            self.labelBoard.position = self.position
            //        self.labelBoard.position.y = self.position.y + 50
            self.labelBoard.position.x = self.position.x - self.size.width/2
            self.labelBoard.position.y += 400
            self.labelBoard.anchorPoint.y = 0.0
//            self.labelBoard.fontName = "TrebuchetMS"
            self.addChild(self.labelBoard)
            
            //Health
            self.labelHealth.fontName = "TrebuchetMS"
            self.labelHealth.text = String(health)
            self.labelHealth.position.x = self.labelBoard.position.x - self.size.width
            self.labelHealth.fontSize = 50
            self.labelBoard.addChild(self.labelHealth)
            self.iconHeart.position.x -= 100
            self.iconHeart.position.y += 20
            self.labelHealth.addChild(self.iconHeart)
            
            
            //Shield
            self.labelShield.fontName = "TrebuchetMS"
            self.labelShield.text = String(shield)
            self.labelShield.position.x = self.labelBoard.position.x + self.size.width
            self.labelShield.fontSize = 50
            self.labelBoard.addChild(self.labelShield)
            self.iconShield.position.x -= 100
            //        self.iconShield.position.y += self.iconShield.size.width/2
            self.iconShield.position.y += 20
            self.labelShield.addChild(self.iconShield)
        }
        
        self.labelHealth.text = String(self.health)
        self.labelShield.text = String(self.shield)

        
        
    }
    
}
