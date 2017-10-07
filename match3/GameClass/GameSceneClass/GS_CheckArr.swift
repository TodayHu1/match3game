//
//  CheckArr.swift
//  match3
//
//  Created by Женя on 05.08.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

public var actionOnTurn = [0,0,0,0,0,0]
public var statArr = [[0,0,0,0,0,0],
                      [0,0,0,0,0,0],
                      [0,0,0,0,0,0],
                      [0,0,0,0,0,0],
                      [0,0,0,0,0,0],
                      [0,0,0,0,0,0]]

extension GameScene {
    
    
    
    public func checkArr() {
        statArr = [[0,0,0,0,0,0],
                   [0,0,0,0,0,0],
                   [0,0,0,0,0,0],
                   [0,0,0,0,0,0],
                   [0,0,0,0,0,0],
                   [0,0,0,0,0,0]]
        setHorizontalArr()
        setVerticalArr()
        
        for indexOfMatch in 1...5 {
            for i in 0...5 {
                for j in 0...5 {
                    if(statArr[i][j] == indexOfMatch) {
                        animationMatchCorner(indexIandJ: String(i) + String(j))
                        hehlolkekmda(i: i, j: j)
                        actionOnTurn[indexOfMatch] += 1
//                        print(actionOnTurn)
                        levelArr[i][j] = 0
                    }
                }
            }
        }
        
//        print("-> " + String(describing: actionOnTurn))
        
//        print("Чек Арр")
        reBuildArr()
    }
    
    private func setHorizontalArr() {
        for indexOfMatch in 1...5 {
            for i in 0...5 {
                for j in 0...3 {
                    if( levelArr[i][j] == indexOfMatch &&
                        levelArr[i][j+1] == indexOfMatch &&
                        levelArr[i][j+2] == indexOfMatch ) {
                        statArr[i][j] = indexOfMatch
                        statArr[i][j+1] = indexOfMatch
                        statArr[i][j+2] = indexOfMatch
                    }
                }
            }
        }
    }
    
    private func setVerticalArr() {
        for indexOfMatch in 1...5 {
            for i in 0...3 {
                for j in 0...5 {
                    if( levelArr[i][j] == indexOfMatch &&
                        levelArr[i+1][j] == indexOfMatch &&
                        levelArr[i+2][j] == indexOfMatch ) {
                        
                        statArr[i][j] = indexOfMatch
                        statArr[i+1][j] = indexOfMatch
                        statArr[i+2][j] = indexOfMatch
                    }
                }
            }
        }
    }
    
    public func reBuildArr() {
//        print("Ребилд")
        for i in 0...5 {
            for j in 0...5 {
                if(levelArr[i][j] == 0) {

                        levelArr[i][j] = GameScene().random(number: 4)
                        self.buildLevel(hardBuild: false)

                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.checkAlignArr()
        }

    }
    
    public func checkAlignArr() {
//        print("Чек Алигн Арр")
//        print(checkVerticalArr())
//        print(checkHorizontalArr())
        if(checkVerticalArr() || checkHorizontalArr()) {
            checkArr()
        }
        else {
            buildLevel(hardBuild: false)
            endBuild()
        }
    }
    
    
    private func checkVerticalArr() -> Bool {
        var check = false
        for indexOfMatch in 1...5 {
            for i in 0...3 {
                for j in 0...5 {
                    if( levelArr[i][j] == indexOfMatch &&
                        levelArr[i+1][j] == indexOfMatch &&
                        levelArr[i+2][j] == indexOfMatch ) {
                        check = true
                    }
                }
            }
        }
//        if check {
////            print("Чек Вертикал Арр")
//        }
        return check
    }
    
    private func checkHorizontalArr() -> Bool {
        var check = false
        for indexOfMatch in 1...5 {
            for i in 0...5 {
                for j in 0...3 {
                    if( levelArr[i][j] == indexOfMatch &&
                        levelArr[i][j+1] == indexOfMatch &&
                        levelArr[i][j+2] == indexOfMatch ) {
                        check = true
                    }
                }
            }
        }
//        if check {
//            print("Чек Хризонтал Арр")
//        }
        return check
    }
    
}
