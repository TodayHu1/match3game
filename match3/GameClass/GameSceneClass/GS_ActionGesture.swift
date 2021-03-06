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



extension GameScene {
    
    
    func direction(dir: Int, point: CGPoint){
        actionGesture(gesture: false)
        self.player.move += 1
        self.enemyUnit.attackOnMove()
        if point.y < 0 {
            if dir > 0 {
                rowEvent(touchY: Int(point.y), dir: dir)
            }
            else {
                colomnEvent(touchX: Int(point.x), dir: dir)
            }
        }
    }
    
    
    public func colomnEvent(touchX: Int, dir: Int) {
        let p = matchBoard.halfBoardSize - ((matchBoard.horizontalCount * matchBoard.matchSize) / 2)
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
        let p = matchBoard.halfBoardSize - ((matchBoard.verticalCount * matchBoard.matchSize) / 2)
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
