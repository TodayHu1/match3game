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
        
        oldString.setColorForText("attack", with: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        oldString.setColorForText("attacks", with: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
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
        
        oldString.setColorForText("item", with: #colorLiteral(red: 0.6788518684, green: 0.8138483503, blue: 0.3980326439, alpha: 1))
        
        oldString.setColorForText("Dangerous place", with: #colorLiteral(red: 0.9254902005, green: 0.5584264602, blue: 0.4500414842, alpha: 1))
        oldString.setColorForText("Additional enemy", with: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        
        return oldString
    }
    
}
