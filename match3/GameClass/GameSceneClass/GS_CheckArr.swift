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

public var actionOnTurn = [Int](repeating: 0, count: gameScene.actionOnTurnCount() + 1)
public var statArr = Array(repeating: Array(repeating: -1, count: matchBoard.horizontalCount),
                           count: matchBoard.verticalCount)

extension GameScene {
    
    func actionOnTurnCount() -> Int {
        return 6
    }
    
    public func checkArrOnAction(loop: Bool) {
        statArr = Array(repeating: Array(repeating: 0, count: matchBoard.horizontalCount),
        count: matchBoard.verticalCount)
        findHorizontalMatchChaindInArr()
        findVerticalMatchChaindInArr()
        for indexOfMatch in 1...gameScene.actionOnTurnCount()+1 {
            for i in 0...matchBoard.verticalCount-1 {
                for j in 0...matchBoard.horizontalCount-1 {
                    if(statArr[i][j] == indexOfMatch) {
                        matchAnimationPulse(indexIandJ: String(i) + String(j))
                        moveMatchTo(i: i, j: j)
                        actionOnTurn[indexOfMatch] += 1
                        levelArr[i][j] = -1
                    }
                }
            }
        }
        
        if loop {
            fillArrOnVoidLoop()
        }
        else {
            fillArrOnVoidNoLoop()
        }

    }
    
    private func findHorizontalMatchChaindInArr() {
        for indexOfMatch in 1...gameScene.actionOnTurnCount()+1 {
            for i in 0...matchBoard.verticalCount-1 {
                for j in 0...matchBoard.horizontalCount-3 {
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
    
    private func findVerticalMatchChaindInArr() {
        for indexOfMatch in 1...gameScene.actionOnTurnCount()+1 {
            for i in 0...matchBoard.verticalCount-3 {
                for j in 0...matchBoard.horizontalCount-1 {
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
    
    public func fillArrOnVoidLoop() {
        for i in 0...matchBoard.verticalCount-1 {
            for j in 0...matchBoard.horizontalCount-1 {
                if(levelArr[i][j] == -1) {
                    levelArr[i][j] = gameScene.customRandom()
                }
            }
        }
        self.buildLevel(hardBuild: false)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.startCheckLoop()
        }
    }
    
    public func fillArrOnVoidNoLoop() {
        let subArr = levelArr
        repeat {
            levelArr = subArr
            for i in 0...matchBoard.verticalCount-1 {
                for j in 0...matchBoard.horizontalCount-1 {
                    if(levelArr[i][j] == -1) {
                        levelArr[i][j] = gameScene.customRandom()
                    }
                }
            }
        }
        while checkFullArr()
        self.buildLevel(hardBuild: false)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.startCheckLoop()
        }
    }
    
    public func checkFullArr() -> Bool {
        if(checkVerticalArr() || checkHorizontalArr()) {
            return true
        }
        else {
            return false
        }
    }
    
    public func startCheckLoop() {
        if(checkFullArr()) {
            checkArrOnAction(loop: loopOnSpawnMatch)
        }
        else {
            buildLevel(hardBuild: false)
            endBuild()
        }
    }
    
    
    private func checkVerticalArr() -> Bool {
        var check = false
        for indexOfMatch in 1...gameScene.actionOnTurnCount()+1 {
            for i in 0...matchBoard.verticalCount-3 {
                for j in 0...matchBoard.horizontalCount-1 {
                    if( levelArr[i][j] == indexOfMatch &&
                        levelArr[i+1][j] == indexOfMatch &&
                        levelArr[i+2][j] == indexOfMatch ) {
                        check = true
                    }
                }
            }
        }
        return check
    }
    
    private func checkHorizontalArr() -> Bool {
        var check = false
        for indexOfMatch in 1...gameScene.actionOnTurnCount()+1 {
            for i in 0...matchBoard.verticalCount-1 {
                for j in 0...matchBoard.horizontalCount-3 {
                    if( levelArr[i][j] == indexOfMatch &&
                        levelArr[i][j+1] == indexOfMatch &&
                        levelArr[i][j+2] == indexOfMatch ) {
                        check = true
                    }
                }
            }
        }
        return check
    }
    
}
