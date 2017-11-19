
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

var matchBoard = Match(horizontalCount: 6, verticalCount: 6)
var enemyUnit = EnemyUnit(enemyName: "StoneScale", attack: 0, health: 0, shield: 0, size: CGSize(width: 0, height: 0), vampire: 0, reactiveArmor: 0)
var player = Player()
var gameScene = GameScene()

var spell1 = Spell(name: "Spell1", position: CGPoint(x: -140, y: 80))
var spell2 = Spell(name: "Spell2", position: CGPoint(x: -70, y: 80))
var spell3 = Spell(name: "Spell3", position: CGPoint(x: 70, y: 80))
var spell4 = Spell(name: "Spell4", position: CGPoint(x: 140, y: 80))

var gestureLabel = SKLabelNode(text: "")
var enemyIndexNow = 0
var statLabel = SKLabelNode(fontNamed: "Arial")
var manaLabel = SKCountingLabel(fontNamed: "Arial")
var manaPoolNode = SKSpriteNode(imageNamed: "")

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
        startCheckLoop()
    }
    
    override func didMove(to view: SKView) {

        buildLevel(hardBuild: true)
        checkArrOnAction(loop: loopOnSpawnMatch)
        
        gameScene = self
        
        enemyOnLevelArr[0] = gameScene.initNewClassForEnemy(enemyName: "SteamPunkWalker")
        enemyOnLevelArr[1] = gameScene.initNewClassForEnemy(enemyName: "SteamPunkFlameThrower")
        enemyOnLevelArr[2] = gameScene.initNewClassForEnemy(enemyName: "SteamPunkFlameThrower")
        enemyOnLevelArr[3] = gameScene.initNewClassForEnemy(enemyName: "SteamPunkWalker")
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
        
        manaPoolNode = searchByName(name: "manaBarPool")
        
        spell1 = gameScene.spellBook(skillName: "SkullJail", spellIndex: 1)
        spell2 = gameScene.spellBook(skillName: "TouchOfMidas", spellIndex: 2)
        spell3 = gameScene.spellBook(skillName: "Nemesis", spellIndex: 3)
        spell4 = gameScene.spellBook(skillName: "NoOneStepBack", spellIndex: 4)


        self.addChild(spell1)
        self.addChild(spell2)
        self.addChild(spell3)
        self.addChild(spell4)
        
        
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
        player.animationStand()
        enemyUnit.animationStand()
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
            if touchedNode.name != nil {
                if touchedNode.name == "Spell1" {
                    print(touchedNode.name as Any)
                    spell1.useSpell()
                }
                if touchedNode.name == "Spell2" {
                    print(touchedNode.name as Any)
                    spell2.useSpell()
                }
                if touchedNode.name == "Spell3" {
                    print(touchedNode.name as Any)
                    spell3.useSpell()
                }
                if touchedNode.name == "Spell4" {
                    print(touchedNode.name as Any)
                    spell4.useSpell()
                }
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
//        gestureLabel.text = "Gesture: " + String(matchActionGesture)
    }
}
