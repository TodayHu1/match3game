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
    
//    let sceneView = GameScene(fileNamed: "GameScene")
    
    func direction(dir: Int, point: CGPoint){
        if(dir > 0) {
            rowEvent(touchY: Int(point.y), dir: dir)
        }
        else {
            colomnEvent(touchX: Int(point.x), dir: dir)
        }
    }
    
    
    public func colomnEvent(touchX: Int, dir: Int) {
        if (-160 < touchX && touchX <= -110) {
            if (dir == -1) {
                moveArrTop(index: 0)
                print("| 1 Top")
            }
            else {
                moveArrBottom(index: 0)
                print("| 1 Bottom")
            }
        }
        
        if (-110+6 < touchX && touchX <= -60+6) {
            if (dir == -1) {
                moveArrTop(index: 1)
                print("| 2 Top")
            }
            else {
                moveArrBottom(index: 1)
                print("| 2 Bottom")
            }
        }
        
        if (-60+(6*2) < touchX && touchX <= -10+(6*2)) {
            if (dir == -1) {
                moveArrTop(index: 2)
                print("| 3 Top")
            }
            else {
                moveArrBottom(index: 2)
                print("| 3 Bottom")
            }
        }
        
        if (-10+(6*3) < touchX && touchX <= 40+(6*3)) {
            if (dir == -1) {
                moveArrTop(index: 3)
                print("| 4 Top")
            }
            else {
                moveArrBottom(index: 3)
                print("| 4 Bottom")
            }
        }
        
        if (40+(6*4) < touchX && touchX <= 90+(6*4)) {
            if (dir == -1) {
                moveArrTop(index: 4)
                print("| 5 Top")
            }
            else {
                moveArrBottom(index: 4)
                print("| 5 Bottom")
            }
        }
        
        if (90+(6*5) < touchX && touchX <= 140+(6*5)) {
            if (dir == -1) {
                moveArrTop(index: 5)
                print("| 6 Top")
            }
            else {
                moveArrBottom(index: 5)
                print("| 6 Bottom")
            }
        }
    }
    
    public func rowEvent(touchY: Int, dir: Int) {
        if (10 > touchY && touchY >= -40) {
            if (dir == 1) {
                moveArrLeft(index: 0)
                print("- 1 Left")
            }
            else {
                moveArrRight(index: 0)
                print("- 1 Right")
            }
        }
        
        if (-40-6 > touchY && touchY >= -90-6) {
            if (dir == 1) {
                moveArrLeft(index: 1)
                print("- 2 Left")
            }
            else {
                moveArrRight(index: 1)
                print("- 2 Right")
            }
        }
        
        if (-90-(6*2) > touchY && touchY >= -140-(6*2)) {
            if (dir == 1) {
                moveArrLeft(index: 2)
                print("- 3 Left")
            }
            else {
                moveArrRight(index: 2)
                print("- 3 Right")
            }
        }
        
        if (-140-(6*3) > touchY && touchY >= -190-(6*3)) {
            if (dir == 1) {
                moveArrLeft(index: 3)
                print("- 4 Left")
            }
            else {
                moveArrRight(index: 3)
                print("- 4 Right")
            }
        }
        
        if (-190-(6*4) > touchY && touchY >= -240-(6*4)) {
            if (dir == 1) {
                moveArrLeft(index: 4)
                print("- 5 Left")
            }
            else {
                moveArrRight(index: 4)
                print("- 5 Right")
            }
        }
        
        if (-240-(6*5) > touchY && touchY >= -290-(6*5)) {
            if (dir == 1) {
                moveArrLeft(index: 5)
                print("- 6 Left")
            }
            else {
                moveArrRight(index: 5)
                print("- 6 Right")
            }
        }
    }
}
