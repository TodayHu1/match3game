//
//  CounClass.swift
//  match3
//
//  Created by Женя on 16.11.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

public class SKCountingLabel: SKLabelNode {
    
    override init(fontNamed fontName: String!) {
        super.init()
        self.text = "Hello, World!"
        self.fontSize = 65;
        self.position = CGPoint(x: 400, y: 500);
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let kCounterRate: Float = 3.0
    
    public enum AnimationType {
        case Linear
        case EaseIn
        case EaseOut
        case EaseInOut
    }
    
    public enum CountingType {
        case Int
        case Float
        case Custom
    }
    
    var start: Float = 0.0
    var end: Float = 0.0
    var timer: Timer?
    var progress: TimeInterval!
    var lastUpdate: TimeInterval!
    var duration: TimeInterval!
    var countingType: CountingType!
    var animationType: AnimationType!
    public var format: String?
    
    var currentValue: Float {
        if (progress >= duration) {
            return end
        }
        let percent = Float(progress / duration)
        let update = updateCounter(t: percent)
        return start + (update * (end - start));
    }
    
    public func countFrom(fromValue: Float,
                          to toValue: Float,
                          withDuration duration: TimeInterval,
                          andAnimationType aType: AnimationType,
                          andCountingType cType: CountingType) {
        
        // Set values
        self.start = fromValue
        self.end = toValue
        self.duration = duration
        self.countingType = cType
        self.animationType = aType
        self.progress = 0.0
        self.lastUpdate = NSDate.timeIntervalSinceReferenceDate
        
        if fromValue == toValue {
            self.fontColor = .white
        }
        else {
            if fromValue < toValue {
                self.fontColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            }
            else {
                self.fontColor = #colorLiteral(red: 1, green: 0.4102467211, blue: 0.3860324332, alpha: 1)
            }
        }

        
        // Invalidate and nullify timer
        killTimer()
        
        // Handle no animation
        if (duration == 0.0) {
            updateText(value: toValue)
            return
        }
        
        // Create timer
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(SKCountingLabel.updateValue), userInfo: nil, repeats: true)
    }
    
    func updateText(value: Float) {
        switch countingType! {
        case .Int:
            self.text = "\(Int(value))"
        case .Float:
            self.text = String(format: "%.2f", value)
        case .Custom:
            if let format = format {
                self.text = String(format: format, value)
            } else {
                self.text = String(format: "%.2f", value)
            }
        }
    }
    
    func updateValue() {
        
        // Update the progress
        let now = NSDate.timeIntervalSinceReferenceDate
        progress = progress + (now - lastUpdate)
        lastUpdate = now
        
        // End when timer is up
        if (progress >= duration) {
            killTimer()
            progress = duration
        }
        
        updateText(value: currentValue)
        
    }
    
    func killTimer() {
        timer?.invalidate()
        timer = nil
        if lroundf(Float(progress)) == 1 {
            self.fontColor = .white
        }
    }
    
    func updateCounter(t: Float) -> Float {
        switch animationType! {
        case .Linear:
            return t
        case .EaseIn:
            return powf(t, kCounterRate)
        case .EaseOut:
            return 1.0 - powf((1.0 - t), kCounterRate)
        case .EaseInOut:
            var t = t
            var sign = 1.0;
            let r = Int(kCounterRate)
            if (r % 2 == 0) {
                sign = -1.0
            }
            t *= 2;
            if (t < 1) {
                return 0.5 * powf(t, kCounterRate)
            } else {
                return Float(sign * 0.5) * (powf(t-2, kCounterRate) + Float(sign * 2))
            }
            
        }
    }
    
    
}
