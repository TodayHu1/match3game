//
//  SelectPerkViewController.swift
//  match3
//
//  Created by Евгений on 21.03.2018.
//  Copyright © 2018 Женя. All rights reserved.
//

import UIKit

class SelectItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    ///Количество предметов для выбора игроком
    var countOfSelectedItem = Int(arc4random_uniform(2)) + 4
    
    ///Выбранный итем
    var selectedItem = -1
    
    ///Массив для всех итемов
    var allItem = [Item]()
    
    ///Массив для выбора итемов игроком
    var itemOnBoard = [Item]()
    
    ///Цвет активной ячейки
    var activeCellColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
    
    ///Тип сундука
    var chestType: ChestType!
    
    ///Таблица
    @IBOutlet weak var tableView: UITableView!
    
    ///Кнопка выбора предмета (объект)
    @IBOutlet weak var getItemButtomObject: UIButton!
    
    ///Кнопка выбора предмета (действие)
    @IBAction func getItemButton(_ sender: Any) {
        
    ///Выбранный предмет
    let item = itemOnBoard[selectedItem]
        
    switch item.type {
        case .item:
            playerStat.attack += item.attack
            
            playerStat.healthMax += item.health
            playerStat.healthNow += item.health
            
            playerStat.armorMax += item.armor
            playerStat.armorNow += item.armor
            
            playerStat.manaMax += item.mana
            playerStat.manaNow += item.mana
        case .spell:
            playerStat.addSpell(newSpell: item.spellName)
        case .legendary:
            var newName = item.name
            newName = newName.replacingOccurrences(of: "[Legendary] ", with: "")
            playerStat.legendArr.append(newName)
            playerStat.legendArr = playerStat.legendArr.removeDuplicates()
            print("SA \(playerStat.legendArr)")
        default:
            break
        }
    }
    
    ///Перки с броней
    let armorArr = [
        Item.init(armor: 25, health: -10, attack: 0, mana: 0, img: "RedShield", name: "Blood Armor"),
        Item.init(armor: 15, health: 0, attack: 0, mana: 0, img: "BlueShield", name: "Armor pack"),
        Item.init(armor: 20, health: 0, attack: 0, mana: -3, img: "PurpleShield", name: "Mana shield"),
        Item.init(armor: 10, health: 0, attack: 2, mana: 0, img: "BlackShield", name: "Barbarian armor armor"),
        Item.init(armor: 10, health: 5, attack: 0, mana: 0, img: "WhiteShield", name: "Diviny armor"),
        Item.init(armor: 10, health: 0, attack: 1, mana: 1, img: "OrangeShield", name: "Bronze armor"),
        Item.init(armor: 50, health: 0, attack: -5, mana: 0, img: "TealShield", name: "Ice armor"),
        Item.init(armor: 5, health: 5, attack: 1, mana: 1, img: "GreenShield", name: "Emerald shield"),
        Item.init(armor: 12, health: 0, attack: 2, mana: 0, img: "DarkGreenShield", name: "Rune emerald shield"),
        Item.init(armor: 33, health: -20, attack: 0, mana: 2, img: "DarkRedShield", name: "Great blood Armor")
    ]
    

    ///Перки с кольцами
    let ringArr = [
        Item.init(armor: 0, health: 0, attack: 3, mana: 0, img: "RedRing", name: "Ring of attack"),
        Item.init(armor: 0, health: 0, attack: 0, mana: 10, img: "PurpleRing", name: "Ring of energy"),
        Item.init(armor: 5, health: 3, attack: 1, mana: 2, img: "OrangeRing", name: "Handfull ring"),
        Item.init(armor: 7, health: 3, attack: 1, mana: 0, img: "OrangeGreatRing", name: "Great handfull ring"),
        Item.init(armor: 15, health: 0, attack: 0, mana: 0, img: "BlueRing", name: "Ring of protection"),
        Item.init(armor: 0, health: 10, attack: 0, mana: 0, img: "GreenRing", name: "Ring of health"),
        Item.init(armor: 0, health: 10, attack: 1, mana: 2, img: "BlueGreatRing", name: "Ring of archmage"),
        Item.init(armor: 0, health: -10, attack: 6, mana: 0, img: "RedGreatRing", name: "Great ring of attack")
    ]

    ///Перки с способностями
    let spellArr = [
        Item.init(name: "SkullJail"),
        Item.init(name: "FirstAid"),
        Item.init(name: "HeartAttack"),
        Item.init(name: "Nemesis"),
//        Item.init(name: "EnergyAttack"),
        Item.init(name: "SilverSword"),
        Item.init(name: "ScullingTheSkulls"),
        
        Item.init(name: "GoldenHeart"),
        Item.init(name: "ManaHealth"),
        Item.init(name: "UnstableTreatment"),
    ]
    
    ///Мусорные предметы
    let trashArr = [
        Item.init(armor: 2, health: 0, attack: 0, mana: 0, img: "Trash", name: "Broken sheild"),
        Item.init(armor: 1, health: 0, attack: 0, mana: 0, img: "Trash", name: "Broken ring"),
        Item.init(armor: 0, health: 0, attack: 0, mana: 2, img: "Trash", name: "Energy shard"),
        Item.init(armor: 0, health: 0, attack: 0, mana: 1, img: "Trash", name: "Empty mana potion"),
        Item.init(armor: 0, health: 0, attack: 1, mana: 0, img: "Trash", name: "Spike"),
        Item.init(armor: 0, health: 0, attack: 1, mana: 0, img: "Trash", name: "Pice of sword"),
        Item.init(armor: 0, health: 1, attack: 0, mana: 0, img: "Trash", name: "Empty health potion"),
        Item.init(armor: 0, health: 0, attack: 1, mana: 0, img: "Trash", name: "Empty poison potion")
    ]
    
    ///Перки с поясами
    let beltArr = [
        Item.init(armor: 0, health: 15, attack: 0, mana: 0, img: "BeltGold", name: "Strong belt"),
        Item.init(armor: 5, health: 10, attack: 0, mana: 0, img: "BeltSilver", name: "Heavy belt"),
        Item.init(armor: 7, health: 16, attack: 0, mana: -5, img: "BeltGreen", name: "Warchief belt"),
        Item.init(armor: 5, health: 10, attack: 0, mana: 2, img: "BeltDark", name: "Enchanted belt"),
        Item.init(armor: 0, health: 5, attack: 2, mana: -3, img: "BeltGray", name: "Snaky belt")
    ]
    
    let amuletArr = [
        Item.init(armor: 0, health: 0, attack: 4, mana: -2, img: "AmuletGold", name: "Golden amulet"),
        Item.init(armor: 2, health: 0, attack: 0, mana: 5, img: "AmuletPurple", name: "Amethyst amulet"),
        Item.init(armor: 10, health: 0, attack: 0, mana: 3, img: "AmuletBlue", name: "Sapphire amulet"),
        Item.init(armor: 2, health: 2, attack: 2, mana: 2, img: "AmuletGreen", name: "Emerald amulet"),
        Item.init(armor: 2, health: 20, attack: -2, mana: 0, img: "AmuletOrange", name: "Amber amulet"),
    ]
    
