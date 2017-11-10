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
    
    public func swipeAnimationLeft(index: Int) {
        var spriteNode: SKSpriteNode!
        for j in 1...matchBoard.horizontalCount-1 {
            spriteNode = searchByName(name: "Match" + String(index) + String(j))
            spriteNode.zPosition = CGFloat(matchBoard.matchZIndex + 1)
            let duration: TimeInterval = 0.3
            let moveA = SKAction.move(to: CGPoint(x: spriteNode.position.x - spriteNode.size.width, y: spriteNode.position.y), duration: duration)
            moveA.timingMode = .easeOut
            spriteNode.run(moveA)
        }
    }
    
    public func swipeAnimationRight(index: Int) {
        var spriteNode: SKSpriteNode!
        for j in 0...matchBoard.horizontalCount-2 {
            spriteNode = searchByName(name: "Match" + String(index) + String(j))
            spriteNode.zPosition = CGFloat(matchBoard.matchZIndex + 1)
            let duration: TimeInterval = 0.3
            let moveA = SKAction.move(to: CGPoint(x: spriteNode.position.x + spriteNode.size.width, y: spriteNode.position.y), duration: duration)
            moveA.timingMode = .easeOut
            spriteNode.run(moveA)
        }
    }
    
    public func swipeAnimationUp(index: Int) {
        var spriteNode: SKSpriteNode!
        for j in 1...matchBoard.verticalCount-1 {
            spriteNode = searchByName(name: "Match" + String(j) + String(index))
            spriteNode.zPosition = CGFloat(matchBoard.matchZIndex + 1)
            let duration: TimeInterval = 0.3
            let moveA = SKAction.move(to: CGPoint(x: spriteNode.position.x, y: spriteNode.position.y + spriteNode.size.height), duration: duration)
            moveA.timingMode = .easeOut
            spriteNode.run(moveA)
        }
    }
    
    public func swipeAnimationDown(index: Int) {
        var spriteNode: SKSpriteNode!
        for j in 0...matchBoard.verticalCount-2 {
            spriteNode = searchByName(name: "Match" + String(j) + String(index))
            spriteNode.zPosition = CGFloat(matchBoard.matchZIndex + 1)
            let duration: TimeInterval = 0.3
            let moveA = SKAction.move(to: CGPoint(x: spriteNode.position.x, y: spriteNode.position.y - spriteNode.size.height), duration: duration)
            moveA.timingMode = .easeOut
            spriteNode.run(moveA)
        }
    }
    
    public func matchAnimationPulse(indexIandJ: String) {
        var spriteNode: SKSpriteNode!
        spriteNode = searchByName(name: "Match" + indexIandJ)
        let duration: TimeInterval = 0.3
        spriteNode.zPosition = CGFloat(matchBoard.matchZIndex + 2)
        let moveB = SKAction.resize(byWidth: 10, height: 10, duration: duration/2)
        let moveC = SKAction.resize(byWidth: -10, height: -10, duration: duration/2)
        moveB.timingMode = .easeOut
        moveC.timingMode = .easeOut
        let matchAnimation = SKAction.sequence([moveB, moveC])
        spriteNode.run(matchAnimation)
    }
    
    public func animationMatchSpin(indexIandJ: String) {
        var spriteNode: SKSpriteNode!
        spriteNode = searchByName(name: "Match" + indexIandJ)
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
    
    public func matchAnimationPulseRevers(indexIandJ: String) {
        var spriteNode: SKSpriteNode!
        spriteNode = searchByName(name: "Match" + indexIandJ)
        let duration: TimeInterval = 0.3
        spriteNode.zPosition = CGFloat(matchBoard.matchZIndex + 2)
        let moveB = SKAction.resize(byWidth: 10, height: 10, duration: duration/2)
        let moveC = SKAction.resize(byWidth: -10, height: -10, duration: duration/2)
        moveB.timingMode = .easeOut
        moveC.timingMode = .easeOut
        let matchAnimation = SKAction.sequence([moveC, moveB])
        spriteNode.run(matchAnimation)
    }
    
    
    
    
}
