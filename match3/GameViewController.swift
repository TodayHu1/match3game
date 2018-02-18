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

var loadEnemy: [[String]]!
var loadBg: [String]!
var loadBoardSize: [[Int]]!
var loadMatchChance: [Int]!
var indexLevel = 0

var lvlOnReady = 0


var levelStorage = [
    ["Name": "Tutorial",
     "LvlNow": 1,
     "LvlMax": 5,
     "Access": true
    ],
    ["Name": "SteamPunk",
     "LvlNow": 1,
     "LvlMax": 10,
     "Access": true
    ],
    ["Name": "RandomDungeon",
     "LvlNow": 1,
     "LvlMax": 0,
     "Access": true
    ]
    
]



class GameViewController: UIViewController {
    
    var lvlName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        indexLevel = 0
        
        guard let dictionary = Dictionary<String, AnyObject>.loadJSONFromBundle(filename: lvlName) else { return }

        loadEnemy = dictionary["Enemy"] as! [[String]]
        loadBg = dictionary["Bg"] as! [String]
        loadMatchChance = dictionary["MatchChance"] as! [Int]
        loadBoardSize = dictionary["BoardSize"] as! [[Int]]
        

        let scene = MovingScreen()
        scene.gameViewController = self
        scene.lvlName = lvlName
        presentScene(scene: scene)
        
    }
    
    
    func presentImageTip(imgName: String, title: String) {

        let frameWidth = 320
        let frameHeight = 450
        
        let viewx = UIView()
        viewx.frame = CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight)
        viewx.center = self.view.center
        viewx.tag = 252
        
        
        let testView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        testView.frame = CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight)
        testView.layer.cornerRadius = 20
        testView.clipsToBounds = true
    
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 25, y: frameHeight - 80, width: frameWidth - 50, height: 60)
        button.backgroundColor = UIColor.darkGray
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action:#selector(imageTipAction), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.tintColor = UIColor.white
        button.titleLabel?.font = UIFont(name: "Munro", size: 25)

        
        let image = UIImageView()
        image.frame = CGRect(x: 25, y: 80, width: frameWidth - 50, height: 270)
        image.image = UIImage(named: imgName)
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        
        
        let label = UILabel()
        label.frame = CGRect(x: 25, y: 25, width: frameWidth - 50, height: 40)
        label.text = title
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont(name: "Munro", size: 40)
        
        
        viewx.addSubview(testView)
        viewx.addSubview(image)
        viewx.addSubview(button)
        viewx.addSubview(label)
        
        self.view.addSubview(viewx)
        
    }
    
    
    func imageTipAction(sender: UIButton){
        let subViews = self.view.subviews
        for subview in subViews{
            if subview.tag == 252 {
                subview.removeFromSuperview()
            }
        }
    }
    
    
    func presentMenu() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MainMenuViewController") as! MainMenuViewController
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
