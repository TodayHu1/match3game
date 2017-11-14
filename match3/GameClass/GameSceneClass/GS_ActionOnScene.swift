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
    
    public func moveMatchToPlayer(i:Int ,j:Int) {
        let matchNode = SKSpriteNode(texture: setTextureMatch(matchNumber: levelArr[i][j]))
        matchNode.position = matchBoard.matchPosition(i: i, j: j)
        matchNode.size.width = CGFloat(matchBoard.matchSizeOnAction)
        matchNode.size.height = CGFloat(matchBoard.matchSizeOnAction)
        matchNode.zPosition = CGFloat(matchBoard.matchZIndex + 2)
        
        var objectForAnimation: AnyObject
        var positionToMove: CGPoint = player.position

        switch statArr[i][j] {
        case 1:
            objectForAnimation = enemyUnit
            positionToMove = enemyUnit.position
        case 2:
            objectForAnimation = player.iconShield
            positionToMove = player.position
        case 3:
            objectForAnimation = manaPoolNode
            positionToMove = manaPoolNode.position
        default:
            objectForAnimation = player
        }
    
        let startMove = SKAction.move(to: positionToMove, duration: 0.3)
        startMove.timingMode = .easeInEaseOut
        
        let endMove = SKAction.move(to: CGPoint(x: CGFloat(randomNear(number: 190)), y: CGFloat(randomNear(number: 160))), duration: 0.4)
        endMove.timingMode = .easeOut

        let removeMatch = SKAction.run {
            matchNode.removeFromParent()
            gameScene.nodeAnimationPulseRevers(node: objectForAnimation as! SKSpriteNode, duration: 0.2, percentValuePulsation: 20/3)
        }
        self.addChild(matchNode)
        matchNode.run(SKAction.sequence([endMove, startMove, removeMatch]))

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
//        levelArr[gameScene.random(number: 5)][gameScene.random(number: 5)] = 6
    }
    

    
}

