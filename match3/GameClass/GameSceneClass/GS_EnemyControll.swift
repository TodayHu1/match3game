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
                self.enemyUnit.animationStand()
                
                self.boardSizeChange()
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
                        enemyUnit.fullAttackStandAnimation(damage: enemyUnit.attack * actionOnTurn[Match.skull.rawValue])
                    case Match.armor.rawValue:
                        player.armor += actionOnTurn[Match.armor.rawValue] * 5
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
                        let damag = player.attack * actionOnTurn[Match.attack.rawValue]
                        var strongAttack = false
                        if actionOnTurn[Match.attack.rawValue] > 3 {
                            strongAttack = true
                            player.mana += Int(actionOnTurn[Match.attack.rawValue]/2)
                            changeManaLabel()
                        }
                        else {
                            strongAttack = false
                        }
                        positiveWords(number: actionOnTurn[Match.attack.rawValue])
                        player.fullAttackStandAnimation(damage: damag, strongAttack: strongAttack)
                    case Match.coin.rawValue:
                        playerStat.gold += actionOnTurn[Match.coin.rawValue]
                    case Match.poison.rawValue:
                        player.health -= actionOnTurn[Match.poison.rawValue]
                    case Match.cog.rawValue:
                        enemyUnit.armor += 25
                    default: break
                }
            }
        }
        for i in 0...actionOnTurn.count-1 {
            actionOnTurn[i] = 0
        }


        

    }
    
//    public func checkArrForAction() {
//        for i in 0...actionOnTurn.count-1 {
//            if actionOnTurn[i] > 0 {
//                switch i {
//                case Match.skull.rawValue:
//                    actionArr["Action": SKAction].ape = enemyUnit.animationAttack()
//                    break
//                case Match.armor.rawValue: break
//                case Match.energy.rawValue: break
//                case Match.attack.rawValue:
//                    var strongAttack = false
//                    if actionOnTurn[Match.attack.rawValue] > 3 {
//                        strongAttack = true
//                        player.mana += Int(actionOnTurn[Match.attack.rawValue]/2)
//                        changeManaLabel()
//                    }
//                    else {
//                        strongAttack = false
//                    }
//                    actionArr[i] = player.animationAttack(strongAttack: strongAttack)
//                    break
//                case Match.poison.rawValue: break
//                case Match.cog.rawValue: break
//                default: break
//                }
//            }
//        }
//
//
//        for i in 0...actionOnTurn.count-1 {
//            actionOnTurn[i] = 0
//        }
//    }
    

    
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
