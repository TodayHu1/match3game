//
//  ActionGesture.swift
//  match3
//
//  Created by Женя on 26.06.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

//  -1 up
//  -2 down
//  1 left
//  2 right

extension GameScene {
    
    
    func direction(dir: Int, point: CGPoint){
        if(dir > 0) {
            rowEvent(touchY: Int(point.y), dir: dir)
        }
        else {
            colomnEvent(touchX: Int(point.x), dir: dir)
        }
    }
    
    
    public func colomnEvent(touchX: Int, dir: Int) {
        var p = matchBoard.halfBoardSize - ((matchBoard.horizontalCount * matchBoard.matchSize) / 2)
        for i in 0...matchBoard.horizontalCount-1 {
            if ((-160 + p)+(matchBoard.matchSize*i)) < touchX && touchX <= (-160 + p)+(matchBoard.matchSize*(i+1)) {
                if (dir == -1) {
                    moveArrTop(index: i)
                }
                else {
                    moveArrBottom(index: i)
                }
            }
        }
    }
    
    
    public func rowEvent(touchY: Int, dir: Int) {
        var p = matchBoard.halfBoardSize - ((matchBoard.verticalCount * matchBoard.matchSize) / 2)
        for i in 0...matchBoard.verticalCount-1 {
            if ((10 - p)+(-matchBoard.matchSize*i) > touchY && touchY >= ((10 - p)+(-matchBoard.matchSize*(i+1)))) {
                if (dir == 1) {
                    moveArrLeft(index: i)
                }
                else {
                    moveArrRight(index: i)
                }
            }
        }
    }
    
    
}
