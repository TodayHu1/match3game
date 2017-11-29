
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
    var enemyOnLevelArr = [String]()

    
    override init() {
        print("INIT SIZE")
        super.init(size: CGSize(width: 375, height: 665))
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.backgroundColor = UIColor(displayP3Red: 11, green: 11, blue: 11, alpha: 1)
        self.matchBoard = Match(horizontalCount: 6, verticalCount: 6, gameScene: self)
        self.player = Player(gameScene: self)
        self.enemyUnit = EnemyUnit(enemyName: "StoneScale", attack: 0, health: 0, shield: 0, size: CGSize(width: 100, height: 100), vampire: 0, reactiveArmor: 0, gameScene: self)
        self.enemyOnLevelArr = ["MotherStony"]
        self.randomUnit = GeneratRandomUnit(playerLvl: 1, gameScene: self)
        
        self.actionOnTurn = [Int](repeating: 0, count: actionOnTurnCount() + 1)
        
        self.levelArr = Array(repeating: Array(repeating: -1, count: self.matchBoard.horizontalCount),
                              count: matchBoard.verticalCount)
        
        self.statArr = Array(repeating: Array(repeating: -1, count: self.matchBoard.horizontalCount),
                             count: matchBoard.verticalCount)
        
        self.spell1 = spellBook(skillName: playerSpell[0], spellIndex: 1)
        self.spell2 = spellBook(skillName: playerSpell[1], spellIndex: 2)
        self.spell3 = spellBook(skillName: playerSpell[2], spellIndex: 3)
        self.spell4 = spellBook(skillName: playerSpell[3], spellIndex: 4)
        
        self.addChild(spell1)
        self.addChild(spell2)
        self.addChild(spell3)
        self.addChild(spell4)
        
        print("INIT SIZE DONE")
    }
    
    init(enemyArr: [String]) {
        print("INIT SIZE")
        super.init(size: CGSize(width: 375, height: 665))
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.backgroundColor = UIColor(displayP3Red: 11, green: 11, blue: 11, alpha: 1)
        self.matchBoard = Match(horizontalCount: 6, verticalCount: 6, gameScene: self)
        self.player = Player(gameScene: self)
        self.enemyUnit = EnemyUnit(enemyName: "StoneScale", attack: 0, health: 0, shield: 0, size: CGSize(width: 100, height: 100), vampire: 0, reactiveArmor: 0, gameScene: self)
        self.enemyOnLevelArr = enemyArr
        self.randomUnit = GeneratRandomUnit(playerLvl: 1, gameScene: self)
        
        self.actionOnTurn = [Int](repeating: 0, count: actionOnTurnCount() + 1)
        
        self.levelArr = Array(repeating: Array(repeating: -1, count: self.matchBoard.horizontalCount),
                              count: matchBoard.verticalCount)
        
        self.statArr = Array(repeating: Array(repeating: -1, count: self.matchBoard.horizontalCount),
                             count: matchBoard.verticalCount)
        
        self.spell1 = spellBook(skillName: playerSpell[0], spellIndex: 1)
        self.spell2 = spellBook(skillName: playerSpell[1], spellIndex: 2)
        self.spell3 = spellBook(skillName: playerSpell[2], spellIndex: 3)
        self.spell4 = spellBook(skillName: playerSpell[3], spellIndex: 4)
        
        self.addChild(spell1)
        self.addChild(spell2)
        self.addChild(spell3)
        self.addChild(spell4)
        
        print("INIT SIZE DONE")
    }
    
    required init?(coder aDecoder: NSCoder) {
        print("INIT CODER - \(aDecoder)")
        super.init(coder: aDecoder)
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
        actionGesture(gesture: true)
        startCheckLoop()
    }
    
    func buildScene() {
        //Spell Board
        let spellBoardA = SKSpriteNode(texture: SKTexture(imageNamed: "Board.png"), size: CGSize(width: 375, height: 80))
        spellBoardA.position = CGPoint(x: 0, y: 80)
        spellBoardA.zPosition = 99
        self.addChild(spellBoardA)
        
        //Mana Orb
        self.manaPoolNode = SKSpriteNode(texture: SKTexture(imageNamed: "manaBar-1.png"), size: CGSize(width: 64, height: 64))
        spellBoardA.addChild(self.manaPoolNode)
        self.manaPoolNode.zPosition += 1
        
        //Mana Holder
        let manaHolder = SKSpriteNode(texture: SKTexture(imageNamed: "manaHolder.png"), size: CGSize(width: 65, height: 65))
//        manaHoler.position = self.manaPoolNode.position
        manaHolder.zPosition = 101
        manaHolder.zRotation = CGFloat(Int(45)) * .pi / 180
        self.manaPoolNode.addChild(manaHolder)
        
        //Label for Mana Orb
        manaLabel.zPosition = 10
        manaLabel.position = CGPoint(x: 0, y: 80)
        manaLabel.fontName = "Munro"
        manaLabel.fontSize = 32
        manaLabel.text = String(player.mana)
        manaLabel.verticalAlignmentMode = .center
        manaLabel.horizontalAlignmentMode = .center
        manaLabel.zPosition = 102
        self.addChild(manaLabel)
        
        //BG
        let bg = SKSpriteNode(texture: SKTexture(imageNamed: "BGPunk2.png"), size: CGSize(width: 375, height: 215))
        bg.position = CGPoint(x: 0, y: 227)
        self.addChild(bg)
        

        
//        //Spell Cell

        for i in 0...4 {
            let spellCellTexture = SKSpriteNode(texture: SKTexture(imageNamed: "skillCell.png"), size: CGSize(width: 55, height: 55))
            spellCellTexture.zPosition = 100
            spellCellTexture.name = "SpellCell - \(i)"
            if i > 1 {
                spellCellTexture.position = CGPoint(x: -140+(70*(i+1)), y: 80)
            }
            else {
                spellCellTexture.position = CGPoint(x: -140+(70*i), y: 80)
            }
            self.addChild(spellCellTexture)
        }
    }

    override func didMove(to view: SKView) {
        
        print("DIDMOVE GO")
        buildScene()

        
//        self.manaPoolNode = searchByName(name: "manaBarPool")
//        self.manaPoolNode = manaBar
        
        self.enemyUnit = self.initNewClassForEnemy(enemyName: self.enemyOnLevelArr[self.enemyIndexNow])

        buildLevel(hardBuild: true)
        checkArrOnAction(loop: loopOnSpawnMatch)

        testGameLabel.zPosition = 1000
        testGameLabel.horizontalAlignmentMode = .left
        testGameLabel.position = CGPoint(x: -self.size.width/2 + 5 , y: -self.size.height/2 + 5)
        testGameLabel.fontName = "MunroSmall"
        testGameLabel.fontSize = 20
        testGameLabel.text = "SOME LOG HERE..."
        self.addChild(testGameLabel)
        

        
        
        
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
        
        fadeInStart()
        
        print("DIDMOVE DONE")

    }
    
    func fadeInStart() {
        let blackSreen = SKSpriteNode(imageNamed: "BlackScreen.png")
        blackSreen.size = CGSize(width: 600, height: 900)
        blackSreen.zPosition = 2950
        self.addChild(blackSreen)
        
        let fade = SKAction.fadeOut(withDuration: 1.5)
        let deletScreen = SKAction.run {
            blackSreen.removeFromParent()
            blackSreen.removeAllChildren()
        }
        let fadeSeq = SKAction.sequence([SKAction.wait(forDuration: 1.4), fade, deletScreen])
        blackSreen.run(fadeSeq)
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
                    spell1.useSpell()
                }
                if touchedNode.name == "Spell2" {
                    spell2.useSpell()
                }
                if touchedNode.name == "Spell3" {
                    spell3.useSpell()
                }
                if touchedNode.name == "Spell4" {
                    spell4.useSpell()
                }
            }
        }
    }

    func presentScene() {
        print("NewScene")
        let secondScene = MovingScreen()
        let transition = SKTransition.crossFade(withDuration: 1.0)
        secondScene.scaleMode = SKSceneScaleMode.aspectFill
        self.scene!.view?.presentScene(secondScene, transition: transition)
    }
    
    override func update(_ currentTime: TimeInterval) {
//        gestureLabel.text = "Gesture: " + String(matchActionGesture)
    }
}
