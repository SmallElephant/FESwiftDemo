//
//  FEExtension.swift
//  4-ExpandTableViewCell
//
//  Created by keso on 2017/1/19.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hex:Int, alpha:CGFloat = 1.0) {
        self.init(
            red:   CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8)  / 255.0,
            blue:  CGFloat((hex & 0x0000FF) >> 0)  / 255.0,
            alpha: alpha
        )
    }
    
}

extension UIView {
    
    // x
    var x:CGFloat {
        get {
            return frame.origin.x
        }
        set(newValue) {
            var tempFrame:CGRect = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
        }
    }
    
    // y
    var y:CGFloat {
        get {
            return frame.origin.x
        }
        set(newValue) {
            var tempFrame:CGRect = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
        }
    }
    
    // top
    var top:CGFloat {
        get {
            return frame.minY
        }
        set(newValue) {
            var tempFrame:CGRect = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
        }
    }
    
    // bottom
    var bottom:CGFloat {
        get {
            return frame.maxY
        }
        set(newValue) {
            var tempFrame:CGRect = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
        }
    }
    
    // left
    var left:CGFloat {
        get {
            return frame.minX
        }
        set(newValue) {
            var tempFrame:CGRect = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
        }
    }
    
    // right
    var right:CGFloat {
        get {
            return frame.maxX
        }
        set(newValue) {
            var tempFrame:CGRect = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
        }
    }
    
    // CenterX
    var centerX:CGFloat {
        get {
            return frame.midX
        }
        set(newValue) {
            var tempFrame:CGRect = frame
            tempFrame.origin.x = newValue - frame.size.width/2
            frame = tempFrame
        }
    }
    
    // CenterY
    var centerY:CGFloat {
        get {
            return frame.minY
        }
        set(newValue) {
            var tempFrame:CGRect = frame
            tempFrame.origin.y = newValue - frame.size.height/2
            frame = tempFrame
        }
    }
    
    // Width
    var width:CGFloat {
        get {
            return frame.size.width
        }
        set(newValue) {
            var tempFrame:CGRect = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
    }


    // Height
    var height:CGFloat {
        get {
            return frame.size.height
        }
        set(newValue) {
            var tempFrame:CGRect = frame
            tempFrame.size.height = newValue
            frame = tempFrame
        }
    }

}
