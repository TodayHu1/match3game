//
//  GS_ActionStats.swift
//  match3
//
//  Created by Женя on 14.08.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import SpriteKit
extension GameScene {
    
    public func changeManaLabel(){
        manaLabel.countFrom(fromValue: gameScene.stringToFloat(value: manaLabel.text!),
                            to: Float(player.mana),
                            withDuration: 0.5,
                            andAnimationType: .EaseOut,
                            andCountingType: .Int)
    }
    
    func boardSizeChange() {
        let plusValue = 1
        if boardSizeUp {
            print(" -> MatchBoard size –– \(matchBoard.horizontalCount) - \(matchBoard.verticalCount)")
            matchBoard = Match(horizontalCount: matchBoard.horizontalCount + plusValue, verticalCount: matchBoard.verticalCount + plusValue)
            var subArr = [[Int]]()
            subArr = levelArr
            levelArr = Array(repeating: Array(repeating: -1, count: matchBoard.horizontalCount),
                             count: matchBoard.verticalCount)
            
            for i in 0...subArr.count-1 {
                for j in 0...subArr[i].count-1 {
                    levelArr[i][j] = subArr[i][j]
                }
            }
            
            print("MatchBoard size –– \(matchBoard.horizontalCount) - \(matchBoard.verticalCount)")
            gameScene.buildLevel(hardBuild: true)
            gameScene.fillArrOnVoidNoLoop()
            gameScene.buildLevel(hardBuild: false)
        }
//        else {
//            print(" -> MatchBoard size –– \(matchBoard.horizontalCount) - \(matchBoard.verticalCount)")
//            matchBoard = Match(horizontalCount: matchBoard.horizontalCount + 2, verticalCount: matchBoard.verticalCount + 2)
//            var subArr = [[Int]]()
//            print("- \(levelArr.count) –1– \(subArr.count)")
//            subArr = levelArr
//            print("- \(levelArr.count) –2– \(subArr.count)")
//            levelArr = Array(repeating: Array(repeating: 0, count: matchBoard.horizontalCount),
//                             count: matchBoard.verticalCount)
//
//            for i in 0...subArr.count-1 {
//                for j in 0...subArr[i].count-1 {
//                    levelArr[i+1][j+1] = subArr[i][j]
//                }
//            }
//
//
//            print("- \(levelArr.count) –3– \(subArr.count)")
//            print("MatchBoard size –– \(matchBoard.horizontalCount) - \(matchBoard.verticalCount)")
//            gameScene.buildLevel(hardBuild: true)
//            gameScene.fillArrOnVoidNoLoop()
//            gameScene.buildLevel(hardBuild: false)
//        }
    }
    
    public func moveMatchTo(i:Int ,j:Int) {
        let matchNode = SKSpriteNode(texture: setTextureMatch(matchNumber: levelArr[i][j]))
        matchNode.position = matchBoard.matchPosition(i: i, j: j)
        matchNode.size.width = CGFloat(matchBoard.matchSizeOnAction)
        matchNode.size.height = CGFloat(matchBoard.matchSizeOnAction)
        matchNode.zPosition = CGFloat(matchBoard.matchZIndex + 2)
        
        var objectForAnimation: AnyObject
        var positionToMove: CGPoint = player.position
        var specialActionOnEnd = SKAction()

        switch statArr[i][j] {
        case 1:
            objectForAnimation = enemyUnit
            positionToMove = enemyUnit.position
        case 2:
            objectForAnimation = player.iconShield
            positionToMove = player.position
            specialActionOnEnd = SKAction.run {
                player.labelOverHead(shield: player.shield, health: player.health, initLabel: false)
            }
        case 3:
            objectForAnimation = manaPoolNode
            positionToMove = manaPoolNode.position
            specialActionOnEnd = SKAction.run {
                gameScene.changeManaLabel()
            }
        default:
            objectForAnimation = player
        }
    
        let startMove = SKAction.move(to: positionToMove, duration: 0.3)
        startMove.timingMode = .easeIn
        
        let endMove = SKAction.move(to: CGPoint(x: CGFloat(randomNear(number: 190)), y: CGFloat(randomNear(number: 160))), duration: 0.4)
        endMove.timingMode = .easeOut

        let removeMatch = SKAction.run {
            matchNode.removeFromParent()
            gameScene.nodeAnimationPulseUp(node: objectForAnimation as! SKSpriteNode, duration: 0.2, percentValuePulsation: 20/3)
        }
        self.addChild(matchNode)
        matchNode.run(SKAction.sequence([endMove, startMove, removeMatch, specialActionOnEnd]))

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
            gameScene.nodeAnimationPulseUp(node: nodePosition, duration: durationAnimation, percentValuePulsation: 20)
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
    
    func sceneShake(shakeCount: Int, intensity: CGVector, shakeDuration: Double) {
        let sceneView = self.scene!.view! as UIView
        let shakeAnimation = CABasicAnimation(keyPath: "position")
        shakeAnimation.duration = shakeDuration / Double(shakeCount)
        shakeAnimation.repeatCount = Float(shakeCount)
        shakeAnimation.autoreverses = true
        shakeAnimation.fromValue = NSValue(cgPoint: CGPoint(x: sceneView.center.x - intensity.dx, y: sceneView.center.y - intensity.dy))
        shakeAnimation.toValue = NSValue(cgPoint: CGPoint(x: sceneView.center.x + intensity.dx, y: sceneView.center.y + intensity.dy))
        sceneView.layer.add(shakeAnimation, forKey: "position")
    }
    
    public func endBuild() {
        gameScene.checkArrForAction()
    }
    

    
}

