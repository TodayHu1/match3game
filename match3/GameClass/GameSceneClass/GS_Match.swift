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
//        switch matchNumber {
//        case 0:
//            return SKTexture(imageNamed:"Black.png")
//        case 1:
//            return SKTexture(imageNamed:"Pink.png")
//        case 2:
//            return SKTexture(imageNamed:"Cyan.png")
//        case 3:
//            return SKTexture(imageNamed:"DeepPurple.png")
//        case 4:
//            return SKTexture(imageNamed:"Amber.png")
//        default:
//            print("[MATCH] WRONG TEXTURE")
//            return SKTexture(imageNamed:"matchBoard.png")
//        }
        switch matchNumber {
        case 0:
            return SKTexture(imageNamed:"match_-1.png")
        case 1:
            return SKTexture(imageNamed:"match_0.png")
        case 2:
            return SKTexture(imageNamed:"match_1.png")
        case 3:
            return SKTexture(imageNamed:"match_2.png")
        case 4:
            return SKTexture(imageNamed:"match_3.png")
        case 5:
            return SKTexture(imageNamed:"match_4.png")
        case 6:
            return SKTexture(imageNamed:"match_5.png")
        default:
            print("[MATCH] WRONG TEXTURE -- \(matchNumber)")
            return SKTexture(imageNamed:"matchBoard.png")
        }
    }
    
    public func customRandom() -> Int{
        let randomNumber = gameScene.random(number: 100)
        
        //Процентная доля появления match от 100%
        let skull = 40
        let shield = 10
        let lightning = 10
        let sword = 35
        let coin = 5

        switch randomNumber {
        // Череп
        case 0..<skull:
            return 1
        // Щит
        case skull..<skull+shield:
            return 2
        // Молния
        case skull+shield..<skull+shield+lightning:
            return 3
        // Мечи
        case skull+shield+lightning..<skull+shield+lightning+sword:
            return 4
        // Монеты
        case skull+shield+lightning+sword..<skull+shield+lightning+sword+coin:
            return 5
        default:
            return 1
        }
    }
    
    func numberOfMatch() -> Int {
        return 6
    }
    
    public func durationTime() -> Double {
        return 0.34
    }
    
    
    public func moveArrLeft(index: Int) {
        swipeAnimationLeft(index: index)
        DispatchQueue.main.asyncAfter(deadline: .now() + durationTime()) {
            levelArr[index].remove(at: 0)
            levelArr[index].append(gameScene.customRandom())
            self.animationMatchCornerReverse(indexIandJ: String(index) + "5")
        }
    }
    
    public func moveArrRight(index: Int) {
        swipeAnimationRight(index: index)
        DispatchQueue.main.asyncAfter(deadline: .now() + durationTime()) {
            levelArr[index].remove(at: 5)
            levelArr[index].insert(gameScene.customRandom(), at: 0)
            self.animationMatchCornerReverse(indexIandJ: String(index) + "0")
        }
    }
    
    public func moveArrBottom(index: Int) {
        swipeAnimationDown(index: index)
        DispatchQueue.main.asyncAfter(deadline: .now() + durationTime()) {
            for i in (1...5).reversed() {
                levelArr[i][index] = levelArr[i-1][index]
            }
            levelArr[0][index] = gameScene.customRandom()
            self.animationMatchCornerReverse(indexIandJ: "0" + String(index))
        }
    }
    
    
    public func moveArrTop(index: Int) {
        swipeAnimationUp(index: index)
        DispatchQueue.main.asyncAfter(deadline: .now() + durationTime()) {
            for i in 0...4 {
                levelArr[i][index] = levelArr[i+1][index]
            }
            levelArr[5][index] = gameScene.customRandom()
            self.animationMatchCornerReverse(indexIandJ: "5" + String(index))
        }
    }
    
}
