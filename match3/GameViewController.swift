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

let enemyA = [["MotherStony","MotherStony"],["Random","Random"]]
var enemyIndexA = 0

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let theView = view as! SKView
        let testScene = MovingScreen()
        let theWelcome = testScene
        theWelcome.scaleMode = SKSceneScaleMode.aspectFit
        
        theView.presentScene( theWelcome )
    }
    
    func presentScene(scene: SKScene) {
        let view = self.view as! SKView
        scene.scaleMode = .aspectFill
        view.ignoresSiblingOrder = true
        view.showsFPS = true
        view.showsNodeCount = true
        view.presentScene(scene)
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
