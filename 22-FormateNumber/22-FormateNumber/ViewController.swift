//
//  ViewController.swift
//  22-FormateNumber
//
//  Created by FlyElephant on 2017/9/1.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        testFormate()
        testRoundMode()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 测试用例 
    // 12
    // 12.3
    // 12.34
    // 12.345
    // 12.342
    // 12.997
    func testFormate() {
        var result = NSNumber(value: 12).moneyFormate(minDigits: 2, maxDigits: 2)
        if let money = result {
            print("格式化1:\(money)")
        }
        
        result = NSNumber(value: 12.3).moneyFormate(minDigits: 2, maxDigits: 2)
        if let money = result {
            print("格式化2:\(money)")
        }
        
        result = NSNumber(value: 12.34).moneyFormate(minDigits: 2, maxDigits: 2)
        if let money = result {
            print("格式化3:\(money)")
        }
        
        result = NSNumber(value: 1.21).moneyFormate(minDigits: 0, maxDigits: 1)
        if let money = result {
            print("格式化4:\(money)")
        }
        
        result = NSNumber(value: 12.345789).moneyFormate(minDigits: 2, maxDigits: 2)
        if let money = result {
            print("格式化5:\(money)")
        }
        
        result = NSNumber(value: 12.342789).moneyFormate(minDigits: 2, maxDigits: 2)
        if let money = result {
            print("格式化6:\(money)")
        }
        
        result = NSNumber(value: 12.997).moneyFormate(minDigits: 2, maxDigits: 2)
        if let money = result {
            print("格式化7:\(money)")
        }
    }
    
    func testRoundMode() {
        print("RoundMode 测试========")
        var result = NSNumber(value: 12.3456).moneyFormate(mode: .ceiling)
        if let money = result {
            print("格式化1---\(money)")
        }
        
        result = NSNumber(value: -12.3466).moneyFormate(mode: .floor)// 四舍五入结果取最小
        if let money = result {
            print("格式化2---\(money)")
        }
        
        result = NSNumber(value: -12.3466).moneyFormate(mode: .down)
        if let money = result {
            print("格式化3---\(money)")
        }
        
        result = NSNumber(value: 12.3456).moneyFormate(mode: .up)
        if let money = result {
            print("格式化4---\(money)")
        }
        
        result = NSNumber(value: 1.142345).moneyFormate(mode: .halfEven)
        if let money = result {
            print("格式化5---\(money)")
        }
        
        result = NSNumber(value: 1.146789).moneyFormate(mode: .halfEven)
        if let money = result {
            print("格式化6---\(money)")
        }
        
        result = NSNumber(value: 12.3456).moneyFormate(mode: .halfUp)
        if let money = result {
            print("格式化7---\(money)")
        }
    }

}

