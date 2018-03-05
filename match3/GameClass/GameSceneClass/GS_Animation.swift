//
//  GS_Animation.swift
//  match3
//
//  Created by Женя on 13.08.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import SpriteKit
extension GameScene {
    
//    for i in 0...matchBoard.verticalCount-1 {
//        for j in 0...matchBoard.horizontalCount-1 {
//        }
//    }
    
    func durationSpawnMatchAnimation() -> TimeInterval {
        let y = 3
        let x: Double = Double(Double(y) / Double(matchBoard.numberOfMatch))
        return (TimeInterval(x))
    }
    
    public func swipeAnimationLeft(index: Int) {
        for j in 1...matchBoard.horizontalCount-1 {
            let spriteNode = matchNodeOnTable[index][j]
            spriteNode.zPosition = CGFloat(matchBoard.matchZIndex + 1)
            let duration: TimeInterval = 0.3
            let moveA = SKAction.move(to: CGPoint(x: spriteNode.position.x - spriteNode.size.width, y: spriteNode.position.y), duration: duration)
            moveA.timingMode = .easeOut
            spriteNode.run(moveA)
        }
    }
    
    public func swipeAnimationRight(index: Int) {
        for j in 0...matchBoard.horizontalCount-2 {
            let spriteNode = matchNodeOnTable[index][j]
            spriteNode.zPosition = CGFloat(matchBoard.matchZIndex + 1)
            let duration: TimeInterval = 0.3
            let moveA = SKAction.move(to: CGPoint(x: spriteNode.position.x + spriteNode.size.width, y: spriteNode.position.y), duration: duration)
            moveA.timingMode = .easeOut
            spriteNode.run(moveA)
        }
    }
    
    public func swipeAnimationUp(index: Int) {
        for j in 1...matchBoard.verticalCount-1 {
            let spriteNode = matchNodeOnTable[j][index]
            spriteNode.zPosition = CGFloat(matchBoard.matchZIndex + 1)
            let duration: TimeInterval = 0.3
            let moveA = SKAction.move(to: CGPoint(x: spriteNode.position.x, y: spriteNode.position.y + spriteNode.size.height), duration: duration)
            moveA.timingMode = .easeOut
            spriteNode.run(moveA)
        }
    }
    
    public func swipeAnimationDown(index: Int) {
        for j in 0...matchBoard.verticalCount-2 {
            let spriteNode = matchNodeOnTable[j][index]
            spriteNode.zPosition = CGFloat(matchBoard.matchZIndex + 1)
            let duration: TimeInterval = 0.3
            let moveA = SKAction.move(to: CGPoint(x: spriteNode.position.x, y: spriteNode.position.y - spriteNode.size.height), duration: duration)
            moveA.timingMode = .easeOut
            spriteNode.run(moveA)
        }
    }
    
    public func matchAnimationPulse(i: Int, j: Int) {
        var spriteNode = matchNodeOnTable[i][j]
        let duration: TimeInterval = 0.3
        spriteNode.zPosition = CGFloat(matchBoard.matchZIndex + 2)
        let moveB = SKAction.resize(byWidth: 10, height: 10, duration: duration/2)
        let moveC = SKAction.resize(byWidth: -10, height: -10, duration: duration/2)
        moveB.timingMode = .easeOut
        moveC.timingMode = .easeOut
        let matchAnimation = SKAction.sequence([moveB, moveC])
        spriteNode.run(matchAnimation)
    }
    
    public func animationMatchSpin(i: Int, j: Int) {
        let spriteNode = matchNodeOnTable[i][j]
        spriteNode.zPosition = CGFloat(matchBoard.matchZIndex + 2)
        let moveA = SKAction.rotate(byAngle: CGFloat(Double.pi/2) * 4, duration: 0.6)
        let moveB = SKAction.resize(byWidth: spriteNode.size.width + 10, height: spriteNode.size.height + 10, duration: 0.1)
        let moveC = SKAction.resize(byWidth: spriteNode.size.width - 10, height: spriteNode.size.height - 10, duration: 0.1)
        moveA.timingMode = .easeOut
        moveB.timingMode = .easeOut
        moveC.timingMode = .easeOut
        let matchAnimation = SKAction.sequence([moveA])
        spriteNode.run(matchAnimation)
    }
    
    public func matchAnimationPulseRevers(i: Int, j: Int) {
        var spriteNode = matchNodeOnTable[i][j]
        let duration: TimeInterval = 0.3
        spriteNode.zPosition = CGFloat(matchBoard.matchZIndex + 2)
        let moveB = SKAction.resize(byWidth: 10, height: 10, duration: duration/2)
        let moveC = SKAction.resize(byWidth: -10, height: -10, duration: duration/2)
        moveB.timingMode = .easeOut
        moveC.timingMode = .easeOut
        let matchAnimation = SKAction.sequence([moveC, moveB])
        spriteNode.run(matchAnimation)
    }
    
    public func nodeAnimationPulseUp(node: SKSpriteNode, duration: TimeInterval, percentValuePulsation: CGFloat) {
        let value = 100 / percentValuePulsation
        let moveB = SKAction.resize(byWidth: node.size.width/value, height: node.size.height/value, duration: duration/2)
        let moveC = SKAction.resize(byWidth: -node.size.width/value, height: -node.size.height/value, duration: duration/2)
        moveB.timingMode = .easeOut
        moveC.timingMode = .easeOut
        let nodeAnimation = SKAction.sequence([moveB, moveC])
        node.run(nodeAnimation)
    }
    
    public func nodeAnimationPulseDown(node: SKSpriteNode, duration: TimeInterval, percentValuePulsation: CGFloat) {
        let value = 100 / percentValuePulsation
        let moveB = SKAction.resize(byWidth: node.size.width/value, height: node.size.height/value, duration: duration/2)
        let moveC = SKAction.resize(byWidth: -node.size.width/value, height: -node.size.height/value, duration: duration/2)
        moveB.timingMode = .easeOut
        moveC.timingMode = .easeOut
        let nodeAnimation = SKAction.sequence([moveC, moveB])
        node.run(nodeAnimation)
    }
    
    
    
    
}
