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

public enum Match: Int {
    case null = -1
    case chain = 0
    case skull = 1
    case armor = 2
    case energy = 3
    case attack = 4
    case coin = 5
    case poison = 6
    case cog = 7
}

extension GameScene {
    
     /**
     0 –– MatchChain.png
     1 –– MatchSkull.png
     2 –– MatchArmor.png
     3 –– MatchEnergy.png
     4 –– MatchAttack.png
     5 –– MatchCoin.png
     6 –– MatchPoison.png
     */
    
    func setTextureMatch(matchNumber: Match) -> SKTexture {
        switch matchNumber {
        case Match.chain:
            return SKTexture(imageNamed:"MatchChain.png")
        case Match.skull:
            return SKTexture(imageNamed:"MatchSkull.png")
        case Match.armor:
            return SKTexture(imageNamed:"MatchArmor.png")
        case Match.energy:
            return SKTexture(imageNamed:"MatchEnergy.png")
        case Match.attack:
            return SKTexture(imageNamed:"MatchAttack.png")
        case Match.coin:
            return SKTexture(imageNamed:"MatchCoin.png")
        case Match.poison:
            return SKTexture(imageNamed:"MatchPoison.png")
        case Match.cog:
            return SKTexture(imageNamed:"MatchCog.png")
        default:
            return SKTexture(imageNamed:"MatchNull.png")
        }
    }
    
    public func customRandom() -> Match{
        let randomNumber = self.random(number: 100)-1
        //Процентная доля появления match от 100%
//        let skull = 50
//        let shield = 0
//        let lightning = 50
//        let sword = 0
//        let coin = 0
        
        let skull = 45
        let shield = 15
        let lightning = 10
        let sword = 25
        let coin = 5

        switch randomNumber {
        // Череп
        case 0..<skull:
            return Match.skull
        // Щит
        case skull..<skull+shield:
            return Match.armor
        // Молния
        case skull+shield..<skull+shield+lightning:
            return Match.energy
        // Мечи
        case skull+shield+lightning..<skull+shield+lightning+sword:
            return Match.attack
        // Монеты
        case skull+shield+lightning+sword..<skull+shield+lightning+sword+coin:
            return Match.coin
        default:
            return Match.attack
        }
    }
        
    public func durationTime() -> Double {
        return 0.34
    }

    public func moveArrLeft(index: Int) {
        swipeAnimationLeft(index: index)
        DispatchQueue.main.asyncAfter(deadline: .now() + durationTime()) {
            self.levelArr[index].remove(at: 0)
            self.levelArr[index].append(self.customRandom())
            self.matchAnimationPulseRevers(indexIandJ: String(index) + String(self.matchBoard.horizontalCount-1))
        }
    }
    
    public func moveArrRight(index: Int) {
        swipeAnimationRight(index: index)
        DispatchQueue.main.asyncAfter(deadline: .now() + durationTime()) {
            self.levelArr[index].remove(at: self.matchBoard.horizontalCount-1)
            self.levelArr[index].insert(self.customRandom(), at: 0)
            self.matchAnimationPulseRevers(indexIandJ: String(index) + "0")
        }
    }
    
    public func moveArrBottom(index: Int) {
        swipeAnimationDown(index: index)
        DispatchQueue.main.asyncAfter(deadline: .now() + durationTime()) {
            for i in (1...self.matchBoard.verticalCount-1).reversed() {
                self.levelArr[i][index] = self.levelArr[i-1][index]
            }
            self.levelArr[0][index] = self.customRandom()
            self.matchAnimationPulseRevers(indexIandJ: "0" + String(index))
        }
    }
    
    public func moveArrTop(index: Int) {
        swipeAnimationUp(index: index)
        DispatchQueue.main.asyncAfter(deadline: .now() + durationTime()) {
            for i in 0...self.matchBoard.verticalCount-2 {
                self.levelArr[i][index] = self.levelArr[i+1][index]
            }
            self.levelArr[self.matchBoard.verticalCount-1][index] = self.customRandom()
            self.matchAnimationPulseRevers(indexIandJ: String(self.matchBoard.verticalCount-1) + String(index))
        }
    }
    
}
