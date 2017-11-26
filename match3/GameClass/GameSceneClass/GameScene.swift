
//
//  self.swift
//  match3
//
//  Created by Женя on 24.06.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import SpriteKit
import GameplayKit



class GameScene: SKScene {
    
    var matchBoard: Match!
    var randomUnit: GeneratRandomUnit!
    var gestureLabel = SKLabelNode(text: "")
    var enemyIndexNow = 0
    var testGameLabel = SKLabelNode(fontNamed: "Arial")
    var manaLabel: SKCountingLabel = SKCountingLabel(fontNamed: "Arial")
    var manaPoolNode = SKSpriteNode(imageNamed: "")
    var levelArr = [[Int]]()
    private var lastTouch = CGPoint(x:1,y:1)
    var player: Player!
    var enemyUnit: EnemyUnit!
    var spell1: Spell!
    var spell2: Spell!
    var spell3: Spell!
    var spell4: Spell!
    var actionOnTurn = [Int](repeating: 0, count: 0 + 1)
    var statArr = [[Int]]()
    var enemyOnLevelArr = [EnemyUnit]()
    
    required init?(coder aDecoder: NSCoder) {
        print("INIT CODER - \(aDecoder)")
        super.init(coder: aDecoder)
        self.matchBoard = Match(horizontalCount: 4, verticalCount: 4, gameScene: self)
        self.player = Player(gameScene: self)
        self.enemyUnit = EnemyUnit(enemyName: "StoneScale", attack: 0, health: 0, shield: 0, size: CGSize(width: 100, height: 100), vampire: 0, reactiveArmor: 0, gameScene: self)
        self.enemyOnLevelArr = [enemyUnit,enemyUnit,enemyUnit,enemyUnit]
        self.randomUnit = GeneratRandomUnit(playerLvl: 1, gameScene: self)
        
        self.actionOnTurn = [Int](repeating: 0, count: actionOnTurnCount() + 1)
        
        self.levelArr = Array(repeating: Array(repeating: -1, count: self.matchBoard.horizontalCount),
                              count: matchBoard.verticalCount)
        
        self.statArr = Array(repeating: Array(repeating: -1, count: self.matchBoard.horizontalCount),
                             count: matchBoard.verticalCount)
        
        self.manaPoolNode = searchByName(name: "manaBarPool")
        
        self.spell1 = spellBook(skillName: playerSpell[0], spellIndex: 1)
        self.spell2 = spellBook(skillName: playerSpell[1], spellIndex: 2)
        self.spell3 = spellBook(skillName: playerSpell[2], spellIndex: 3)
        self.spell4 = spellBook(skillName: playerSpell[3], spellIndex: 4)
        
        self.addChild(spell1)
        self.addChild(spell2)
        self.addChild(spell3)
        self.addChild(spell4)
        
        print("INIT CODER DONE")
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
        
        print("DIDMOVE GO")

        buildLevel(hardBuild: true)
        checkArrOnAction(loop: loopOnSpawnMatch)

        testGameLabel.zPosition = 1000
        testGameLabel.horizontalAlignmentMode = .left
        testGameLabel.position = CGPoint(x: -self.size.width/2 + 5 , y: -self.size.height/2 + 5)
        testGameLabel.fontName = "MunroSmall"
        testGameLabel.fontSize = 20
        testGameLabel.text = "SOME LOG HERE..."
        self.addChild(testGameLabel)
        
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
        
        swipeRight.addTarget(self, action: #selector(self.swipedRight) )
        swipeRight.direction = .right
        self.view!.addGestureRecognizer(swipeRight)
        
        
        swipeLeft.addTarget(self, action: #selector(self.swipedLeft) )
        swipeLeft.direction = .left
        self.view!.addGestureRecognizer(swipeLeft)
        
        
        swipeUp.addTarget(self, action: #selector(self.swipedUp) )
        swipeUp.direction = .up
        self.view!.addGestureRecognizer(swipeUp)
        
        
        swipeDown.addTarget(self, action: #selector(self.swipedDown))
        swipeDown.direction = .down
        self.view!.addGestureRecognizer(swipeDown)
        
        gestureLabel.position = CGPoint(x: 50, y: 10)
        gestureLabel.zPosition = 9999
        self.addChild(gestureLabel)
        
        self.addChild(player)
        self.addChild(enemyUnit)
        player.animationStand()
        enemyUnit.animationStand()
        testGameLabel.text = "Done DidMove"
        
        print("DIDMOVE DONE")

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
                    testGameLabel.text = (touchedNode.name as Any as! String)
                    spell1.useSpell()
                }
                if touchedNode.name == "Spell2" {
                    testGameLabel.text = (touchedNode.name as Any as? String)
                    spell2.useSpell()
                }
                if touchedNode.name == "Spell3" {
                    testGameLabel.text = (touchedNode.name as Any as! String)
                    spell3.useSpell()
                }
                if touchedNode.name == "Spell4" {
                    testGameLabel.text = touchedNode.name as Any as? String
                    spell4.useSpell()
                }
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
//        gestureLabel.text = "Gesture: " + String(matchActionGesture)
    }
}
