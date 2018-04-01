//
//  ChangeSpellViewController.swift
//  match3
//
//  Created by Евгений on 10.03.2018.
//  Copyright © 2018 Женя. All rights reserved.
//

import UIKit

class ChangeSpellViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var Spell1: UIButton!
    
    @IBOutlet weak var Spell2: UIButton!
    
    @IBOutlet weak var Spell3: UIButton!
    
    @IBOutlet weak var Spell4: UIButton!
    
    @IBOutlet weak var tableSpell: UITableView!
    
    var gameScene: GameScene!
    
    ///Все способности игрока (на панели и в рюкзаке)
    var allPlayerSpell = [String]()
    
    ///Цвет активной ячейки
    var activeCellColor = #colorLiteral(red: 0.2618263639, green: 0.455000658, blue: 0.5647406409, alpha: 1)
    
    
    @IBAction func backButton(_ sender: Any) {
        UserDefaults.standard.set(levelStorage, forKey: "levelStorage")
        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: playerStat), forKey: "playerStatic")
        UserDefaults.standard.synchronize()
    }
    override func viewDidLoad() {
  
        
        gameScene = GameScene()
        
        allPlayerSpell += playerStat.spellOnBoard
        allPlayerSpell += playerStat.spellInBag
        
        var reworkArr = [String]()
        
        for i in (0...playerStat.spellOnBoard.count-1).reversed() {
            for j in (0...playerStat.spellOnBoard.count-1).reversed() {
                if i != j {
                    if playerStat.spellOnBoard[i] == playerStat.spellOnBoard[j] {
                        playerStat.spellOnBoard[i] = "Null"
                    }
                }
            }
        }
        
        for i in 0...allPlayerSpell.count-1 {
            for j in 0...allPlayerSpell.count-1 {
                if i != j {
                    if allPlayerSpell[i] == allPlayerSpell[j] {
                        allPlayerSpell[i] = "Null"
                    }
                }
            }
        }
        
        for i in 0...allPlayerSpell.count-1 {
            print("\(allPlayerSpell[i]) ---------")
            if allPlayerSpell[i] != "Null" {
                reworkArr.append(allPlayerSpell[i])
            }
        }
        
        tableSpell.separatorStyle = .none
        

        
        allPlayerSpell = reworkArr
        
        
        initBoard()
        
        super.viewDidLoad()
    }
    
    func selectRow(index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        tableSpell.selectRow(at: indexPath, animated: true, scrollPosition: .bottom)
        tableSpell.delegate?.tableView!(tableSpell, didSelectRowAt: indexPath)
    }
    
    func initBoard() {
        var buttonSpellArr = [Spell1, Spell2, Spell3, Spell4]

        for i in 0...3 {
            let skillName = playerStat.spellOnBoard[i]
            buttonSpellArr[i]?.setBackgroundImage(UIImage(named: "Spell\(skillName).png"), for: .normal)
            print("Spell\(skillName).png")
        }
        
        print("\(allPlayerSpell) --- All")
        print("\(playerStat.spellInBag) --- Spell In Bag")
        print("\(playerStat.spellOnBoard) --- Spell On Board")

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cellIdentifier = "cell"
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        let skillName = allPlayerSpell[indexPath.row]
        let skill = gameScene.spellBook(skillName: skillName, spellIndex: 0)
        
        print("\(indexPath.row) --- INDEX PATH ROW")
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 0

        let desc = skill.skillDescription

        let attrString = NSMutableAttributedString(string: desc)
        attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        
        cell.textLabel?.text = "\(skillName)"
        //[ \(skill.healthToUse), \(skill.armorToUse), \(skill.manaToUse), \(skill.coinToUse) ]"
        cell.textLabel?.font = UIFont(name: "Munro", size: 20)
        cell.textLabel?.textColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)

        cell.imageView?.frame = CGRect(x: cell.imageView!.frame.origin.x, y: cell.imageView!.frame.origin.y, width: 40, height: 40)
        cell.imageView?.image = UIImage(named: "Spell\(skillName).png")
        
        cell.detailTextLabel!.numberOfLines = 0
        cell.detailTextLabel?.font = UIFont(name: "MunroSmall", size: 15)
        cell.detailTextLabel?.textColor = .white
        cell.detailTextLabel?.attributedText = setColoredLabel(oldString: attrString)
        
        cell.selectionStyle = .none
        
        cell.backgroundColor = .clear
        

        
        for j in 0...playerStat.spellOnBoard.count-1 {
            if playerStat.spellOnBoard[j] == skillName {
                print("TRUE -- \(skillName) -- \(j)")
                cell.backgroundColor = activeCellColor
                tableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
            }
        }

        
        return cell
    }
    
    func setColoredLabel(oldString: NSMutableAttributedString) -> NSAttributedString {
        oldString.setColorForText("skull", with: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        oldString.setColorForText("skulls", with: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        
        oldString.setColorForText("chain", with: #colorLiteral(red: 0.8039215803, green: 0.7653677631, blue: 0.6309106803, alpha: 1))
        oldString.setColorForText("chains", with: #colorLiteral(red: 0.8039215803, green: 0.7653677631, blue: 0.6309106803, alpha: 1))
        
        oldString.setColorForText("poison", with: #colorLiteral(red: 0.2285714325, green: 0.7444876269, blue: 0.5582090146, alpha: 1))
        oldString.setColorForText("poisons", with: #colorLiteral(red: 0.2285714325, green: 0.7444876269, blue: 0.5582090146, alpha: 1))
        
        oldString.setColorForText("attack", with: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        oldString.setColorForText("attacks", with: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        
        oldString.setColorForText("health", with: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
        
        oldString.setColorForText("shield", with: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        oldString.setColorForText("shields", with: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        oldString.setColorForText("armor", with: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        
        oldString.setColorForText("energy", with: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
        oldString.setColorForText("energies", with: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
        oldString.setColorForText("mana", with: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
        
        oldString.setColorForText("coin", with: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))
        oldString.setColorForText("coins", with: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))
        
        return oldString
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        playerStat.spellInBag.append(playerStat.spellOnBoard[findIndexPlace(arr: playerStat.spellOnBoard, text: String(describing: getRowTitle(cell: cell!)))])
        playerStat.spellOnBoard[findIndexPlace(arr: playerStat.spellOnBoard, text: String(describing: getRowTitle(cell: cell!)))] = "Null"
        initBoard()
        
        cell?.backgroundColor = .clear

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if findFreePlaceInBag() != nil {
            let cell = tableView.cellForRow(at: indexPath)
            
            removeAllWord(text: String(describing: getRowTitle(cell: cell!)))
            
            let index = findIndexPlace(arr: playerStat.spellInBag, text: String(describing: getRowTitle(cell: cell!)))

            playerStat.spellInBag.remove(at: index!)

            playerStat.spellOnBoard[findFreePlaceInBag()] = String(describing: getRowTitle(cell: cell!))
            initBoard()
            
            cell?.backgroundColor = activeCellColor
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPlayerSpell.count
    }
    
    func getRowTitle(cell: UITableViewCell) -> String {
        let text: String = (cell.textLabel?.text)!
        return String(describing: text)
    }
    
    func findFreePlaceInBag() -> Int! {
        for i in 0...playerStat.spellOnBoard.count-1 {
            if playerStat.spellOnBoard[i] == "Null" {
                print("\(i) --- FIND PLACE")
                return i
            }
        }
        print("nil --- FIND PLACE")
        return nil
    }
    
    func findIndexPlace(arr: [String],text: String) -> Int! {
        for i in 0...arr.count-1 {
            if arr[i] == text {
                print("\(i) --- FIND PLACE")
                return i
            }
        }
        print("nil --- FIND PLACE")
        return nil
    }
    
    func removeAllWord(text: String) {
        for i in 0...playerStat.spellOnBoard.count-1 {
            if playerStat.spellOnBoard[i] == text {
                playerStat.spellInBag.append(playerStat.spellOnBoard[i])
                playerStat.spellOnBoard[i] = "Null"
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

}
