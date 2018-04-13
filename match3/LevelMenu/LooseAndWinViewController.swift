//
//  LooseAndWinViewController.swift
//  match3
//
//  Created by Евгений on 24.02.2018.
//  Copyright © 2018 Женя. All rights reserved.
//


import UIKit
import GoogleMobileAds

class LooseAndWinViewController: UIViewController {
    
    var gameVC: GameViewController!

    var playerStatOnDie: PlayerStat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("\(lvlDifficulty) --- \(playerStat.healthNow) -- DIF")
        
        if playerStat.healthNow < 0 {
            playerStatOnDie = playerStat
            playerStat = PlayerStat(manaMax: 3, healthMax: 30, armorMax: 45, attack: 10, spellArr: ["Null","Null","Null","Null"])
            print("\(playerStat.gold) --- \(lvlDifficulty) --- LOOSE AND WIN")
            lvlDifficulty = 0
            gameViewController.saveGameProgress()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ///Функция для вызова рекламного блока
    func showAD() {
        if ad.isReady {
            print("Ad ready")
            ad.present(fromRootViewController: topMostController())
        } else {
            print("Ad wasn't ready")
        }
    }
    
    ///Функция скрывающая Status Bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    ///Возвращает самый верхний View из иерархии
    func topMostController() -> UIViewController {
        var topController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
        while (topController.presentedViewController != nil) {
            topController = topController.presentedViewController!
        }
        return topController
    }
    

    override func viewWillAppear(_ animated: Bool) {

    }
    
    @IBAction func refreshEnemyButton(_ sender: Any) {

    }
    
}
