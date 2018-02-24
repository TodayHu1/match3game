//
//  MainMenuViewController.swift
//  match3
//
//  Created by Евгений on 07.02.2018.
//  Copyright © 2018 Женя. All rights reserved.
//

import UIKit

var playerStat: PlayerStat!
var gameViewController: GameViewController!

class MainMenuViewController: UIViewController {
    
    

    override func viewDidLoad() {
        
        if gameViewController == nil {
            gameViewController = GameViewController()
        }
        
        if playerStat == nil {
            print("////// PLAYER INIT LOAD ////////")
            gameViewController.loadGameProgress()
            if playerStat == nil {
                playerStat = PlayerStat(mana: 0, health: 10, armor: 5, gold: 0, attack: 1, spellArr: ["Null","Null","Null","Null"])
                print("++++ PLAYER INIT BASIC ++++")
            }
        }
        else {
            print("---- PLAYER ALREADY INIT ----")
        }
        print(playerStat)
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func test(_ sender: Any) {
        print("Go")
        let btn = UIButton()
        btn.backgroundColor = UIColor.darkGray
        
        let view = UIView(frame: CGRect.init(x: 20, y: 20, width: 50, height: 50))
        view.frame.origin = CGPoint(x: 30, y: 30)
        
        view.addSubview(btn)
        
        self.view.addSubview(view)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
