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

    public func buildLevel(hardBuild: Bool) {
        if hardBuild {
            for i in 0...matchBoard.horizontalCount-1 {
                for j in 0...matchBoard.verticalCount-1 {
                    for nextButton in self.children {
                        if nextButton.name == "Match" + String(i) + String(j) {
                            if let nextButton = nextButton as? SKSpriteNode {
                                nextButton.removeAllChildren()
                                nextButton.removeFromParent()
                            }
                        }
                    }
                }
            }
//            print(levelArr)
            for i in 0...matchBoard.verticalCount-1 {
                for j in 0...matchBoard.horizontalCount-1 {
                    print("\(i) –– \(j)")
                    let matchNode = SKSpriteNode(texture: setTextureMatch(matchNumber: levelArr[i][j]))
                    matchNode.position = matchBoard.matchPosition(i: i, j: j)
                    matchNode.size.width = CGFloat(matchBoard.matchSize)
                    matchNode.size.height = CGFloat(matchBoard.matchSize)
                    matchNode.name = "Match" + String(i) + String(j)
                    matchNode.zPosition = CGFloat(matchBoard.matchZIndex)
                    self.addChild(matchNode)
                }
            }
        }
        else {
//            print(levelArr)
            for i in 0...matchBoard.verticalCount-1 {
                for j in 0...matchBoard.horizontalCount-1 {
                    let matchNode: SKSpriteNode = self.searchByName(name: "Match" + String(i) + String(j))
                    matchNode.zPosition = CGFloat(matchBoard.matchZIndex)
                    matchNode.position = matchBoard.matchPosition(i: i, j: j)
                    matchNode.texture = setTextureMatch(matchNumber: levelArr[i][j])
                }
            }
        }
    }
}
