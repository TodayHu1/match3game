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

    override func viewDidLoad() {
        super.viewDidLoad()
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
//        if (levelStorage[1]["Access"] as! Bool) == true {
//            showAD()
//        }
        print("CHOOSE -")
    }
    
    @IBAction func refreshEnemyButton(_ sender: Any) {
        playerStat = PlayerStat(manaMax: 0, healthMax: 10, armorMax: 5, attack: 1, spellArr: ["Null","Null","Null","Null"])
        lvlDifficulty = 0
    }
    
}
