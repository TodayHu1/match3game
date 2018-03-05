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

///Тип матча
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
    
    ///Функция инициализирующая текстуры для матчей
    func initMatchTexture() {
        matchTexture[Match.chain] = SKTexture(imageNamed:"MatchChain.png")
        matchTexture[Match.skull] = SKTexture(imageNamed:"MatchSkull.png")
        matchTexture[Match.armor] = SKTexture(imageNamed:"MatchArmor.png")
        matchTexture[Match.energy] = SKTexture(imageNamed:"MatchEnergy.png")
        matchTexture[Match.attack] = SKTexture(imageNamed:"MatchAttack.png")
        matchTexture[Match.coin] = SKTexture(imageNamed:"MatchCoin.png")
        matchTexture[Match.poison] = SKTexture(imageNamed:"MatchPoison.png")
        matchTexture[Match.cog] = SKTexture(imageNamed:"MatchCog.png")
        matchTexture[Match.null] = SKTexture(imageNamed:"MatchNull.png")
    }
    
    ///Функция для получения текстуры матча по типо матча
    func getTextureMatch(matchNumber: Match) -> SKTexture {
        if matchNumber != Match.null {
            return matchTexture[matchNumber]!
        }
        else {
            return matchTexture[Match.null]!
        }
    }
    
    public func customRandom(matchChance: [Int]) -> Match {
        let randomNumber = self.random(number: 100)-1
        //Процентная доля появления match от 100%
        let skull = matchChance[0]
        let shield = matchChance[1]
        let lightning = matchChance[2]
        let sword = matchChance[3]
        let coin = matchChance[4] 

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
            return Match.chain
        }
    }
        
    public func durationTime() -> Double {
        return 0.34
    }

    public func moveArrLeft(index: Int) {
        swipeAnimationLeft(index: index)
        DispatchQueue.main.asyncAfter(deadline: .now() + durationTime()) {
            self.matchTypeOnTable[index].remove(at: 0)
            self.matchTypeOnTable[index].append(self.customRandom(matchChance: loadMatchChance))
            self.matchAnimationPulseRevers(i: index, j: self.matchBoard.horizontalCount-1)
        }
    }
    
    public func moveArrRight(index: Int) {
        swipeAnimationRight(index: index)
        DispatchQueue.main.asyncAfter(deadline: .now() + durationTime()) {
            self.matchTypeOnTable[index].remove(at: self.matchBoard.horizontalCount-1)
            self.matchTypeOnTable[index].insert(self.customRandom(matchChance: loadMatchChance), at: 0)
            self.matchAnimationPulseRevers(i: index, j: 0)
        }
    }
    
    public func moveArrBottom(index: Int) {
        swipeAnimationDown(index: index)
        DispatchQueue.main.asyncAfter(deadline: .now() + durationTime()) {
            for i in (1...self.matchBoard.verticalCount-1).reversed() {
                self.matchTypeOnTable[i][index] = self.matchTypeOnTable[i-1][index]
            }
            self.matchTypeOnTable[0][index] = self.customRandom(matchChance: loadMatchChance)
            self.matchAnimationPulseRevers(i: 0, j: index)
        }
    }
    
    public func moveArrTop(index: Int) {
        swipeAnimationUp(index: index)
        DispatchQueue.main.asyncAfter(deadline: .now() + durationTime()) {
            for i in 0...self.matchBoard.verticalCount-2 {
                self.matchTypeOnTable[i][index] = self.matchTypeOnTable[i+1][index]
            }
            self.matchTypeOnTable[self.matchBoard.verticalCount-1][index] = self.customRandom(matchChance: loadMatchChance)
            self.matchAnimationPulseRevers(i: self.matchBoard.verticalCount-1, j: index)
        }
    }
    
}
