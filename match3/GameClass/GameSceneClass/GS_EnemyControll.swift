//
//  GS_EnemyControll.swift
//  match3
//
//  Created by Женя on 19.09.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import SceneKit
import SpriteKit
import GameplayKit




extension GameScene {
    
    public func actionGesture(gesture: Bool) {
        matchActionGesture = gesture
//        testGameLabel.text = ""
    }
    
    public func newEnemy() {
        if self.enemyIndexNow < self.enemyOnLevelArr.count-1 {
            let moveOut = SKAction.move(to: CGPoint(x: 400, y: 140), duration: 0.5)
            let reverse = SKAction.scaleX(to: -0.3, duration: 0.3)
            let pulse = SKAction.fadeIn(withDuration: 10)
            let newEnemy = SKAction.run {
                self.enemyUnit.removeFromParent()
                self.enemyUnit.removeAllChildren()
                
                self.enemyIndexNow+=1
                self.enemyUnit = self.initNewClassForEnemy(enemyName: self.enemyOnLevelArr[self.enemyIndexNow])

                self.addChild(self.enemyUnit)
                
                self.enemyUnit.run(pulse)
                _ = self.enemyUnit.animationStand()
                self.updateEnemyCount()
                self.boardSizeChange()
                soulGem += 1
            }
            let gestureTrue = SKAction.run {
                self.actionGesture(gesture: true)
            }
            let gestureFalse = SKAction.run {
                self.actionGesture(gesture: false)
            }
            enemyUnit.run(SKAction.sequence([gestureFalse, reverse, moveOut, newEnemy, gestureTrue]))

        }
        else {
            enemyUnit.removeFromParent()
            enemyUnit.removeAllChildren()
            
            indexLevel+=1
            
            let waitScene = SKAction.wait(forDuration: 0.8)
            let scene = SKAction.run {
                self.presentScene()
            }
            let seq = SKAction.sequence([waitScene, scene])
            self.run(seq)

        }
    }
    
    
    public func checkArrForAction() {
        for i in 0...actionOnTurn.count-1 {
            if actionOnTurn[i] > 0 {
                switch i {
                    case Match.skull.rawValue:
                        let damage = Int((enemyUnit.attack * actionOnTurn[Match.skull.rawValue]) / 3)

                        enemyUnit.fullAttackStandAnimation(damage: damage)
                    
                    
                    case Match.armor.rawValue:
                        player.armor += actionOnTurn[Match.armor.rawValue] * 2
                        positiveWords(number: actionOnTurn[Match.armor.rawValue])
                    
                    
                    case Match.energy.rawValue:
                        player.mana += actionOnTurn[Match.energy.rawValue]
                        positiveWords(number: actionOnTurn[Match.energy.rawValue])
                    
                    
                    case Match.attack.rawValue:
                        actionGesture(gesture: false)
                        let wait = SKAction.sequence([SKAction.wait(forDuration: 2.0), SKAction.run {
                            self.actionGesture(gesture: true)
                            }])
                        self.run(wait)
                        var damag = Int((player.attack * actionOnTurn[Match.attack.rawValue]) / 3)
                        if actionOnTurn[Match.attack.rawValue] > 3 {
                            damag += Int((actionOnTurn[Match.attack.rawValue] - 3) * (player.attack/4))
                            player.fullAttackStandAnimation(damage: damag, attackType: .strong)
                        }
                        else {
                            player.fullAttackStandAnimation(damage: damag, attackType: .basic)
                        }
                        positiveWords(number: actionOnTurn[Match.attack.rawValue])

                    
                    case Match.coin.rawValue:
                        player.gold += actionOnTurn[Match.coin.rawValue]
                        self.updatePlayerGold()
            
                    
                    case Match.poison.rawValue:
                        let damage = actionOnTurn[Match.poison.rawValue] * 6
                        player.health -= damage
                        self.sceneShake(shakeCount: 5, intensity: CGVector(dx: 5, dy: 5), shakeDuration: 0.1)
                        player.updateLabelOverHead()
                    
                    
                    case Match.cog.rawValue:
                        enemyUnit.armor += 25
                    
                    
                    default: break
                }
            }
        }
        print("actionOnTurn \(actionOnTurn)")
        for i in 0...actionOnTurn.count-1 {
            actionOnTurn[i] = 0
        }
    }
    

    
    func positiveWords(number: Int) {
        switch number {
        case 4:
            self.gameViewController.presentText(text: "Good", color: .white)
        case 5:
            self.gameViewController.presentText(text: "Excellent!", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        case 6:
            self.gameViewController.presentText(text: "Fantastic!", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1) )
        case 7..<15:
            self.gameViewController.presentText(text: "Incredibly!", color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))
        default:
            break
        }
    }
}
