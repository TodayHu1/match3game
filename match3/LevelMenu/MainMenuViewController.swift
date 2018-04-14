//
//  MainMenuViewController.swift
//  match3
//
//  Created by Евгений on 07.02.2018.
//  Copyright © 2018 Женя. All rights reserved.
//

import UIKit
import GameKit

/* Variables */
var gcEnabled = Bool() // Check if the user has Game Center enabled
var gcDefaultLeaderBoard = String() // Check the default leaderboardID

// IMPORTANT: replace the red string below with your own Leaderboard ID (the one you've set in iTunes Connect)
let LEADERBOARD_ID = "com.bestStage.RuneSwordReborn"

class MainMenuViewController: UIViewController, GKGameCenterControllerDelegate {
    
    @IBOutlet weak var tableButton: UIButton!
    @IBOutlet weak var spellChanger: UIButton!
    @IBOutlet weak var soulStone: UIButton!
    
    @IBOutlet weak var labelForSpellChanger: UILabel!
    @IBOutlet weak var labelForTable: UILabel!
    @IBOutlet weak var labelForSoulStone: UILabel!
    
    @IBOutlet weak var stageButton: UIButton!
    
    @IBOutlet weak var playerImage: UIImageView!
    
    

    @IBOutlet weak var healthNow: UIButton!
    
    @IBOutlet weak var armorNow: UIButton!
    
    @IBOutlet weak var attackNow: UIButton!
    
    @IBOutlet weak var manaNow: UIButton!
    
    @IBOutlet weak var goldNow: UIButton!
    
    @IBAction func startLevelButton(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        
        // Call the GC authentication controller
        authenticateLocalPlayer()
        
        submitScore()
        
        UIApplication.shared.statusBarStyle = .lightContent
        UIApplication.shared.isStatusBarHidden = false
        
        stageButton.layer.cornerRadius = 5
        
        if gameViewController == nil {
            gameViewController = GameViewController()
        }

        if playerStat == nil {
            gameViewController.loadGameProgress()
            updateStageText()
            print("MAIN __ LOAD")
            if playerStat == nil {
                playerStat = PlayerStat(manaMax: 3, healthMax: 30, armorMax: 45, attack: 10, spellArr: ["Null","Null","Null","Null"])
                playerStat.needRevive = false
                gameViewController.saveGameProgress()
                updateStageText()
                print("MAIN __ INIT ON START --\(playerStat.attack) <-> \(playerStat.healthMax)-\(playerStat.healthNow) <-> \(playerStat.armorMax)-\(playerStat.armorNow)")
            }
        }
        else {
            if playerStat.needRevive == true {
                playerStat.needRevive = false
                playerStat = PlayerStat(manaMax: 3, healthMax: 30, armorMax: 45, attack: 10, spellArr: ["Null","Null","Null","Null"])
                lvlDifficulty = 1
                print("MAIN __ REVIVE --\(playerStat.attack) <-> \(playerStat.healthMax)-\(playerStat.healthNow) <-> \(playerStat.armorMax)-\(playerStat.armorNow)")
                updateStageText()
                gameViewController.saveGameProgress()
            }
            else {
                gameViewController.saveGameProgress()
                updateStageText()
                print("MAIN __ ALREADY PLAY --\(playerStat.attack) <-> \(playerStat.healthMax)-\(playerStat.healthNow) <-> \(playerStat.armorMax)-\(playerStat.armorNow)")
            }
        }
        
        
        healthNow.setTitle(String(playerStat.healthNow), for: .normal)
        armorNow.setTitle(String(playerStat.armorNow), for: .normal)
        attackNow.setTitle(String(playerStat.attack), for: .normal)
        manaNow.setTitle(String(playerStat.manaNow), for: .normal)
        goldNow.setTitle(String(playerStat.gold), for: .normal)

        UILabel.animate(withDuration: 1, animations: {
            self.labelForTable.frame.size.width += 10
            self.labelForTable.frame.size.height += 10

            self.labelForSoulStone.frame.size.width += 10
            self.labelForSoulStone.frame.size.height += 10
            
            self.labelForSpellChanger.frame.size.width += 10
            self.labelForSpellChanger.frame.size.height += 10

        }) { _ in
            UIView.animate(withDuration: 1, delay: 0.25, options: [.autoreverse, .repeat], animations: {
                self.labelForTable.frame.origin.y -= 10
                
                self.labelForSoulStone.frame.origin.y -= 10
                
                self.labelForSpellChanger.frame.origin.y -= 10
            })
        }
        
        var soulStoneImageArr = [UIImage]()
        var spellChangerImageArr = [UIImage]()
        var playerImageArr = [UIImage]()
        
        for i in 0...3 {
            playerImageArr.append(UIImage(named: "Player-Stand-\(i).png")!)
            spellChangerImageArr.append(UIImage(named: "SpellChanger-\(i).png")!)
            soulStoneImageArr.append(UIImage(named: "SoulStone-\(i).png")!)
        }
        
        playerImage.animationImages = playerImageArr
        playerImage.animationDuration = 1
        playerImage.startAnimating()
        
        
        soulStone.setImage(UIImage(named: "SoulStone-0.png"), for: .normal)
        soulStone.imageView?.animationImages = soulStoneImageArr
        soulStone.imageView?.animationDuration = 1.7
        soulStone.imageView?.startAnimating()
        
        
        spellChanger.setImage(UIImage(named: "SpellChanger-0.png"), for: .normal)
        spellChanger.imageView?.animationImages = spellChangerImageArr
        spellChanger.imageView?.animationDuration = 1.5
        spellChanger.imageView?.startAnimating()
        
        
        print("START ANIMATION")
        
        super.viewDidLoad()
    }
    
    func updateStageText() {
        stageButton.setTitle(String(lvlDifficulty), for: .normal)
    }


    @IBAction func GameCenter(_ sender: Any) {
        let gcVC = GKGameCenterViewController()
        gcVC.gameCenterDelegate = self
        gcVC.viewState = .leaderboards
        gcVC.leaderboardIdentifier = LEADERBOARD_ID
        present(gcVC, animated: true, completion: nil)
    }
    

}


extension MainMenuViewController {
    
    // MARK: - AUTHENTICATE LOCAL PLAYER
    func authenticateLocalPlayer() {
        let localPlayer: GKLocalPlayer = GKLocalPlayer.localPlayer()
        
        localPlayer.authenticateHandler = {(ViewController, error) -> Void in
            if((ViewController) != nil) {
                // 1. Show login if player is not logged in
                self.present(ViewController!, animated: true, completion: nil)
            } else if (localPlayer.isAuthenticated) {
                // 2. Player is already authenticated & logged in, load game center
                gcEnabled = true
                
                // Get the default leaderboard ID
                localPlayer.loadDefaultLeaderboardIdentifier(completionHandler: { (leaderboardIdentifer, error) in
                    if error != nil { print(error!)
                    } else { gcDefaultLeaderBoard = leaderboardIdentifer! }
                })
                
            } else {
                // 3. Game center is not enabled on the users device
                gcEnabled = false
                print("GC Local player could not be authenticated!")
                print("GC" + "\(String(describing: error))")
            }
        }
    }
    
    func submitScore() {
        // Submit score to GC leaderboard
        let bestScoreInt = GKScore(leaderboardIdentifier: LEADERBOARD_ID)
        bestScoreInt.value = Int64(lvlDifficulty)
        GKScore.report([bestScoreInt]) { (error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                print("GC Best Score submitted to your Leaderboard!")
            }
        }
    }
    
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }
}
