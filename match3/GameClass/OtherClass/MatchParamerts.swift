//
//  MatchParamerts.swift
//  match3
//
//  Created by Женя on 09.11.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Match {
    var horizontalCount = 0
    var verticalCount = 0
    
    var numberOfMatch = 0

    var matchSize = 0
    var matchSizeOnAction = 35
    var matchZIndex = 990
    
    var boardSize = 320
    var halfBoardSize = 0
    
    var centerMatchBoard = CGPoint(x: 0, y: -145)
    
    var gameScene: GameScene!
    
    init(horizontalCount:Int, verticalCount:Int, gameScene: GameScene) {
        self.gameScene = gameScene
        self.horizontalCount = horizontalCount
        self.verticalCount = verticalCount
        self.numberOfMatch = self.horizontalCount * self.verticalCount
        print(" ---> \(self.numberOfMatch)")
        self.halfBoardSize = self.boardSize / 2
        if self.horizontalCount > self.verticalCount {
            self.matchSize = self.boardSize / self.horizontalCount
        }
        else {
            self.matchSize = self.boardSize / self.verticalCount
        }
    }
    
    public func matchPosition(i: Int, j: Int) -> CGPoint {
        let boardWidth = (matchSize * (horizontalCount - 1) / 2)
        let boardHeight = (matchSize * (verticalCount - 1) / 2)
        return CGPoint(
            x: -(boardWidth - (matchSize * j)) + Int(centerMatchBoard.x),
            y: (boardHeight - (matchSize * i)) + Int(centerMatchBoard.y)
        )
    }
    
    public func getRandomMatchHorizontal() -> Int {
        return (self.gameScene.random(number: self.horizontalCount))-1
    }
    
    public func getRandomMatchVertical() -> Int {
        return (self.gameScene.random(number: self.verticalCount))-1
    }
}
