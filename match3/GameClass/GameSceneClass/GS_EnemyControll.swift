//
//  GS_EnemyControll.swift
//  match3
//
//  Created by Женя on 19.09.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import SceneKit
import SpriteKit
import GameplayKit

var matchActionGesture = true
var loopOnSpawnMatch = false //Появление собирающихся матчей после генерации
var boardSizeUp = true //Увеличение доски после победы над врагом

extension GameScene {
    
    
    public func actionGesture(gesture: Bool) {
//        print("!!!!!!!!!!!!!!!!!!!!!!!!!! " + String(gesture))
        matchActionGesture = gesture
    }
    
    public func newEnemy() {
        print("enemyIndex \(enemyIndexNow)")
        if enemyIndexNow < enemyOnLevelArr.count-1 {
            let moveOut = SKAction.move(to: CGPoint(x: 500, y: 140), duration: 1)
            let reverse = SKAction.scaleX(to: -0.3, duration: 0.3)
            let pulse = SKAction.fadeIn(withDuration: 10)
            let newEnemy = SKAction.run {
                enemyUnit.removeFromParent()
                enemyUnit.removeAllChildren()
                
                enemyIndexNow+=1
                enemyUnit = enemyOnLevelArr[enemyIndexNow]
                
                self.addChild(enemyUnit)
                
                enemyUnit.run(pulse)
                enemyUnit.animationStand()
                
                self.boardMatchSizeUp()
                
                print("create new Enemy \(enemyIndexNow)")
            }
            enemyUnit.run(SKAction.sequence([reverse,moveOut,newEnemy]))

        }
        else {
            enemyUnit.removeFromParent()
            enemyUnit.removeAllChildren()
            print("delet all \(enemyIndexNow)")
        }
    }
    
    func boardMatchSizeUp() {
        if boardSizeUp {
            matchBoard = Match(horizontalCount: 3+enemyIndexNow, verticalCount: 3+enemyIndexNow)
            levelArr = Array(repeating: Array(repeating: -1, count: matchBoard.horizontalCount),
                             count: matchBoard.verticalCount)
            gameScene.buildLevel(hardBuild: true)
            gameScene.fillArrOnVoidNoLoop()
            gameScene.buildLevel(hardBuild: false)
        }
    }
    
    func matchMoveToBoard(matchIndex: Int, nodePosition: SKSpriteNode, i: Int, j: Int, waitTimeToAnimation: TimeInterval, durationAnimation: TimeInterval){
        let matchNode = SKSpriteNode(texture: setTextureMatch(matchNumber: matchIndex))
        
        switch nodePosition {
        case player:
            matchNode.position = player.positionCenter
        case enemyUnit:
            matchNode.position = enemyUnit.positionCenter
        default:
            matchNode.position = nodePosition.position
        }

        matchNode.size.width = 0
        matchNode.size.height = 0
        matchNode.zPosition = CGFloat(matchBoard.matchZIndex + 2)
        
        let durationMoveAndResize = 0.5
        
        let animationCode = SKAction.run {
            gameScene.nodeAnimationPulseRevers(node: nodePosition, duration: durationAnimation, percentValuePulsation: 20)
        }
        
        let startMove = SKAction.move(to: CGPoint(x: CGFloat(randomNear(number: 190)), y: CGFloat(randomNear(number: 160))), duration: durationMoveAndResize)
        startMove.timingMode = .easeInEaseOut
        
        let resizeHeight = SKAction.resize(toHeight: CGFloat(matchBoard.matchSize), duration: durationMoveAndResize)
        let resizeWidth = SKAction.resize(toWidth: CGFloat(matchBoard.matchSize), duration: durationMoveAndResize)
        
        let resize = SKAction.group([resizeHeight, resizeWidth])
        
        let moveAndResize = SKAction.group([resize, startMove])
        
        let endMove = SKAction.move(to: matchBoard.matchPosition(i: i,j: j), duration: 0.5)
        endMove.timingMode = .easeOut
        
        let removeMatch = SKAction.run {
            matchNode.removeFromParent()
        }
        
        let matchEndAnimation = SKAction.run {
            gameScene.matchAnimationPulseRevers(indexIandJ: String(i) + String(j))
        }
        
        let setMatchWithIndex = SKAction.run {
            levelArr[i][j] = matchIndex
            gameScene.buildLevel(hardBuild: false)
            gameScene.checkArrOnAction(loop: loopOnSpawnMatch)
        }
        
        self.addChild(matchNode)
        
        matchNode.run(SKAction.sequence([SKAction.wait(forDuration: waitTimeToAnimation), animationCode, moveAndResize, endMove, removeMatch, setMatchWithIndex, matchEndAnimation]))
        
    }
    
    public func checkArrForAction() {
        for i in 0...actionOnTurn.count-1 {
            if actionOnTurn[i] > 0 {
                switch i {
                case 0:
                    print("НОЛИК")
                case 1:
                    enemyUnit.fullAttackStandAnimation(damage: enemyUnit.attack * actionOnTurn[1])
                case 2:
                    player.shield += actionOnTurn[2] * 10
                case 3:
                    player.mana += actionOnTurn[3]
                case 4:
                    player.fullAttackStandAnimation(damage: (player.attack * actionOnTurn[4]))
                default: break
//                    print("ERORR: checkArrForAction() invalid value \(i)")
                }
            }
        }
        
        
        
//        let statIn = SKAction.fadeIn(withDuration: 0.1)
//        let statHide = SKAction.fadeOut(withDuration: 2)
//        let statWait = SKAction.wait(forDuration: 2)
//        let statText = SKAction.run({
            statLabel.text = "\(player.attack * actionOnTurn[4]) vs \(enemyUnit.attack * actionOnTurn[1])"
//        })
//        let sdf = SKAction.removeFromParent()
//        let statInitArr = SKAction.run {
            for i in 0...actionOnTurn.count-1 {
                actionOnTurn[i] = 0
            }
//        }
//        statLabel.run(
//            SKAction.sequence(
//                [statIn,statText,statWait,statHide,statInitArr]
//            )
//        )
    }
}
