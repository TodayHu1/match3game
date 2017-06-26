//
//  match.swift
//  match3
//
//  Created by Женя on 26.06.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Match: SKScene {
    

    
    //Присвоение текстур
    func setTextureMatch(matchNamber: Int) -> SKTexture {
        switch matchNamber {
        case 0:
            return SKTexture(imageNamed:"match_block.png")
        case 1:
            return SKTexture(imageNamed:"match_sword.png")
        case 2:
            return SKTexture(imageNamed:"match_shield.png")
        case 3:
            return SKTexture(imageNamed:"match_staff.png")
        case 4:
            return SKTexture(imageNamed:"match_heal.png")
        default:
            print("[MATCH] WRONG TEXTURE")
            return SKTexture(imageNamed:"matchBoard.png")
        }
    }
    
    
    public func moveArrLeft(array: [Int]) {
        var xarray = array
        xarray.remove(at: 0)
        xarray.append(0)
        levelArr[0] = xarray
        GameScene().buildLevel()

    }

    
    static func checkArr() {
//        for i in 0...5 {
//            for j in 0...5 {
//                for k in 1...4 {
//                    
//                }
//            }
//        }
    }

}
