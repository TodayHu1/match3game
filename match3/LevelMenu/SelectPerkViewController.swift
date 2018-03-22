//
//  SelectPerkViewController.swift
//  match3
//
//  Created by Евгений on 21.03.2018.
//  Copyright © 2018 Женя. All rights reserved.
//

import UIKit

class Item {
    
    var armor: Int = 0
    var health: Int = 0
    var attack: Int = 0
    var mana: Int = 0
    
    var img: String = ""
    var name: String = ""
    var description: String = ""
    
    var vampirism: Int = 0
    var evasion: Int = 0
    var critacal: Int = 0
    var blockDamage: Int = 0
    
    var spell: Spell!
    
    
    ///Инициализация для предмета
    init(armor: Int, health: Int, attack: Int, mana: Int, img: String, name: String, description: String) {
        self.armor = armor
        self.health = health
        self.attack = attack
        self.mana = mana

        self.img = img
        self.name = name
        self.description = description
    }

//    ///Инициализация для пассивной способности
//    init (vampirism: Int, evasion: Int, critacal: Int, blockDamage: Int, img: String, name: String, description: String) {
//        self.img = img
//        self.name = name
//        self.description = description
//    }
//
    ///Инициализация для активной способности
    init (name: String) {
        let gameScene = GameScene()
        spell = gameScene.spellBook(skillName: name, spellIndex: 0)
        
        self.img = "Spell\(name)"
        self.name = "[Spell] \(name)"
        self.description = spell.skillDescription
    }
}

class SelectPerkViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
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

    let spellArr = [
        Item.init(name: "SkullJail"),
        Item.init(name: "FirstAid"),
        Item.init(name: "HeartAttack"),
        Item.init(name: "Nemesis"),
    ]

    
    var allPerk = [Item]()
    
    ///Цвет активной ячейки
    var activeCellColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\(allPerk.count) --- ALL ITEM")
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)

        
        let item = allPerk[Int(arc4random_uniform(UInt32(allPerk.count)))]
//        let item = allPerk[indexPath.row]
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 0
        
        let desc = item.description
        let attrString = NSMutableAttributedString(string: desc)
        attrString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range:NSMakeRange(0, attrString.length))
        
        cell.textLabel?.text = item.name
        cell.textLabel?.font = UIFont(name: "Munro", size: 20)
        cell.textLabel?.textColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)

        
        cell.imageView?.image = UIImage(named: "\(item.img).png")
        
        cell.detailTextLabel!.numberOfLines = 0
        cell.detailTextLabel?.font = UIFont(name: "MunroSmall", size: 15)
        cell.detailTextLabel?.textColor = .white
        cell.detailTextLabel?.attributedText = setColoredLabel(oldString: attrString)
        
        
        cell.backgroundColor = activeCellColor
        

        
        return cell
    }
    
    func setColoredLabel(oldString: NSMutableAttributedString) -> NSAttributedString {
        oldString.setColorForText("skull", with: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        oldString.setColorForText("skulls", with: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        
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
    
    struct PerkStat {
        var armor: Int
        var health: Int
        var attack: Int
        var mana: Int
        
        var img: String
        
        var name: String
        var description: String
    }
    
    struct PerkPassive {
        var vampirism: Int
        var evasion: Int
        var critacal: Int
        var blockDamage: Int
        
        var img: String
        
        var name: String
        var description: String
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        allPerk += armorArr
        allPerk += ringArr
        allPerk += spellArr

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