//    let rareItemArr = [
//        Item.init(vampirism: 0, evasion: 0, critacal: 0, blockDamage: 0, img: "DarkRedRing", name: "Test of fate", description: "get 10 health when you attack")
//    ]
//
    let legendaryItemArr = [
        Item.init(img: "FeatherLegend", name: "Fire feather", description: "Spawn 2 match attacks when you are attacked"),
        Item.init(img: "BeltLegend", name: "Belt of truth", description: "When you are attacked, will replace one match skulls to match chains")
    ]

    
    ///Высота ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    ///Количество ячеек
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\(allItem.count) --- ALL ITEM")
        return countOfSelectedItem
    }
    
    ///Инициализация ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ItemCellTableViewCell

        let item = itemOnBoard[indexPath.row]
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 0
        
        let name = item.name
        let nameAttr = NSMutableAttributedString(string: name)
        nameAttr.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range:NSMakeRange(0, nameAttr.length))
        
        let desc = item.description
        let attrString = NSMutableAttributedString(string: desc)
        attrString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range:NSMakeRange(0, attrString.length))
        
        let price = "\(item.spellHealth)-\(item.spellArmor)-\(item.spellMana)-\(item.spellGold)"
        let attrPrice = NSAttributedString(string: price)
        
        
        cell.cellTitle?.textColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        cell.cellTitle?.attributedText = Utils.shared.setBackgroundColorLabel(oldString: nameAttr)
        cell.cellTitle?.font = UIFont(name: "Munro", size: 20)
        
        cell.cellImage?.image = UIImage(named: "\(item.img).png")
        
        cell.cellDescription!.numberOfLines = 0
        cell.cellDescription?.font = UIFont(name: "MunroSmall", size: 15)
        cell.cellDescription?.textColor = .white
        cell.cellDescription?.attributedText = Utils.shared.setColoredLabel(oldString: attrString)
        cell.cellDescription?.adjustsFontSizeToFitWidth = true
        cell.cellDescription?.lineBreakMode = .byTruncatingTail
        
        cell.selectionStyle = .none
        
        cell.backgroundColor = .clear
        
        return cell
    }
    
    ///Действие выделения ячейки
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.backgroundColor = #colorLiteral(red: 0.852553934, green: 0.7496075061, blue: 0.48592712, alpha: 0.3444456336)
        selectedItem = indexPath.row
        print("INDEX PATH ---\(selectedItem)")
        
        if selectedItem != -1 {
            getItemButtomObject.isEnabled = true
        }
    }
    
    ///Действия снятие выделения ячейки
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.backgroundColor = .clear
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func buildChest(chestType: ChestType) {
        switch chestType {
            case .itemChest:
                allItem += armorArr
                allItem += ringArr
                allItem += beltArr
                allItem += trashArr
                allItem += amuletArr
                
                if Int(arc4random_uniform(2)) == 0 {
                    allItem.append(legendaryItemArr[Int(arc4random_uniform(UInt32(legendaryItemArr.count)))])
                }
                break
            case .spellChest:
                allItem += spellArr
                break
            case .spellAndItemсhest:
                allItem += spellArr
                
                allItem += armorArr
                allItem += ringArr
                allItem += beltArr
                allItem += trashArr
                allItem += amuletArr
                
                if Int(arc4random_uniform(2)) == 0 {
                    allItem.append(legendaryItemArr[Int(arc4random_uniform(UInt32(legendaryItemArr.count)))])
                }

                break
            case .legendaryChest:
                allItem += legendaryItemArr
                break
            case .oneLegendChest:
                allItem.append(legendaryItemArr[Int(arc4random_uniform(UInt32(legendaryItemArr.count)))])
                break
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let startLvl = 1
        
        if chestType == nil {
            switch lvlDifficulty {
            case startLvl+1:
                buildChest(chestType: .spellChest)
            case startLvl+20:
                buildChest(chestType: .oneLegendChest)
            case startLvl+40:
                buildChest(chestType: .oneLegendChest)
            default:
                buildChest(chestType: .spellAndItemсhest)
            }
        }
        else {
            buildChest(chestType: chestType)
            chestType = nil
        }
        


        for _ in 0...countOfSelectedItem-1 {
            itemOnBoard.append(allItem[Int(arc4random_uniform(UInt32(allItem.count)))])
        }
        
        var reworkItemBoard = [Item]()

        print("Item on start \(itemOnBoard)")
        
        for i in 0...itemOnBoard.count-1 {
            for j in 0...itemOnBoard.count-1 {
                if itemOnBoard[i].name == itemOnBoard[j].name && i < j {
                    itemOnBoard[i].name = "DeletThis"
                }
            }
        }
        
        for i in 0...itemOnBoard.count-1 {
//            for j in 0...itemOnBoard.count-1 {
                if itemOnBoard[i].name != "DeletThis" {
                    reworkItemBoard.append(itemOnBoard[i])
                }
//            }
        }
        
        
        print("Item on finish \(reworkItemBoard)")
        
        itemOnBoard = reworkItemBoard
        
        print("\(itemOnBoard) --- NEW ITEM BOARD")
        countOfSelectedItem = itemOnBoard.count
        
        tableView.separatorStyle = .none

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
