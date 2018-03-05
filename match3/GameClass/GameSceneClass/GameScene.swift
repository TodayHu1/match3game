
//
//  self.swift
//  match3
//
//  Created by Женя on 24.06.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import SpriteKit
import GameplayKit
import Flurry_iOS_SDK


class GameScene: SKScene {
    
    var gameViewController: GameViewController!
    var matchBoard: MatchParametrs!
    var randomUnit: GeneratRandomUnit!
    var gestureLabel = SKLabelNode(text: "")
    var enemyIndexNow = 0
    var manaLabel: SKCountingLabel = SKCountingLabel(fontNamed: "Arial")
    var manaPoolNode = SKSpriteNode(imageNamed: "")
    
    ///Хранит тип матчей на столе
    var matchTypeOnTable = [[Match]]()
    
    ///Хранит node матчей на столе
    var matchNodeOnTable = [[SKSpriteNode()]]
    
    ///Хранит текстуры матчей
    var matchTexture = [Match: SKTexture]()
    
    var statArr = [[Int]]()
    private var lastTouch = CGPoint(x:1,y:1)
    var player: Player!
    var enemyUnit: EnemyUnit!
    var spell1: Spell!
    var spell2: Spell!
    var spell3: Spell!
    var spell4: Spell!
    var actionOnTurn = [Int](repeating: 0, count: 0 + 1)
    var enemyOnLevelArr = [String]()
    var matchChance: [Int]!
    

    override init() {
        super.init(size: CGSize(width: 375, height: 665))
    }
    
    init(enemyArr: [String], playerSpell: [String], bg: String, size: CGSize) {
        super.init(size: CGSize(width: 375, height: 665))
        
        removeAll()
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)

        self.matchBoard = MatchParametrs(horizontalCount: Int(size.width), verticalCount: Int(size.height), gameScene: self)
        
        self.player = Player(gameScene: self)
        
        self.enemyOnLevelArr = enemyArr
        
        self.randomUnit = GeneratRandomUnit(playerLvl: 1, gameScene: self)
        
        self.initMatchTexture()
        
        self.actionOnTurn = [Int](repeating: 0, count: actionOnTurnCount() + 1)
        
        self.matchTypeOnTable = Array(repeating: Array(repeating: Match.null, count: self.matchBoard.horizontalCount), count: matchBoard.verticalCount)

        self.matchNodeOnTable = Array(repeating: Array(repeating: SKSpriteNode(), count: self.matchBoard.horizontalCount), count: matchBoard.verticalCount)
        
        self.statArr = Array(repeating: Array(repeating: 0, count: self.matchBoard.horizontalCount),
                             count: matchBoard.verticalCount)
        
        self.spell1 = spellBook(skillName: playerSpell[0], spellIndex: 1)
        self.spell2 = spellBook(skillName: playerSpell[1], spellIndex: 2)
        self.spell3 = spellBook(skillName: playerSpell[2], spellIndex: 3)
        self.spell4 = spellBook(skillName: playerSpell[3], spellIndex: 4)
        
        self.addChild(spell1)
        self.addChild(spell2)
        self.addChild(spell3)
        self.addChild(spell4)
        
