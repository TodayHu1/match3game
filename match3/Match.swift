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
    
    
    public func moveArrLeft(index: Int) {
        levelArr[index].remove(at: 0)
        levelArr[index].append(GameScene().random(number: 4))
        
        
    }
    
    

    
    public func moveArrRight(index: Int) {
        levelArr[index].remove(at: 5)
        levelArr[index].insert(GameScene().random(number: 4), at: 0)
    }
    
    public func moveArrBottom(index: Int) {
        for i in (1...5).reversed() {
            print(i)
            levelArr[i][index] = levelArr[i-1][index]
        }
        levelArr[0][index] = GameScene().random(number: 4)
        print(levelArr)    }
    
    
    public func moveArrTop(index: Int) {
        for i in 0...4 {
            print(i)
            levelArr[i][index] = levelArr[i+1][index]
        }
        levelArr[5][index] = GameScene().random(number: 4)
        print(levelArr)
    }
    
    static func checkArr() {

    }

}
