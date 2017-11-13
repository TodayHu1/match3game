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
        for i in 0...matchBoard.horizontalCount-1 {
            if (-160+(matchBoard.matchSize*i) < touchX && touchX <= -160+(matchBoard.matchSize*(i+1))) {
                if (dir == -1) {
                    print("| \(i+1) Top")
                    moveArrTop(index: i)
                }
                else {
                    print("| \(i+1) Bottom")
                    moveArrBottom(index: i)
                }
            }
        }
    }
    
    
    public func rowEvent(touchY: Int, dir: Int) {
        for i in 0...matchBoard.verticalCount-1 {
            if (10+(-matchBoard.matchSize*i) > touchY && touchY >= (10+(-matchBoard.matchSize*(i+1)))) {
                if (dir == 1) {
                    print("<––– \(i+1) Left")
                    moveArrLeft(index: i)
                }
                else {
                    print("–––> \(i+1) Right")
                    moveArrRight(index: i)
                }
            }
        }
    }
    
    
}