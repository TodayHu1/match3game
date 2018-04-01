//
//  SelectPerkViewController.swift
//  match3
//
//  Created by Евгений on 21.03.2018.
//  Copyright © 2018 Женя. All rights reserved.
//

import UIKit

class SelectPerkViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    ///Количество предметов для выбора игроком
    var countOfSelectedItem = 5
    
    ///Выбранный итем
    var selectedItem = -1
    
    ///Массив для всех итемов
    var allItem = [Item]()
    
    ///Массив для выбора итемов игроком
    var itemOnBoard = [Item]()
    
    ///Цвет активной ячейки
    var activeCellColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
    
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
        default:
            break
        }

    }
    
    ///Перки с броней
    let armorArr = [
        Item.init(armor: 50, health: -10, attack: 0, mana: 0, img: "RedShield", name: "Blood Armor", description: "get 50 armor but minus 10 health"),
        Item.init(armor: 30, health: 0, attack: 0, mana: 0, img: "BlueShield", name: "Armor pack", description: "get 30 armor"),
        Item.init(armor: 40, health: 0, attack: 0, mana: -10, img: "PurpleShield", name: "Mana shield", description: "get 40 armor but minus 10 mana"),
        Item.init(armor: 10, health: 0, attack: 3, mana: 0, img: "BlackShield", name: "Spiky armor", description: "get 10 armor and 3 attack"),
        Item.init(armor: 20, health: 10, attack: 0, mana: 0, img: "WhiteShield", name: "Diviny armor", description: "get 20 armor and 10 health"),
        Item.init(armor: 20, health: 5, attack: 1, mana: 1, img: "OrangeShield", name: "Corrosive armor", description: "get 20 armor, 5 health, 1 attack, 1 mana"),
        Item.init(armor: 100, health: 5, attack: -5, mana: 1, img: "TealShield", name: "Ice armor", description: "get 100 armor but minus 5 attack"),
        Item.init(armor: 20, health: 5, attack: 1, mana: 1, img: "GreenShield", name: "Forest shield", description: "get 20 armor, 5 health, 1 attack and 1 mana"),
        Item.init(armor: 25, health: 0, attack: 2, mana: 0, img: "DarkGreenShield", name: "Rune forest shield", description: "get 25 armor and 2 attack"),
        Item.init(armor: 66, health: -15, attack: 0, mana: 0, img: "DarkRedShield", name: "Great blood Armor", description: "get 66 armor but minus 15 health"),
    ]

    ///Перки с кольцами
    let ringArr = [
        Item.init(armor: 0, health: 0, attack: 5, mana: 0, img: "RedRing", name: "Ring of attack", description: "get 5 attack"),
        Item.init(armor: 0, health: 0, attack: 0, mana: 10, img: "PurpleRing", name: "Ring of energy", description: "get 10 mana"),
        Item.init(armor: 10, health: 5, attack: 1, mana: 2, img: "OrangeRing", name: "Handfull ring", description: "get 10 armor, 5 health, 1 attack, 2 mana"),
        Item.init(armor: 15, health: 6, attack: 1, mana: 0, img: "OrangeGreatRing", name: "Great handfull ring", description: "get 15 armor, 6 health, 1 attack"),
        Item.init(armor: 30, health: 0, attack: 0, mana: 0, img: "BlueRing", name: "Ring of protection", description: "get 30 armor"),
        Item.init(armor: 0, health: 20, attack: 0, mana: 0, img: "GreenRing", name: "Ring of health", description: "get 20 health"),
        Item.init(armor: 0, health: 20, attack: 2, mana: 3, img: "BlueGreatRing", name: "Ring of archimage", description: "get 2 attack and 3 mana"),
        Item.init(armor: 0, health: 0, attack: 10, mana: 0, img: "RedGreatRing", name: "Great ring of attack", description: "get 10 attack"),
    ]

    ///Перки с способностями
    let spellArr = [
        Item.init(name: "SkullJail"),
        Item.init(name: "FirstAid"),
        Item.init(name: "HeartAttack"),
        Item.init(name: "Nemesis"),
    ]
    
    ///Мусорные предметы
    let trashArr = [
        Item.init(armor: 2, health: 0, attack: 0, mana: 0, img: "Trash", name: "Broken sheild", description: "get 2 armor"),
        Item.init(armor: 1, health: 0, attack: 0, mana: 0, img: "Trash", name: "Broken ring", description: "get 1 armor"),
        Item.init(armor: 0, health: 0, attack: 0, mana: 2, img: "Trash", name: "Energy shard", description: "get 2 mana"),
        Item.init(armor: 0, health: 0, attack: 0, mana: 1, img: "Trash", name: "Empty mana potion", description: "get 1 mana"),
        Item.init(armor: 0, health: 0, attack: 1, mana: 0, img: "Trash", name: "Spike", description: "get 1 attack"),
        Item.init(armor: 0, health: 0, attack: 1, mana: 0, img: "Trash", name: "Pice of sword", description: "get 1 attack"),
        Item.init(armor: 0, health: 1, attack: 0, mana: 0, img: "Trash", name: "Empty health potion", description: "get 1 health"),
        Item.init(armor: 0, health: 0, attack: 1, mana: 0, img: "Trash", name: "Empty poison potion", description: "get 1 attack"),
    ]
    
    let beltArr = [
        Item.init(armor: 0, health: 35, attack: 0, mana: 0, img: "BeltGold", name: "Strong belt", description: "gain 35 health"),
        Item.init(armor: 10, health: 20, attack: 0, mana: 0, img: "BeltSilver", name: "Heavy belt", description: "gain 10 armor, 20 health"),
        Item.init(armor: 15, health: 30, attack: 0, mana: -15, img: "BeltGreen", name: "Warchief belt", description: "gain 15 armor, 30 health, lose 15 mana"),
        Item.init(armor: 5, health: 15, attack: 0, mana: 5, img: "BeltDark", name: "Enchanted belt", description: "gain 5 armor, 15 health, 5 mana"),
        Item.init(armor: 0, health: 10, attack: 5, mana: -5, img: "BeltGray", name: "Snaky belt", description: "gain 10 health, 5 attack, lose 5 mana")
    ]
    
