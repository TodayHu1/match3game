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
    var horizontalCount = 10
    var verticalCount = 10

    var matchSize = 33
    
    var centerMatchBoard = CGPoint(x: 0, y: -145)
    
//    init(matchSize: Int, horizontalCount:Int, verticalCount:Int) {
//
//    }
    
    public func matchPosition(i: Int, j: Int) -> CGPoint {
        let boardWidth = (matchSize * (horizontalCount - 1) / 2)
        let boardHeight = (matchSize * (verticalCount - 1) / 2)
        return CGPoint(
            x: -(boardWidth - (matchSize * j)) + Int(centerMatchBoard.x),
            y: (boardHeight - (matchSize * i)) + Int(centerMatchBoard.y)
        )
    }
}
