//
//  Utils.swift
//  match3
//
//  Created by Евгений on 13.04.2018.
//  Copyright © 2018 Женя. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    static let shared = Utils()
    
    ///Раскраска слов для описания
    func setColoredLabel(oldString: NSMutableAttributedString) -> NSAttributedString {
        oldString.setColorForText("skull", with: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        oldString.setColorForText("skulls", with: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        
        oldString.setColorForText("chain", with: #colorLiteral(red: 0.8039215803, green: 0.7653677631, blue: 0.6309106803, alpha: 1))
        oldString.setColorForText("chains", with: #colorLiteral(red: 0.8039215803, green: 0.7653677631, blue: 0.6309106803, alpha: 1))
        
        oldString.setColorForText("poison", with: #colorLiteral(red: 0.2285714325, green: 0.7444876269, blue: 0.5582090146, alpha: 1))
        oldString.setColorForText("poisons", with: #colorLiteral(red: 0.2285714325, green: 0.7444876269, blue: 0.5582090146, alpha: 1))
        
        oldString.setColorForText("attack", with: #colorLiteral(red: 0.8470588235, green: 0.262745098, blue: 0.4784313725, alpha: 1))
        oldString.setColorForText("attacks", with: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        oldString.setColorForText("attacked", with: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        oldString.setColorForText("attacking", with: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        oldString.setColorForText("attack power", with: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        
        oldString.setColorForText("health", with: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
        
        oldString.setColorForText("shield", with: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        oldString.setColorForText("shields", with: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        oldString.setColorForText("armor", with: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        
        oldString.setColorForText("energy", with: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
        oldString.setColorForText("energies", with: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
        oldString.setColorForText("mana", with: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
        oldString.setColorForText("mana points", with: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
        oldString.setColorForText("mana point", with: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
        
        oldString.setColorForText("coin", with: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))
        oldString.setColorForText("coins", with: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))
        oldString.setColorForText("gold", with: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))
        
        return oldString
    }
    
    ///Раскраска слов для описания типов предметов
    func setBackgroundColorLabel(oldString: NSMutableAttributedString) -> NSAttributedString {
        oldString.setColorForText("[Item]", with: #colorLiteral(red: 0.3698635356, green: 0.6549809645, blue: 0.1954145382, alpha: 1))
        
        oldString.setColorForText("[Rare]", with: #colorLiteral(red: 0.4745061458, green: 0.6789573384, blue: 1, alpha: 1))
        
        oldString.setColorForText("[Legendary]", with: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
        
        oldString.setColorForText("[Spell]", with: #colorLiteral(red: 0.670138375, green: 0.5150590541, blue: 0.9686274529, alpha: 1))
        
        return oldString
    }
    
    func getAttributedStringWithColor(string: String, color: UIColor) -> NSAttributedString {
        let attributedStringColor = [NSForegroundColorAttributeName : color];
        return NSAttributedString(string: string, attributes: attributedStringColor)
    }
    
}
