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

    var matchSize = 0
    var matchSizeOnAction = 35
    var matchZIndex = 990
    
    var centerMatchBoard = CGPoint(x: 0, y: -145)
    
    init(horizontalCount:Int, verticalCount:Int) {
        self.horizontalCount = horizontalCount
        self.verticalCount = verticalCount
        if self.horizontalCount > self.verticalCount {
            self.matchSize = 330 / self.horizontalCount
        }
        else {
            self.matchSize = 330 / self.verticalCount
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
}
