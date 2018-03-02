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


///Класс с параметрами стола с матчами
class MatchParametrs {
    
    ///Количество матчей по горизонтали
    var horizontalCount = 0
    
    ///Количество матчей по вертикали
    var verticalCount = 0
    
    ///Колличество матчей на столе
    var numberOfMatch = 0

    ///Физический размер матча
    var matchSize = 0
    
    ///Физический размер матча при активации
    var matchSizeOnAction = 35
    
    ///Z позиция матчаок в игре
    var matchZIndex = 990
    
    ///Физический размер стола для матчей
    var boardSize = 320
    
    ///Физический размер половины стола для матчей
    var halfBoardSize = 0
    
    ///Физический центр стола для матчей
    var centerMatchBoard = CGPoint(x: 0, y: -145)
    
    var gameScene: GameScene!
    
    init(horizontalCount:Int, verticalCount:Int, gameScene: GameScene) {
        self.gameScene = gameScene
        self.horizontalCount = horizontalCount
        self.verticalCount = verticalCount
        self.numberOfMatch = self.horizontalCount * self.verticalCount
        self.halfBoardSize = self.boardSize / 2
        if self.horizontalCount > self.verticalCount {
            self.matchSize = self.boardSize / self.horizontalCount
        }
        else {
            self.matchSize = self.boardSize / self.verticalCount
        }
    }
    
    ///Функция возвращаюшая точку матча по индексам в массиве
    public func matchPosition(i: Int, j: Int) -> CGPoint {
        let boardWidth = (matchSize * (horizontalCount - 1) / 2)
        let boardHeight = (matchSize * (verticalCount - 1) / 2)
        return CGPoint(
            x: -(boardWidth - (matchSize * j)) + Int(centerMatchBoard.x),
            y: (boardHeight - (matchSize * i)) + Int(centerMatchBoard.y)
        )
    }
    
    ///Функция возвращаюшая случаную позиция по горизонтали
    public func getRandomMatchHorizontal() -> Int {
        return (self.gameScene.random(number: self.horizontalCount))-1
    }
    
    ///Функция возвращаюшая случаную позиция по вертикали
    public func getRandomMatchVertical() -> Int {
        return (self.gameScene.random(number: self.verticalCount))-1
    }
}