        buildScene(bgName: bg)
    }
    
    ///Функция удаляющая со сцены Node, Action и Scene
    func removeAll() {
        self.removeAllActions()
        self.removeFromParent()
        self.removeAllChildren()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
    
    func buildScene(bgName: String) {
        ///Spell Board
        let spellBoardA = SKSpriteNode(texture: SKTexture(imageNamed: "Board.png"), size: CGSize(width: 375, height: 80))
        spellBoardA.position = CGPoint(x: 0, y: 80)
        spellBoardA.zPosition = 99
        self.addChild(spellBoardA)
        
        ///Mana Orb
        self.manaPoolNode = SKSpriteNode(texture: SKTexture(imageNamed: "manaBar-1.png"), size: CGSize(width: 64, height: 64))
        spellBoardA.addChild(self.manaPoolNode)
        self.manaPoolNode.zPosition += 1
        
        ///Mana Holder
        let manaHolder = SKSpriteNode(texture: SKTexture(imageNamed: "manaHolder.png"), size: CGSize(width: 65, height: 65))
        manaHolder.zPosition = 101
        manaHolder.zRotation = CGFloat(Int(45)) * .pi / 180
        self.manaPoolNode.addChild(manaHolder)
        
        ///Label for Mana Orb
        manaLabel.zPosition = 10
        manaLabel.position = CGPoint(x: 0, y: 80)
        manaLabel.fontName = "Munro"
        manaLabel.fontSize = 32
        manaLabel.text = String(player.mana)
        manaLabel.verticalAlignmentMode = .center
        manaLabel.horizontalAlignmentMode = .center
        manaLabel.zPosition = 102
        self.addChild(manaLabel)
        
        ///BG
        let bg = SKSpriteNode(texture: SKTexture(imageNamed: bgName+"-0.png"), size: CGSize(width: 375, height: 215))
        bg.position = CGPoint(x: 0, y: 227)
        self.addChild(bg)

        var bgArr = [SKTexture]()
        let bgAtlas = SKTextureAtlas(named: "\(bgName)")
        
        for i in 0...bgAtlas.textureNames.count-1 {
            let name = "\(bgName)" + "-\(i).png"
            bgArr.append(SKTexture(imageNamed: name))
        }
        let bgAction = SKAction.repeatForever(
            SKAction.animate(with: bgArr, timePerFrame: 0.33)
        )
        bg.run(bgAction)
        
        self.backgroundColor = UIColor.darkGray
        
        //MatchBoard
        let matchBoardz = SKSpriteNode(texture: SKTexture(imageNamed: "MatchBoard.png"), size: CGSize(width: 875, height: 875))
        matchBoardz.position = CGPoint(x: 0, y: 0)
        matchBoardz.zPosition = -1
        print("\(matchBoardz.position) -- self.frame.height")
        self.addChild(matchBoardz)
        
        
        //MatchBoard
        let matchBoardx = SKSpriteNode(texture: SKTexture(imageNamed: "MatchBoard.png"), size: CGSize(width: 375, height: 375))
        matchBoardx.position = CGPoint(x: 0, y: 400)
        matchBoardx.zPosition = -1
        print("\(matchBoardx.position) -- self.frame.height")
        self.addChild(matchBoardx)
        
        //MatchBoard
        let matchBoardy = SKSpriteNode(texture: SKTexture(imageNamed: "MatchBoard.png"), size: CGSize(width: 375, height: 375))
        matchBoardy.position = CGPoint(x: 0, y: -400)
        matchBoardy.zPosition = -1
        print("\(matchBoardy.position) -- self.frame.height")
        self.addChild(matchBoardy)
        
        //MatchBoard
        let matchBoard = SKSpriteNode(texture: SKTexture(imageNamed: "MatchBoard.png"), size: CGSize(width: 375, height: 375))
        matchBoard.position = CGPoint(x: 0, y: -145)
        self.addChild(matchBoard)
        
        let matchBoardShadow = SKSpriteNode(texture: SKTexture(imageNamed: "UI_shadow.png"), size: CGSize(width: 375, height: 70))
        matchBoardShadow.anchorPoint.y = 1
        matchBoardShadow.position = CGPoint(x: 0, y: 60)
        matchBoardShadow.zPosition = matchBoard.zPosition + 1
        self.addChild(matchBoardShadow)
        
        //Spell Cell
        for i in 0...3 {
            let spellCellTexture = SKSpriteNode(texture: SKTexture(imageNamed: "skillCell.png"), size: CGSize(width: 55, height: 55))
            spellCellTexture.zPosition = 100
            spellCellTexture.name = "SpellCell - \(i)"
            if i > 1 {
                spellCellTexture.position = CGPoint(x: -140+(70*(i+1)), y: 80)
            }
            else {
                spellCellTexture.position = CGPoint(x: -140+(70*i), y: 80)
            }
            let uiShadow = SKSpriteNode(texture: SKTexture(imageNamed: "UI_shadow.png"), size: CGSize(width: 55, height: 20))
            self.addChild(spellCellTexture)
            uiShadow.position = spellCellTexture.position
            uiShadow.position.y -= 30
            uiShadow.zPosition = 99
            self.addChild(uiShadow)

        }
    }

    override func didMove(to view: SKView) {
        
        self.enemyUnit = self.initNewClassForEnemy(enemyName: self.enemyOnLevelArr[self.enemyIndexNow])

        buildLevel(hardBuild: true)
        checkArrOnAction(loop: loopOnSpawnMatch)

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
        
        switch lvlNowName {
        case "0-1":
            self.gameViewController.presentImageTip(imgName: "SwipeToolTip", title: "Swipe")
        case "0-2":
            self.gameViewController.presentImageTip(imgName: "SkullToolTip", title: "Attack")
        case "0-3":
            self.gameViewController.presentImageTip(imgName: "SkillToolTip", title: "New skill")
        case "0-4":
            self.gameViewController.presentImageTip(imgName: "EnergyToolTip", title: "Energy")
        case "0-5":
            self.gameViewController.presentImageTip(imgName: "CoinAndArmorToolTip", title: "Coins and Armor")
        case "0-6":
            self.gameViewController.presentImageTip(imgName: "SecondSkillToolTip", title: "New skill")
        default:
            break
        }
    }
    
    func fadeInStart() {
        let blackSreen = SKSpriteNode(imageNamed: "BlackScreen.png")
        blackSreen.size = CGSize(width: 600, height: 900)
        blackSreen.zPosition = 2950
        self.addChild(blackSreen)
        
        let fade = SKAction.fadeOut(withDuration: 0.5)
        let deletScreen = SKAction.run {
            blackSreen.removeFromParent()
            blackSreen.removeAllChildren()
        }
        let fadeSeq = SKAction.sequence([SKAction.wait(forDuration: 1.4), fade, deletScreen])
        blackSreen.run(fadeSeq)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
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
        removeAll()
        self.gameViewController.presentScene(scene: movingScreenNow)
    }
    
    func gameOverScreen() {
        Flurry.logEvent("DeathBy", withParameters: ["Lvl": lvlNowName, "Enemy": self.enemyOnLevelArr[self.enemyIndexNow]])
        self.gameViewController.gameOverScreen()
    }
    
    
    override func update(_ currentTime: TimeInterval) {
//        gestureLabel.text = "Gesture: " + String(matchActionGesture)
    }
}
