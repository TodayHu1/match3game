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

extension GameScene {
    
    //Присвоение текстур
    func setTextureMatch(matchNumber: Int) -> SKTexture {
        switch matchNumber {
        case 0:
            return SKTexture(imageNamed:"Black.png")
        case 1:
            return SKTexture(imageNamed:"Pink.png")
        case 2:
            return SKTexture(imageNamed:"Cyan.png")
        case 3:
            return SKTexture(imageNamed:"DeepPurple.png")
        case 4:
            return SKTexture(imageNamed:"Amber.png")
        default:
            print("[MATCH] WRONG TEXTURE")
            return SKTexture(imageNamed:"matchBoard.png")
        }
    }
    
    
    public func durationTime() -> Double {
        return 0.34
    }
    
    
    public func moveArrLeft(index: Int) {
        swipeAnimationLeft(index: index)
        DispatchQueue.main.asyncAfter(deadline: .now() + durationTime()) {
            levelArr[index].remove(at: 0)
            levelArr[index].append(GameScene().random(number: 4))
            self.animationMatchCornerReverse(indexIandJ: String(index) + "5")
        }
    }
    
    public func moveArrRight(index: Int) {
        swipeAnimationRight(index: index)
        DispatchQueue.main.asyncAfter(deadline: .now() + durationTime()) {
            levelArr[index].remove(at: 5)
            levelArr[index].insert(GameScene().random(number: 4), at: 0)
            self.animationMatchCornerReverse(indexIandJ: String(index) + "0")
        }
    }
    
    public func moveArrBottom(index: Int) {
        swipeAnimationDown(index: index)
        DispatchQueue.main.asyncAfter(deadline: .now() + durationTime()) {
            for i in (1...5).reversed() {
                levelArr[i][index] = levelArr[i-1][index]
            }
            levelArr[0][index] = GameScene().random(number: 4)
            self.animationMatchCornerReverse(indexIandJ: "0" + String(index))
        }
    }
    
    
    public func moveArrTop(index: Int) {
        swipeAnimationUp(index: index)
        DispatchQueue.main.asyncAfter(deadline: .now() + durationTime()) {
            for i in 0...4 {
                levelArr[i][index] = levelArr[i+1][index]
            }
            levelArr[5][index] = GameScene().random(number: 4)
            self.animationMatchCornerReverse(indexIandJ: "5" + String(index))
        }
    }
    
}
