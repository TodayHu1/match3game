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
        matchNode.position = CGPoint(x: ((55 * j) - 139), y: (0 - (55 * i)) - 9)
        matchNode.xScale = 0.07
        matchNode.yScale = 0.07
        matchNode.name = "QAZ"
        matchNode.zPosition = 999
        
        var objectPosition: AnyObject
        var objectScaleForAnimation = CGFloat(0.97)
        
        switch statArr[i][j] {
        case 1:
            objectPosition = enemyUnit
        case 2:
            objectPosition = player.iconShield
            objectScaleForAnimation = 1.1
        default:
            objectPosition = player
        }
    
        let startMove = SKAction.move(to: CGPoint(x: objectPosition.position.x, y: objectPosition.position.y), duration: 0.3)
        startMove.timingMode = .easeInEaseOut
        let endMove = SKAction.move(to: CGPoint(x: CGFloat(randomNear(number: 190)), y: CGFloat(randomNear(number: 160))), duration: 0.4)
        endMove.timingMode = .easeOut
        let fullMoveAction = SKAction.sequence([endMove, startMove])
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.addChild(matchNode)
            matchNode.run(fullMoveAction)
            
            let q = SKAction.scale(by: objectScaleForAnimation, duration: 0.1)
            let w = q.reversed()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                objectPosition.run(SKAction.sequence(
                    [q,w]
                ))
                matchNode.removeFromParent()
            }
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
//        myLabel.text = "🖤 " + String(describing: actionOnTurn[0])
//            + "❤️ " + String(describing: actionOnTurn[1])
//            + "💙 " + String(describing: actionOnTurn[2])
//            + "💜 " + String(describing: actionOnTurn[3])
//            + "💛 " + String(describing: actionOnTurn[4])
//            + "💔 " + String(describing: actionOnTurn[5])
//        
        
//        player.fullAttackStandAnimation(playerName: "Fitments")
//        enemyUnit.animationStand()
//        player.fullAttackStandAnimation()
//        enemyUnit.fullAttackStandAnimation()
//        player.labelOverHead(shield: player.shield, health: player.health + actionOnTurn[2], initLabel: false)
        gameScene.checkArrForAction()
    }
    

    
}

