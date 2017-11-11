
//
//  GameScene.swift
//  match3
//
//  Created by Женя on 24.06.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import SpriteKit
import GameplayKit

var enemyOnLevelArr = [enemyUnit,enemyUnit,enemyUnit,enemyUnit]

var matchBoard = Match(horizontalCount: 8, verticalCount: 8)
var enemyUnit = EnemyUnit(enemyName: "StoneScale", attack: 0, health: 0, shield: 0, size: CGSize(width: 0, height: 0), vampire: 0, reactiveArmor: 0)
var player = Player()
var gameScene = GameScene()
var gestureLabel = SKLabelNode(fontNamed: "Arial")
var enemyIndexNow = 0
var statLabel = SKLabelNode(fontNamed: "Arial")
var manaLabel = SKLabelNode(fontNamed: "Arial")

public var levelArr = Array(repeating: Array(repeating: -1, count: matchBoard.horizontalCount),
                              count: matchBoard.verticalCount)


class GameScene: SKScene {
    
    private var lastTouch = CGPoint(x:1,y:1)
    
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
    
    public func searchByName(name: String) -> SKSpriteNode {
        var searchNode: SKSpriteNode?
//        print(name)
        for someNode in self.children {
            if someNode.name == name {
                if let nodeNode = someNode as? SKSpriteNode {
                    searchNode = nodeNode
                }
            }
        }
        
        return searchNode!
    }
    
    func swipedLeft(sender:UISwipeGestureRecognizer){
        if matchActionGesture {
            direction(dir: 1, point: lastTouch)
            Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(afterAnimation), userInfo: nil, repeats: false)
        }
    }
    
    func swipedUp(sender:UISwipeGestureRecognizer){
        if matchActionGesture {
            direction(dir: -1, point: lastTouch)
            Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(afterAnimation), userInfo: nil, repeats: false)
        }
    }
    
    func swipedDown(sender:UISwipeGestureRecognizer){
        if matchActionGesture {
            direction(dir: -2, point: lastTouch)
            Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(afterAnimation), userInfo: nil, repeats: false)
        }
    }
    
    func swipedRight(sender:UISwipeGestureRecognizer){
        if matchActionGesture {
            direction(dir: 2, point: lastTouch)
            Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(afterAnimation), userInfo: nil, repeats: false)
        }
    }
    
    func afterAnimation() {
        checkAlignArr()
    }
    
    override func didMove(to view: SKView) {

        buildLevel(hardBuild: true)
        checkArr()
        
        gameScene = self
        
        enemyOnLevelArr[0] = gameScene.initNewClassForEnemy(enemyName: "SteamPunkWalker")
        enemyOnLevelArr[1] = gameScene.initNewClassForEnemy(enemyName: "SteamPunkPunch")
        enemyOnLevelArr[2] = gameScene.initNewClassForEnemy(enemyName: "SteamPunkFlameThrower")
        enemyOnLevelArr[3] = gameScene.initNewClassForEnemy(enemyName: "Stony")
        enemyUnit = enemyOnLevelArr[enemyIndexNow]
        
        player = Player()
        
        statLabel.zPosition = 10
        statLabel.position = CGPoint(x: 0, y: 290)
        statLabel.fontName = "MunroSmall"
        statLabel.fontSize = 40
        statLabel.text = "OVER VS 9000"
        self.addChild(statLabel)
        
        manaLabel.zPosition = 10
        manaLabel.position = CGPoint(x: 0, y: 80)
        manaLabel.fontName = "Munro"
        manaLabel.fontSize = 32
        manaLabel.text = String(player.mana)
        manaLabel.verticalAlignmentMode = .center
        manaLabel.horizontalAlignmentMode = .center
        self.addChild(manaLabel)
        
        
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
        
        gestureLabel.position = CGPoint(x: 50, y: 10)
        gestureLabel.zPosition = 9999
        self.addChild(gestureLabel)
        
        self.addChild(player)
        self.addChild(enemyUnit)
//        player.animationStand()
//        enemyUnit.animationStand()
//        print("x-x-x- BUILD DONE -x-x-x")

    }
    
    override func didFinishUpdate() {

    }
    


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch: AnyObject in touches {
        for touch in (touches) {
            lastTouch = touch.location(in: self)
            let positionInScene = touch.location(in: self)
            let touchedNode = self.atPoint(positionInScene)
            if let name = touchedNode.name {
                if name == "Spell" {
                    
                    print(name)
                    var interval: Double = 0
                    for i in 0...matchBoard.verticalCount-1 {
                        for j in 0...matchBoard.horizontalCount-1 {
                            if levelArr[i][j] == 1 {
                                interval += 0.2
                                matchMoveToBoard(matchIndex: 0,startPosition: player.position, i: i, j: j, waitTimeToAnimation: TimeInterval(interval))
                            }
                        }
                    }
                    gameScene.checkArr()
                    
                    
                    
                }
                if name == "Spell2" {
                    
                    print(name)
                    var interval: Double = 0
                    for i in 0...matchBoard.verticalCount-1 {
                        for j in 0...matchBoard.horizontalCount-1 {
                            print(i-j)
                            if i == j {
                                interval += 0.2
                                matchMoveToBoard(matchIndex: 1,startPosition: enemyUnit.position, i: i, j: j, waitTimeToAnimation: TimeInterval(interval))
                            }
                        }
                    }
                    print("Spell2 done")
                    
                    
                    
                }
                
                if name == "Spell3" {
                    
                    print(name)
                    var interval: Double = 0
                    for i in 0...matchBoard.verticalCount-1 {
                        for j in 0...matchBoard.horizontalCount-1 {
                            if i-j == 1 || i-j == -1 {
                                interval += 0.1
                                matchMoveToBoard(matchIndex: 5,startPosition: player.position, i: i, j: j, waitTimeToAnimation: TimeInterval(interval))
                            }
                        }
                    }
                    print("Spell2 done")
                    
                    
                    
                }
                
                if name == "Spell4" {
                    
                    print(name)
                    var interval: Double = 0
                    for i in 0...matchBoard.verticalCount-1 {
                        for j in 0...matchBoard.horizontalCount-1 {
                            if i + j < 6 {
                                interval += 0.1
                                matchMoveToBoard(matchIndex: i+j,startPosition: player.position, i: i, j: j, waitTimeToAnimation: TimeInterval(interval))
                            }
                            else {
                                interval += 0.1
                                matchMoveToBoard(matchIndex: 0,startPosition: player.position, i: i, j: j, waitTimeToAnimation: TimeInterval(interval))
                            }
                        }
                    }
                    print("Spell2 done")
                    
                    
                    
                }
            }
        }

//        }
    }
    
    override func update(_ currentTime: TimeInterval) {
//        gestureLabel.text = "Gesture: " + String(matchActionGesture)
    }
}
