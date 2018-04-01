//
//  GameViewController.swift
//  match3
//
//  Created by Женя on 24.06.17.
//  Copyright © 2017 Женя. All rights reserved.
//


import UIKit
import SpriteKit
import GameplayKit
import GoogleMobileAds

///Враги на уровне
var loadEnemy: [[String]]!

///Задний фон на уровне
var loadBg: [String]!

///Размер стола на уровне
var loadBoardSize: [[Int]]!

/// Шанс выпадения матчей на уровне.
///
/// Значения индексов:
/// - Череп
/// - Броня
/// - Мана
/// - Атака
/// - Голда
var loadMatchChance: [Int]!

///
var indexLevel = 0

///Уровень сложности
var lvlDifficulty = 0

///
var lvlOnReady = 0

///
var movingScreenNow: MovingScreen!

///Переменная для рекламы
var ad: GADInterstitial!

///Переменная обозначающая как будет показан уровень
var scaleMode = SKSceneScaleMode.resizeFill

///Распознование свайпов игрока
var matchActionGesture = true

///Появление собирающихся матчей после генерации
var loopOnSpawnMatch = false

///Увеличение доски после победы над врагом
var boardSizeUp = false

///Параметры игрока (сохраняемый класс)
var playerStat: PlayerStat!

///Глобальный класс вью контроллер
var gameViewController: GameViewController!

///Пройденные уровни (сохраняемый класс)
var levelStorage = [[String: Any]]()

///Статы героя при старте
let playerStatOnInit = PlayerStat(manaMax: 0, healthMax: 100, armorMax: 50, attack: 10, spellArr: ["Null","Null","Null","Null"])

class GameViewController: UIViewController {
    
    var lvlName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            print("Its phone")
            switch UIScreen.main.nativeBounds.height {
            case 2436:
                scaleMode = .resizeFill
                print("Its phone X")
            default:
                scaleMode = .aspectFit
                print("Its phone 5s/6/7/8")
            }
        case .pad:
            print("Its pad")
            scaleMode = .aspectFit
        case .unspecified:
            print("Its unspecified")
        case .tv:
            print("Its tv")
        case .carPlay:
            print("Its carPlay")
        }
        
        ad = GADInterstitial(adUnitID: "ca-app-pub-2270286479492772/5263681969")
        let request = GADRequest()
        ad.load(request)

        indexLevel = 0
        
//        guard let dictionary = Dictionary<String, AnyObject>.loadJSONFromBundle(filename: lvlName) else { return }
//
//
//        loadEnemy = dictionary["Enemy"] as! [[String]]
//        loadBg = dictionary["Bg"] as! [String]
//        loadMatchChance = dictionary["MatchChance"] as! [Int]
//        loadBoardSize = dictionary["BoardSize"] as! [[Int]]

        initLevel()
        
        movingScreenNow = MovingScreen()
        movingScreenNow.gameViewController = self
        presentScene(scene: movingScreenNow)
        
    }
    
    func isHiddenStatusBar() -> Bool {
        var isHiddenstatusBarVal = true
        
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 2436:
                isHiddenstatusBarVal = false
            default:
                isHiddenstatusBarVal = true
            }
        }
        
        return isHiddenstatusBarVal
    }
    
    override var prefersStatusBarHidden: Bool {
        return isHiddenStatusBar()
    }
    
    enum UIUserInterfaceIdiom : Int {
        case unspecified
        case phone // iPhone and iPod touch style UI
        case pad // iPad style UI
    }
    
    ///Показать окно с лейблом
    func presentText(text: String, color: UIColor) {
        
        let frameWidth = 200
        let frameHeight = 60
        
        let viewx = UIView()
        viewx.frame = CGRect(x: Int(self.view.center.x) - (frameWidth/2), y: Int(self.view.frame.height), width: frameWidth, height: frameHeight)
        viewx.tag = 341
        
        
        let testView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        testView.frame = CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight)
        testView.layer.cornerRadius = 10
        testView.clipsToBounds = true
        
        
        let label = UILabel()
        label.frame = CGRect(x: 25, y: 10, width: frameWidth - 50, height: 40)
        label.text = text
        label.textColor = color
        label.textAlignment = .center
