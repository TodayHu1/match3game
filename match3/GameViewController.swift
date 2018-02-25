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

var loadEnemy: [[String]]!
var loadBg: [String]!
var loadBoardSize: [[Int]]!
var loadMatchChance: [Int]!
var indexLevel = 0
var lvlNowName: String!
var lvlOnReady = 0
var movingScreenNow: MovingScreen!
var ad: GADInterstitial!

//ca-app-pub-2270286479492772~6057888883

//ca-app-pub-2270286479492772~6057888883

//ca-app-pub-2270286479492772/5263681969

var levelStorage = [
    ["Name": "Tutorial",
     "LvlNow": 1,
     "LvlMax": 6,
     "Access": true
    ],
    ["Name": "SteamPunk",
     "LvlNow": 1,
     "LvlMax": 10,
     "Access": false
    ],
    ["Name": "RandomDungeon",
     "LvlNow": 1,
     "LvlMax": 0,
     "Access": false
    ]
]



class GameViewController: UIViewController {
    
    var lvlName: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ad = GADInterstitial(adUnitID: "ca-app-pub-2270286479492772/5263681969")
        let request = GADRequest()
        ad.load(request)
        
        indexLevel = 0
        
        guard let dictionary = Dictionary<String, AnyObject>.loadJSONFromBundle(filename: lvlName) else { return }

        lvlNowName = lvlName
        
        loadEnemy = dictionary["Enemy"] as! [[String]]
        loadBg = dictionary["Bg"] as! [String]
        loadMatchChance = dictionary["MatchChance"] as! [Int]
        loadBoardSize = dictionary["BoardSize"] as! [[Int]]
        

        movingScreenNow = MovingScreen()
        movingScreenNow.gameViewController = self
        movingScreenNow.lvlName = lvlName
        presentScene(scene: movingScreenNow)
        
    }
    
    
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
        

        
        UIView.animate(withDuration: 1, delay: 0.25, animations: {
            viewx.center.x = self.view.center.x
            viewx.center.y = self.view.center.y - 20
        }) { _ in
            UIView.animate(withDuration: 0.5, animations: {
                viewx.center.y = self.view.center.y + 20
            })
        }
        
    }
    
    
    func imageTipAction(sender: UIButton){
        let subViews = self.view.subviews
        for subview in subViews{
            if subview.tag == 252 {
                subview.removeFromSuperview()
            }
        }
    }

    
    func saveGameProgress() {
        UserDefaults.standard.set(levelStorage, forKey: "levelStorage")
//        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: playerStat), forKey: "playerStat")
        
        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: playerStat), forKey: "playerStat")
        UserDefaults.standard.synchronize()
        
        print("SAVE DONE")
        
    }
    
    func loadGameProgress() {
        
        if UserDefaults.standard.object(forKey: "levelStorage") as? [[String : Any]] != nil {
            levelStorage = UserDefaults.standard.object(forKey: "levelStorage") as! [[String : Any]]
        }
        
        if let heroObject = UserDefaults.standard.value(forKey: "playerStat") as? NSData {
            playerStat = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! PlayerStat
        }
        
        UserDefaults.standard.removeObject(forKey: "levelStorage")
        
    }
    
        
    func gameOverScreen() {
        goToView(id: "GameOverScreen")
    }
    
    func victoryScreen() {
        saveGameProgress()
        goToView(id: "VictoryScreen")
    }
    
    func goToView(id: String) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: id)
        self.present(newViewController, animated: true, completion: nil)
    }
    
    
    func presentScene(scene: SKScene) {
        let sceneView = SKView()
        self.view = sceneView
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
    
}
