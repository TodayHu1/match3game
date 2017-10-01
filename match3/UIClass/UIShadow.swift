//
//  UIShadow.swift
//  match3
//
//  Created by Женя on 18.09.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import UIKit

class ButtonWithShadow: UIButton {
    
    override func draw(_ rect: CGRect) {
        updateLayerProperties()
    }
    
    func updateLayerProperties() {
        self.alpha = 1.0
        self.backgroundColor = UIColor(red: 171, green: 178, blue: 186, alpha: 1.0)
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 4.0
    }

    
}