//        label.shadowColor = .white
//        label.shadowOffset.height = 1
        label.font = UIFont(name: "Munro", size: 30)
        
        
        viewx.addSubview(testView)
        viewx.addSubview(label)
        
        self.view.addSubview(viewx)
        
        
        UIView.animate(withDuration: 1, delay: 0.25, animations: {
            viewx.center.x = self.view.center.x
            viewx.center.y = self.view.center.y
        }) { _ in
            UIView.animate(withDuration: 1, animations: {
                viewx.center.y += 20
            }) { _ in
                UIView.animate(withDuration: 1, animations: {
                    viewx.alpha = 0
                }) {_ in
                    UIView.animate(withDuration: 0.1, animations: {
                        self.removeSubViewByTag(tag: 341)
                    })
                }
            }
        }
        

        
        print("presentText")
    }
    
    ///Показать окно с выбором перка
    func presentChooseWindow() {
        
        print("CHOOSE")
        
        let frameWidth = 200
        let frameHeight = 60
        
        let viewx = UIView()
        viewx.frame = CGRect(x: Int(self.view.center.x) - (frameWidth/2), y: Int(self.view.frame.height), width: frameWidth, height: frameHeight)
//        viewx.tag = 341
        
        
        let testView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        testView.frame = CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight)
        testView.layer.cornerRadius = 10
        testView.clipsToBounds = true
        
        
        let label = UILabel()
        label.frame = CGRect(x: 25, y: 10, width: frameWidth - 50, height: 40)
        label.text = "ДАРОВА"
        label.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        label.textAlignment = .center
        //        label.shadowColor = .white
        //        label.shadowOffset.height = 1
        label.font = UIFont(name: "Munro", size: 30)
        
        
        viewx.addSubview(testView)
        viewx.addSubview(label)
        
        self.view.addSubview(viewx)
        
        
        UIView.animate(withDuration: 1, delay: 0.25, animations: {
            viewx.center.x = self.view.center.x
            viewx.center.y = self.view.center.y
        }) { _ in
            UIView.animate(withDuration: 1, animations: {
                viewx.center.y += 20
            }) { _ in
                UIView.animate(withDuration: 1, animations: {
                    viewx.alpha = 0
                }) {_ in
                    UIView.animate(withDuration: 0.1, animations: {
//                        self.removeSubViewByTag(tag: 341)
                    })
                }
            }
        }
        
        
        
    }
    
    ///Показать окно подсказки с картинкой
    func presentImageTip(imgName: String, title: String) {

        let frameWidth = 320
        let frameHeight = 475
        
        let viewx = UIView()
        viewx.frame = CGRect(x: Int(self.view.center.x) - (frameWidth/2), y: Int(self.view.frame.height), width: frameWidth, height: frameHeight)
        viewx.tag = 252
        
        
        let testView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        testView.frame = CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight)
        testView.layer.cornerRadius = 20
        testView.clipsToBounds = true
    
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 15, y: frameHeight - 80, width: frameWidth - 30, height: 60)
        button.backgroundColor = UIColor.darkGray
        button.setTitle("Ok", for: .normal)
        button.addTarget(self, action:#selector(imageTipAction), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.tintColor = UIColor.white
        button.titleLabel?.font = UIFont(name: "Munro", size: 25)

        
        let image = UIImageView()
        image.frame = CGRect(x: 15, y: 60, width: frameWidth - 30, height: 320)
        image.image = UIImage(named: imgName)
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        
        
        let label = UILabel()
        label.frame = CGRect(x: 25, y: 12, width: frameWidth - 50, height: 40)
        label.text = title
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont(name: "Munro", size: 40)
        
        
        viewx.addSubview(testView)
        viewx.addSubview(image)
        viewx.addSubview(button)
        viewx.addSubview(label)
        
        self.view.addSubview(viewx)
        

        
        UIView.animate(withDuration: 1, delay: 1.75, animations: {
            viewx.center.x = self.view.center.x
            viewx.center.y = self.view.center.y - 20
        }) { _ in
            UIView.animate(withDuration: 0.5, animations: {
                viewx.center.y = self.view.center.y + 20
            })
        }
        
    }
    
    
    func imageTipAction(sender: UIButton){
        self.removeSubViewByTag(tag: 252)
    }
    
    ///Функция удаляющая subView по тэгу
    func removeSubViewByTag(tag: Int) {
        let subViews = self.view.subviews
        for subview in subViews{
            if subview.tag == tag {
                subview.removeFromSuperview()
            }
        }
    }
    
    func saveGameProgress() {
        UserDefaults.standard.set(levelStorage, forKey: "levelStorage")
        UserDefaults.standard.set(lvlDifficulty, forKey: "difficulty")
        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: playerStat), forKey: "playerStatic")
        UserDefaults.standard.synchronize()
    }
    
    func loadGameProgress() {
        
        if UserDefaults.standard.object(forKey: "difficulty") as? Int != nil {
            lvlDifficulty = UserDefaults.standard.object(forKey: "difficulty") as! Int
        }
        
        if UserDefaults.standard.object(forKey: "levelStorage") as? [[String : Any]] != nil {
            levelStorage = UserDefaults.standard.object(forKey: "levelStorage") as! [[String : Any]]
        }
        
        if let heroObject = UserDefaults.standard.value(forKey: "playerStatic") as? NSData {
            playerStat = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! PlayerStat
        }
        
//        UserDefaults.standard.removeObject(forKey: "levelStorage")
//        UserDefaults.standard.removeObject(forKey: "playerStatic")
//        UserDefaults.standard.removeObject(forKey: "difficulty")
    }
    
    func gameOverScreen() {
        goToView(id: "GameOverScreen")
    }
    
    func victoryScreen() {
        saveGameProgress()
        goToView(id: "VictoryScreen")
    }
    
    func goToView(id: String) {
        if let storyboard = storyboard {
            print(storyboard)
            let toMainMenu = storyboard.instantiateViewController(withIdentifier: id) as! LooseAndWinViewController
            navigationController?.pushViewController(toMainMenu, animated: false)

        }
    }
    
    
    func presentScene(scene: SKScene) {
        let sceneView = SKView()
        self.view = sceneView
        
        sceneView.showsFPS = true
        sceneView.showsDrawCount = true
        sceneView.showsNodeCount = true
        
        scene.scaleMode = scaleMode
        sceneView.presentScene(scene)
    }


    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    ///Веса для врагов
    let enemyDifficultyArr = [
        [1, "Stony"],
        [3, "StoneScale"],
        [5, "SteamPunkPunch"],
        [6, "RoyalMage"],
        [8, "SteamPunkFlameThrower"],
        [10, "NeutralTurtle"],
        [13, "CultistsProphet"],
        [15, "SteamPunkGuard"],
        [30, "SteamPunkWalker"],
    ]
    
    ///Инициализация игрового уровня (враги бг шансМатча размерБорда)
    func initLevel() {
        lvlDifficulty += 1
        
        loadEnemy = [[]]
        
        var lvlForLoop = lvlDifficulty * 2

        while lvlForLoop > 0  {
            let difficultyIndex = Int(arc4random_uniform(UInt32(enemyDifficultyArr.count-1)))
            let difficultyUnitNow: Int = enemyDifficultyArr[difficultyIndex][0] as! Int
            if lvlForLoop >= difficultyUnitNow {
                loadEnemy[0].append(self.enemyDifficultyArr[difficultyIndex][1] as! String)
                lvlForLoop -= difficultyUnitNow
            }
            if loadEnemy[0].count > 4 {
                loadEnemy[0] = []
                lvlForLoop = lvlDifficulty
            }
        }

        
        loadBg = [""]
        print("\(loadEnemy) --- ENEMY ON LEVEL ---- \(lvlDifficulty) --- DIF")
        loadMatchChance = [35,15,10,35,5]
        loadBoardSize = [[0,0]]
    }
    
}
