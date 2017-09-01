//
//  NSNumber.swift
//  22-FormateNumber
//
//  Created by FlyElephant on 2017/9/1.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

extension NSNumber {
    
    func moneyFormate(minDigits: Int = 0, maxDigits:Int = 2) -> String? {
        let formate = NumberFormatter()
        formate.numberStyle = NumberFormatter.Style.decimal
        formate.groupingSeparator = ","
        formate.minimumFractionDigits = minDigits
        formate.maximumFractionDigits = maxDigits
        formate.roundingMode = .ceiling
        let result = formate.string(from: self)
        return result
    }
    
    func moneyFormate(mode: NumberFormatter.RoundingMode) -> String? {
        let formate = NumberFormatter()
        formate.numberStyle = NumberFormatter.Style.decimal
        formate.groupingSeparator = ","
        formate.minimumFractionDigits = 0
        formate.maximumFractionDigits = 1
        formate.roundingMode = mode
        let result = formate.string(from: self)
        return result
    }
}

extension String {
    
    public func toMoneyString(_ scale: Int = 2) -> String? {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = scale
        nf.groupingSeparator = ","
        
        if self.contains(",") {
            return nf.number(from: self)?.stringValue
        }
        guard let tmp = Double(self) else {
            return nil
        }
        let num = NSNumber(value: tmp as Double)
        return nf.string(from: num)
    }
}

extension NSDecimalNumber {
    
    func toMoneyString(_ scale: Int = 2) -> String? {
        return self.stringValue.toMoneyString(scale)
    }
}


extension Double {
    
    func toMoneyString(_ scale: Int = 2) -> String? {
        if self < 0 {
            return self.toDecimalNumber(roundingMode: .up, scale: 2).toMoneyString(scale)
        }
        return self.toDecimalNumber(roundingMode: .down, scale: 2).toMoneyString(scale)
    }
    
    public func toDecimalNumber(roundingMode model: NSDecimalNumber.RoundingMode = .plain, scale: Int16 = 2) -> NSDecimalNumber {
        let inputNum = NSDecimalNumber(value: self as Double)
        let hander = NSDecimalNumberHandler(roundingMode: model, scale: scale, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: true)
        let outNum = inputNum.rounding(accordingToBehavior: hander)
        return outNum
    }
}
