//
//  GS_HelpFunction.swift
//  match3
//
//  Created by Женя on 16.11.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
extension GameScene {
    
    public func stringToFloat(value: String) -> Float {
        return (value as NSString).floatValue
    }
    
    public func randomFloat() -> Float {
        return Float(Double(arc4random())/Double(UInt32.max))
    }
    
    public func random(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)) + 1)
    }
    
    public func randomNear(number: Int) -> Int {
        let value: Int = Int(arc4random_uniform(UInt32(number))) - (number/2)
        return value
    }
    
//    public func searchByName(name: String) -> SKSpriteNode {
//        var searchNode: SKSpriteNode?
//        for someNode in self.children {
//            if someNode.name == name {
//                if let nodeNode = someNode as? SKSpriteNode {
//                    searchNode = nodeNode
//                }
//            }
//        }
//        
//        return searchNode!
//    }
    
}


