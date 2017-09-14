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
    
    public func swipeAnimationLeft(index: Int) {
        var spriteNode: SKSpriteNode!
        for j in 1...5 {
            spriteNode = searchByName(name: "Match" + String(index) + String(j))
            spriteNode.zPosition = 1000
            let duration: TimeInterval = 0.3
            let moveA = SKAction.move(to: CGPoint(x: spriteNode.position.x - spriteNode.size.width, y: spriteNode.position.y), duration: duration)
            moveA.timingMode = .easeOut
            spriteNode.run(moveA)
        }
    }
    
    public func swipeAnimationRight(index: Int) {
        var spriteNode: SKSpriteNode!
        for j in 0...4 {
            spriteNode = searchByName(name: "Match" + String(index) + String(j))
            spriteNode.zPosition = 1000
            let duration: TimeInterval = 0.3
            let moveA = SKAction.move(to: CGPoint(x: spriteNode.position.x + spriteNode.size.width, y: spriteNode.position.y), duration: duration)
            moveA.timingMode = .easeOut
            spriteNode.run(moveA)
        }
    }
    
    public func swipeAnimationUp(index: Int) {
        var spriteNode: SKSpriteNode!
        for j in 1...5 {
            spriteNode = searchByName(name: "Match" + String(j) + String(index))
            spriteNode.zPosition = 1000
            let duration: TimeInterval = 0.3
            let moveA = SKAction.move(to: CGPoint(x: spriteNode.position.x, y: spriteNode.position.y + spriteNode.size.height), duration: duration)
            moveA.timingMode = .easeOut
            spriteNode.run(moveA)
        }
    }
    
    public func swipeAnimationDown(index: Int) {
        var spriteNode: SKSpriteNode!
        for j in 0...4 {
            spriteNode = searchByName(name: "Match" + String(j) + String(index))
            spriteNode.zPosition = 1000
            let duration: TimeInterval = 0.3
            let moveA = SKAction.move(to: CGPoint(x: spriteNode.position.x, y: spriteNode.position.y - spriteNode.size.height), duration: duration)
            moveA.timingMode = .easeOut
            spriteNode.run(moveA)
        }
    }
    
    public func animationMatchCorner(indexIandJ: String) {
        var spriteNode: SKSpriteNode!
        spriteNode = searchByName(name: "Match" + indexIandJ)
        let duration: TimeInterval = 0.3
        spriteNode.zPosition = 1000
        let moveB = SKAction.resize(byWidth: 100, height: 100, duration: duration / 2)
        let moveC = SKAction.resize(byWidth: -100, height: -100, duration: duration / 2)
        moveB.timingMode = .easeOut
        moveC.timingMode = .easeOut
        let qwe = SKAction.sequence([moveB, moveC])
        spriteNode.run(qwe)
    }
    
    public func animationMatchSpin(indexIandJ: String) {
        var spriteNode: SKSpriteNode!
        spriteNode = searchByName(name: "Match" + indexIandJ)
        spriteNode.zPosition = 1000
        let moveA = SKAction.rotate(byAngle: CGFloat(Double.pi/2) * 4, duration: 0.6)
        let moveB = SKAction.resize(byWidth: 100, height: 100, duration: 0.1)
        let moveC = SKAction.resize(byWidth: -100, height: -100, duration: 0.1)
        moveA.timingMode = .easeOut
        moveB.timingMode = .easeOut
        moveC.timingMode = .easeOut
        let qwe = SKAction.sequence([moveA])
        spriteNode.run(qwe)
    }
    
    public func animationMatchCornerReverse(indexIandJ: String) {
        var spriteNode: SKSpriteNode!
        spriteNode = searchByName(name: "Match" + indexIandJ)
        let duration: TimeInterval = 0.3
        spriteNode.zPosition = 1000
        let moveB = SKAction.resize(byWidth: 100, height: 100, duration: duration / 2)
        let moveC = SKAction.resize(byWidth: -100, height: -100, duration: duration / 2)
        moveB.timingMode = .easeOut
        moveC.timingMode = .easeOut
        let qwe = SKAction.sequence([moveC, moveB])
        spriteNode.run(qwe)
    }
    
    
    
}