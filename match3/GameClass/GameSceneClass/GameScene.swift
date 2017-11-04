
//
//  GameScene.swift
//  match3
//
//  Created by Женя on 24.06.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import SpriteKit
import GameplayKit


public var levelArr = [[0,0,0,0,0,0],
                       [0,0,0,0,0,0],
                       [0,0,0,0,0,0],
                       [0,0,0,0,0,0],
                       [0,0,0,0,0,0],
                       [0,0,0,0,0,0]]


var enemyOnLevelArr = [enemyUnit,enemyUnit,enemyUnit,enemyUnit]

var enemyUnit = EnemyUnit(enemyName: "StoneScale", attack: 0, health: 0, shield: 0, size: CGSize(width: 0, height: 0), vampire: 0)
var player = Player()
var gameScene = GameScene()
var gestureLabel = SKLabelNode(fontNamed: "Arial")
var enemyIndexNow = 0
var statLabel = SKLabelNode(fontNamed: "Arial")
var manaLabel = SKLabelNode(fontNamed: "Arial")

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
        
        for someNode in self.children {
            if someNode.name == name {
                if let nodeNode = someNode as? SKSpriteNode {
                    searchNode = nodeNode
                }
            }
        }
        
        return searchNode!
    }
    
    public func buildLevel(hardBuild: Bool) {
        
        if hardBuild {
            for i in 0...levelArr.count-1 {
                for j in 0...levelArr.count-1 {
                    for nextButton in self.children {
                        if nextButton.name == "Match" + String(i) + String(j) {
                            if let nextButton = nextButton as? SKSpriteNode {
                                nextButton.removeAllChildren()
                                nextButton.removeFromParent()
                            }
                        }
                    }
                }
            }
            
            
            for i in 0...levelArr.count-1 {
                for j in 0...levelArr.count-1 {
                    let matchNode = SKSpriteNode(texture: setTextureMatch(matchNumber: levelArr[i][j]))
                    matchNode.position = CGPoint(x: ((55 * j) - 139), y: (0 - (55 * i)) - 9)
                    matchNode.size.width = 54
                    matchNode.size.height = 54
                    matchNode.name = "Match" + String(i) + String(j)
                    matchNode.zPosition = 993
                    self.addChild(matchNode)
                }
            }
//            print("Хард билд")
        }
        else {
//            print("=====================")
            for i in 0...5 {
                for j in 0...5 {
                    let matchNode: SKSpriteNode = self.searchByName(name: "Match" + String(i) + String(j))
                    matchNode.zPosition = 900
                    matchNode.position = CGPoint(x: ((55 * j) - 139), y: (0 - (55 * i)) - 9)
                    
                    var matchNodeStringTexture = String(describing: setTextureMatch(matchNumber: levelArr[i][j]))
                    
                    matchNodeStringTexture = matchNodeStringTexture.replacingOccurrences(of: "<SKTexture>", with: "").replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "'", with: "").replacingOccurrences(of: "(600x600)", with: "")

                    matchNode.texture = SKTexture(imageNamed: matchNodeStringTexture)
                }
            }
//            print("Cофт билд")
        }
        
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
        
        enemyOnLevelArr[0] = gameScene.initNewClassForEnemy(enemyName: "MotherStony")
        enemyOnLevelArr[1] = gameScene.initNewClassForEnemy(enemyName: "SteamPunkPunch")
        enemyOnLevelArr[2] = gameScene.initNewClassForEnemy(enemyName: "MotherStony")
        enemyOnLevelArr[3] = gameScene.initNewClassForEnemy(enemyName: "SteamPunkFlameThrower")
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
        

        
//        func label(obj: SKSpriteNode, text: String) {
//            myLabel.text = text
//            myLabel.name = "testlabel"
//            myLabel.fontSize = 60
//            myLabel.position = CGPoint(x: obj.frame.midX + 100, y: obj.frame.height + 200)
//            
//            obj.addChild(myLabel)
//        }
//        label(obj: searchByName(name: "enemyUnit"), text: String(describing: actionOnTurn))
        
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
        for touch: AnyObject in touches {
            lastTouch = touch.location(in: self)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
//        gestureLabel.text = "Gesture: " + String(matchActionGesture)
    }
}
