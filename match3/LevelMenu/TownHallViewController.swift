//
//  TownHallViewController.swift
//  match3
//
//  Created by Евгений on 07.02.2018.
//  Copyright © 2018 Женя. All rights reserved.
//

import UIKit

class TownHallViewController: UIViewController {

    @IBOutlet weak var NumberOfGold: UILabel!
    
    @IBOutlet weak var UpgradeSwordButton: UIButton!
    @IBOutlet weak var UpgradeArmorButton: UIButton!
    @IBOutlet weak var UpgradeManaButton: UIButton!
    
    func setGoldLabel(plusNumber: Int) -> Bool {
        playerStat.gold += plusNumber
        if (playerStat.gold) < 0 {
            playerStat.gold -= plusNumber
            NumberOfGold.text = String(playerStat.gold)
            return false
        }
        else {
            NumberOfGold.text = String(playerStat.gold)
            return true
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = setGoldLabel(plusNumber: 0)
        
        UpgradeSwordButton.setTitle(String(Int(playerStat.attack / 4)), for: .normal)
        UpgradeArmorButton.setTitle(String(Int(playerStat.armorNow / 8)), for: .normal)
        UpgradeManaButton.setTitle(String(Int(playerStat.manaNow / 4)), for: .normal)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func test(_ sender: Any) {

    }
    
    
    @IBAction func SwordUpgrade(_ sender: Any) {
        playerStat.attack += 1
        let labelText = Int(playerStat.attack / 4)
        if setGoldLabel(plusNumber: -labelText) {
            UpgradeSwordButton.setTitle(String(labelText), for: .normal)
        }
    }
    
    
    @IBAction func ArmorUpgrade(_ sender: Any) {
        playerStat.armorNow += 1
        let labelText = Int(playerStat.armorNow / 8)
        if setGoldLabel(plusNumber: -labelText) {
            UpgradeArmorButton.setTitle(String(labelText), for: .normal)
        }

    }
    
    
    @IBAction func ManaUpgrade(_ sender: Any) {
        playerStat.manaNow += 1
        let labelText = Int(playerStat.manaNow / 4)
        if setGoldLabel(plusNumber: -labelText) {
            UpgradeManaButton.setTitle(String(labelText), for: .normal)
        }
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
