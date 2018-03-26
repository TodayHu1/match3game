//
//  GS_BuildLevel.swift
//  match3
//
//  Created by Женя on 09.11.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

extension GameScene {

    ///Функция инициализирующая доску матчами
    func buildLevel(hardBuild: Bool) {
        if hardBuild {
            print("HARD BUILD")
            creatMatchTable()
        }
        else {
            print("SOFT BUILD")
            changeTextureMatchTable()
            changeChanse()
        }
    }
    
    ///Регулирует шанс выпадения матчей в зависимости от количества черепов
    func changeChanse() {
        ///Количество матчей черепов на доске
        var skullCount = 0
        
        ///Всего матчей на доске
        let allCount = matchBoard.numberOfMatch
        
        ///Стандартный шанс выпадения матчей
        let standartChance = loadMatchChance
        
        ///Уменьшенный шанс выпадения черепов
        let skullLessChance = [15,20,15,45,5]
        
        for i in 0...matchBoard.verticalCount-1 {
            for j in 0...matchBoard.horizontalCount-1 {
                if matchTypeOnTable[i][j] == .skull {
                    skullCount += 1
                }
            }
        }
        
        if Int(allCount/4) < skullCount {
            self.matchChance = skullLessChance
            print("MATCH CHANSE \(Int(allCount/4))___\(skullCount) SKULL LESS")
        }
        else {
            self.matchChance = standartChance
            print("MATCH CHANSE \(Int(allCount/4))___\(skullCount) STANDART")
        }
    }
    
    ///Функция создающая матчи на доске
    func creatMatchTable() {
        for i in 0...matchBoard.verticalCount-1 {
            for j in 0...matchBoard.horizontalCount-1 {
                let matchNode = SKSpriteNode(texture: getTextureMatch(matchNumber: matchTypeOnTable[i][j]))
                matchNode.position = matchBoard.matchPosition(i: i, j: j)
                matchNode.size.width = CGFloat(matchBoard.matchSize)
                matchNode.size.height = CGFloat(matchBoard.matchSize)
                matchNode.zPosition = CGFloat(matchBoard.matchZIndex)
                matchNodeOnTable[i][j] = matchNode
                self.addChild(matchNode)
            }
        }
    }
    
    ///Функция меняющая текстуры матчей на доске
    func changeTextureMatchTable() {
        for i in 0...matchBoard.verticalCount-1 {
            for j in 0...matchBoard.horizontalCount-1 {
                if matchNodeOnTable[i][j].texture!.description != getTextureMatch(matchNumber: matchTypeOnTable[i][j]).description {
                    matchNodeOnTable[i][j].texture = getTextureMatch(matchNumber: matchTypeOnTable[i][j])
                }
                matchNodeOnTable[i][j].position = matchBoard.matchPosition(i: i, j: j)
                matchNodeOnTable[i][j].zPosition = CGFloat(matchBoard.matchZIndex)
            }
        }
    }
    
}
