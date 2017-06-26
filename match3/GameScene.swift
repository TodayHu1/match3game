//
//  GameScene.swift
//  match3
//
//  Created by Женя on 24.06.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import SpriteKit
import GameplayKit

public var levelArr = [[1,2,1,2,1,2],
                       [2,1,2,1,2,2],
                       [3,3,2,3,2,3],
                       [1,2,3,3,1,1],
                       [2,1,1,2,2,1],
                       [1,2,3,1,2,3]]

class GameScene: SKScene {
    

    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    private var lastTouch = CGPoint(x:1,y:1)
    
    func randon(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    public func moveArrLeft(array: [Int]) {
        var xarray = array
        xarray.remove(at: 0)
        xarray.append(0)
        buildLevel()
        
    }

    public func buildLevel() {
        for i in 0...levelArr.count-1 {
            for j in 0...levelArr.count-1 {
                let matchNode = SKSpriteNode(texture: Match().setTextureMatch(matchNamber: levelArr[i][j]))
                matchNode.position = CGPoint(x: (0 - (55 * j) + 139), y: (0 - (55 * i)) - 9)
                matchNode.xScale = 0.19
                matchNode.yScale = 0.19
                matchNode.zPosition = 998
                self.addChild(matchNode)
            }
        }
        print("Build")
    }
    
    func swipedRight(sender:UISwipeGestureRecognizer){
        ActionGesture().direction(dir: 2, point: lastTouch)
    }
    
    func swipedLeft(sender:UISwipeGestureRecognizer){
        ActionGesture().direction(dir: 1, point: lastTouch)
    }
    
    func swipedUp(sender:UISwipeGestureRecognizer){
        ActionGesture().direction(dir: -1, point: lastTouch)
    }
    
    func swipedDown(sender:UISwipeGestureRecognizer){
        ActionGesture().direction(dir: -2, point: lastTouch)
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
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
