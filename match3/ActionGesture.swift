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

class ActionGesture {
    
    let sceneView = GameScene(fileNamed: "GameScene")
    
    func direction(dir: Int, point: CGPoint){
        if(dir > 0) {
            rowEvent(touchY: Int(point.y))
        }
        else {
            colomnEvent(touchX: Int(point.x))
        }
    }
    
    
    public func colomnEvent(touchX: Int) {
        if (-160 < touchX && touchX <= -110) {
            print("| 1")
        }
        if (-110+6 < touchX && touchX <= -60+6) {
            print("| 2")
        }
        if (-60+(6*2) < touchX && touchX <= -10+(6*2)) {
            print("| 3")
        }
        if (-10+(6*3) < touchX && touchX <= 40+(6*3)) {
            print("| 4")
        }
        if (40+(6*4) < touchX && touchX <= 90+(6*4)) {
            print("| 5")
        }
        if (90+(6*5) < touchX && touchX <= 140+(6*5)) {
            print("| 6")
        }
    }
    
    public func rowEvent(touchY: Int) {
        if (10 > touchY && touchY >= -40) {
            sceneView?.moveArrLeft(array: levelArr[0])
        }
        if (-40-6 > touchY && touchY >= -90-6) {
            print("- 2")
        }
        if (-90-(6*2) > touchY && touchY >= -140-(6*2)) {
            print("- 3")
        }
        if (-140-(6*3) > touchY && touchY >= -190-(6*3)) {
            print("- 4")
        }
        if (-190-(6*4) > touchY && touchY >= -240-(6*4)) {
            print("- 5")
        }
        if (-240-(6*5) > touchY && touchY >= -290-(6*5)) {
            print("- 6")
        }
    }
}