//    let rareItemArr = [
//        Item.init(vampirism: 0, evasion: 0, critacal: 0, blockDamage: 0, img: "DarkRedRing", name: "Test of fate", description: "get 10 health when you attack")
//    ]
//
//    let legendaryItemArr = [
//        Item.init(img: "DarkRedShield", name: "Blood to blood", description: "you have 10% to instantly kill enemy unit")
//    ]

    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomCellTableViewCell

        let item = itemOnBoard[indexPath.row]
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 0
        
        let name = item.name
        let nameAttr = NSMutableAttributedString(string: name)
        nameAttr.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range:NSMakeRange(0, nameAttr.length))
        
        let desc = item.description
        let attrString = NSMutableAttributedString(string: desc)
        attrString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range:NSMakeRange(0, attrString.length))

        
        cell.cellTitle?.textColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        cell.cellTitle?.attributedText = setColoredType(oldString: nameAttr)
        cell.cellTitle?.font = UIFont(name: "Munro", size: 20)
        
        cell.cellImage?.image = UIImage(named: "\(item.img).png")
        
        cell.cellDescription!.numberOfLines = 0
        cell.cellDescription?.font = UIFont(name: "MunroSmall", size: 15)
        cell.cellDescription?.textColor = .white
        cell.cellDescription?.attributedText = setColoredLabel(oldString: attrString)
        
        
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
    
    ///Раскраска слов для описания
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
        
        oldString.setColorForText("coin", with: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))
        oldString.setColorForText("coins", with: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))
        
        return oldString
    }
    
    ///Раскраска слов для описания типов предметов
    func setColoredType(oldString: NSMutableAttributedString) -> NSAttributedString {
        oldString.setColorForText("[Item]", with: #colorLiteral(red: 0.3698635356, green: 0.6549809645, blue: 0.1954145382, alpha: 1))
        
        oldString.setColorForText("[Rare]", with: #colorLiteral(red: 0.4745061458, green: 0.6789573384, blue: 1, alpha: 1))
        
        oldString.setColorForText("[Legendary]", with: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
        
        oldString.setColorForText("[Spell]", with: #colorLiteral(red: 0.670138375, green: 0.5150590541, blue: 0.9686274529, alpha: 1))
        
        return oldString
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        allItem += armorArr
        allItem += ringArr
        allItem += spellArr
        allItem += beltArr
        allItem += trashArr
//        allPerk += rareItemArr
//        allPerk += legendaryItemArr
        
        for _ in 0...countOfSelectedItem-1 {
            itemOnBoard.append(allItem[Int(arc4random_uniform(UInt32(allItem.count)))])
        }
        
        tableView.separatorStyle = .none

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
