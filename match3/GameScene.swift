//
//  GameScene.swift
//  match3
//
//  Created by Женя on 24.06.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import SpriteKit
import GameplayKit


public var levelArr = [[1,0,0,0,0,0],
                       [0,0,0,0,0,0],
                       [0,0,0,0,0,0],
                       [0,0,0,0,0,0],
                       [0,0,0,0,0,0],
                       [2,0,0,0,0,0]]


class GameScene: SKScene {
    

    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    private var lastTouch = CGPoint(x:1,y:1)
    
    func random(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)) + 1)
    }
    

    public func buildLevel() {
        
        

        
        for i in 0...levelArr.count-1 {
            for j in 0...levelArr.count-1 {
                for nextButton in self.children {
                    if nextButton.name == String(levelArr[i][j]) {
                        if let nextButton = nextButton as? SKSpriteNode {
                            nextButton.removeAllChildren()
                            nextButton.removeFromParent()
                        }
                    }
                }
            }
        }
        
//        print("=======")
        
        for i in 0...levelArr.count-1 {
            for j in 0...levelArr.count-1 {
                let matchNode = SKSpriteNode(texture: Match().setTextureMatch(matchNamber: levelArr[i][j]))
                matchNode.position = CGPoint(x: ((55 * j) - 139), y: (0 - (55 * i)) - 9)
                matchNode.xScale = 0.19
                matchNode.yScale = 0.19
                matchNode.name = String(levelArr[i][j])
                matchNode.zPosition = 993
                self.addChild(matchNode)
                
            }
        }
//        print("Build")
//
//
//        print(levelArr)
        

    }
    
    func swipedRight(sender:UISwipeGestureRecognizer){
        ActionGesture().direction(dir: 2, point: lastTouch)
        buildLevel()
        animate()

    }
    
    func animate() {
        var spriteA: SKSpriteNode!
        var spriteB: SKSpriteNode!
        
        for nextButton in self.children {
            if nextButton.name == "1" {
                if let nextButton = nextButton as? SKSpriteNode {
                    spriteA = nextButton
                }
            }
        }

        for nextButton1 in self.children {
            if nextButton1.name == "2" {
                if let nextButton1 = nextButton1 as? SKSpriteNode {
                    spriteB = nextButton1
                }
            }
        }
        
        
        spriteA.zPosition = 100
        spriteB.zPosition = 90
        
        let duration: TimeInterval = 0.3
        
        let moveA = SKAction.move(to: spriteB.position, duration: duration)
        moveA.timingMode = .easeOut
        spriteA.run(moveA)
        
        let moveB = SKAction.move(to: spriteA.position, duration: duration)
        moveB.timingMode = .easeOut
        spriteB.run(moveB)
        
        
    }
    
    func swipedLeft(sender:UISwipeGestureRecognizer){
        ActionGesture().direction(dir: 1, point: lastTouch)
        buildLevel()
    }
    
    func swipedUp(sender:UISwipeGestureRecognizer){
        ActionGesture().direction(dir: -1, point: lastTouch)
        buildLevel()
    }
    
    func swipedDown(sender:UISwipeGestureRecognizer){
        ActionGesture().direction(dir: -2, point: lastTouch)
        buildLevel()
    }
    
    override func didMove(to view: SKView) {

        buildLevel()
        
        let swipeRight = UISwipeGestureRecognizer()
        let swipeLeft = UISwipeGestureRecognizer()
        let swipeUp = UISwipeGestureRecognizer()
        let swipeDown = UISwipeGestureRecognizer()
        
        swipeRight.addTarget(self, action: #selector(GameScene.swipedRight) )
        swipeRight.direction = .right
        self.view!.addGestureRecognizer(swipeRight)
        
        
        swipeLeft.addTarget(self, action: #selector(GameScene.swipedLeft) )
        swipeLeft.direction = .left
        self.view!.addGestureRecognizer(swipeLeft)
        
        
        swipeUp.addTarget(self, action: #selector(GameScene.swipedUp) )
        swipeUp.direction = .up
        self.view!.addGestureRecognizer(swipeUp)
        
        
        swipeDown.addTarget(self, action: #selector(GameScene.swipedDown))
        swipeDown.direction = .down
        self.view!.addGestureRecognizer(swipeDown)
        
        

    }
    
    
    //Вызывается когда просиходит нажатие
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Цикл считывающий нажатие на экран
        for touch: AnyObject in touches {
            lastTouch = touch.location(in: self)
//            print(lastTouch)
//            buildLevel()
            
            
            
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
