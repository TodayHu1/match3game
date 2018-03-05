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
            clearMatchTable()
            creatMatchTable()
        }
        else {
            print("SOFT BUILD")
            changeTextureMatchTable()
        }
    }
    
    
    ///Функция очищающая матчи на доске
    func clearMatchTable() {
//        for i in 0...matchBoard.verticalCount-1 {
//            for j in 0...matchBoard.horizontalCount-1 {
//                for matchNode in self.children {
//                    if matchNode.name == "Match" + String(i) + String(j) {
//                        if let matchNode = matchNode as? SKSpriteNode {
//                            matchNode.removeAllActions()
//                            matchNode.removeAllChildren()
//                            matchNode.removeFromParent()
//                        }
//                    }
//                }
//            }
//        }
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
                    print("\(matchNodeOnTable[i][j].texture!) != \(getTextureMatch(matchNumber: matchTypeOnTable[i][j]))")
                    matchNodeOnTable[i][j].texture = getTextureMatch(matchNumber: matchTypeOnTable[i][j])
                }
                else {
                    print("\(matchNodeOnTable[i][j].texture!) ===== \(getTextureMatch(matchNumber: matchTypeOnTable[i][j]))")
                }
                matchNodeOnTable[i][j].position = matchBoard.matchPosition(i: i, j: j)
                matchNodeOnTable[i][j].zPosition = CGFloat(matchBoard.matchZIndex)
            }
        }
    }
    
}
