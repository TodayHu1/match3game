//
//  Extension.swift
//  match3
//
//  Created by Евгений on 12.02.2018.
//  Copyright © 2018 Женя. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString{
    func setColorForText(_ textToFind: String, with color: UIColor) {
        let range = self.mutableString.range(of: textToFind, options: .caseInsensitive)
        if range.location != NSNotFound {
            addAttribute(NSForegroundColorAttributeName, value: color, range: range)
        }
    }
}

extension Dictionary {
    static func loadJSONFromBundle(filename: String) -> Dictionary<String, AnyObject>? {
        var dataOK: Data
        var dictionaryOK: NSDictionary = NSDictionary()
        if let path = Bundle.main.path(forResource: filename, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: NSData.ReadingOptions()) as Data!
                dataOK = data!
            }
            catch {
                print("Could not load level file: \(filename), error: \(error)")
                return nil
            }
            do {
                let dictionary = try JSONSerialization.jsonObject(with: dataOK, options: JSONSerialization.ReadingOptions()) as AnyObject!
                dictionaryOK = (dictionary as! NSDictionary as? Dictionary<String, AnyObject>)! as NSDictionary
            }
            catch {
                print("Level file '\(filename)' is not valid JSON: \(error)")
                return nil
            }
        }
        return dictionaryOK as? Dictionary<String, AnyObject>
    }
}




