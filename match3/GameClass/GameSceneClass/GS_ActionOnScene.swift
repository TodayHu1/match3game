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
        manaLabel.countFrom(fromValue: self.stringToFloat(value: manaLabel.text!),
                            to: Float(player.mana),
                            withDuration: 0.5,
                            andAnimationType: .EaseOut,
                            andCountingType: .Int)
    }
    
    func boardSizeChange() {
        let plusValue = 1
        if boardSizeUp {
            matchBoard = MatchParametrs(horizontalCount: matchBoard.horizontalCount + plusValue, verticalCount: matchBoard.verticalCount + plusValue, gameScene: self)
            var subArr = [[Match]]()
            subArr = levelArr
            levelArr = Array(repeating: Array(repeating: Match.null, count: matchBoard.horizontalCount),
                             count: matchBoard.verticalCount)
            
            for i in 0...subArr.count-1 {
                for j in 0...subArr[i].count-1 {
                    levelArr[i][j] = subArr[i][j]
                }
            }
            
            self.buildLevel(hardBuild: true)
            self.fillArrOnVoidNoLoop()
            self.buildLevel(hardBuild: false)
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
//            self.buildLevel(hardBuild: true)
//            self.fillArrOnVoidNoLoop()
//            self.buildLevel(hardBuild: false)
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
                self.player.labelOverHead(shield: self.player.shield, health: self.player.health, initLabel: false)
            }
        case 3:
            objectForAnimation = manaPoolNode
            positionToMove = (manaPoolNode.parent?.position)!
            specialActionOnEnd = SKAction.run {
                self.changeManaLabel()
            }
        case 7:
            objectForAnimation = enemyUnit
            positionToMove = enemyUnit.position
            specialActionOnEnd = SKAction.run {
                self.enemyUnit.setLabelOverHead(shield: self.enemyUnit.shield, health: self.enemyUnit.health, initLabel: false)
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
            self.nodeAnimationPulseUp(node: objectForAnimation as! SKSpriteNode, duration: 0.2, percentValuePulsation: 20/3)
        }
        self.addChild(matchNode)
        matchNode.run(SKAction.sequence([endMove, startMove, removeMatch, specialActionOnEnd]))

    }
    
    func matchMoveToBoard(matchType: Match, nodePosition: SKSpriteNode, i: Int, j: Int, waitTimeToAnimation: TimeInterval, durationAnimation: TimeInterval){
        let matchNode = SKSpriteNode(texture: setTextureMatch(matchNumber: matchType))
        
//        print(nodePosition)
        
        switch nodePosition {
        case player:
            matchNode.position = player.positionCenter
        case enemyUnit:
            matchNode.position = enemyUnit.positionCenter
        default:
            matchNode.position = nodePosition.position
        }
        
//        print(matchNode.position)
        
        matchNode.size.width = 0
        matchNode.size.height = 0
        matchNode.zPosition = CGFloat(matchBoard.matchZIndex + 2)
        
        let durationMoveAndResize = 0.5
        
        let animationCode = SKAction.run {
            self.nodeAnimationPulseUp(node: nodePosition, duration: durationAnimation, percentValuePulsation: 20)
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
            self.matchAnimationPulseRevers(indexIandJ: String(i) + String(j))
        }
        
        let setMatchWithIndex = SKAction.run {
            self.levelArr[i][j] = matchType
            self.buildLevel(hardBuild: false)
            self.checkArrOnAction(loop: loopOnSpawnMatch)
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
        self.checkArrForAction()
    }
    

    
}

