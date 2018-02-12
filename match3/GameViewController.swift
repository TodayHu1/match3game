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
var indexLevel = 0


var levelStorage = [
    ["Name": "Tutorial",
     "LvlNow": 1,
     "LvlMax": 5,
     "Access": true
    ]
]



class GameViewController: UIViewController {
    
    var lvlName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lvlName = "0-1"
        
        print(levelStorage[0]["lvlNow"])
        
        guard let dictionary = Dictionary<String, AnyObject>.loadJSONFromBundle(filename: lvlName) else { return }

        loadEnemy = dictionary["Enemy"] as! [[String]]
        loadBg = dictionary["Bg"] as! [String]
        loadBoardSize = dictionary["BoardSize"] as! [[Int]]
        

        let scene = MovingScreen()
        scene.gameViewController = self
        scene.lvlName = lvlName
        presentScene(scene: scene)
        
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
