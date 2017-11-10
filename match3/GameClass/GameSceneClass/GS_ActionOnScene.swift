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
        matchNode.size.width = CGFloat(matchBoard.matchSize)
        matchNode.size.height = CGFloat(matchBoard.matchSize)
        matchNode.name = "QAZ"
        matchNode.zPosition = 999
        
        var objectForAnimation: AnyObject
        var positionToMove: CGPoint = player.position
        var objectScaleForAnimation = CGFloat(0.97)

        switch statArr[i][j] {
        case 1:
            objectForAnimation = enemyUnit
            positionToMove = enemyUnit.position
        case 2:
            positionToMove = player.position
            objectForAnimation = player.iconShield
            objectScaleForAnimation = 1.2
        default:
            objectForAnimation = player
        }
    
        let startMove = SKAction.move(to: positionToMove, duration: 0.3)
        startMove.timingMode = .easeInEaseOut
        let endMove = SKAction.move(to: CGPoint(x: CGFloat(randomNear(number: 190)), y: CGFloat(randomNear(number: 160))), duration: 0.4)
        endMove.timingMode = .easeOut
        let fullMoveAction = SKAction.sequence([endMove, startMove])
        self.addChild(matchNode)
        matchNode.size = CGSize(width: 35, height: 35)
        matchNode.run(fullMoveAction)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            matchNode.removeFromParent()
        }

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

