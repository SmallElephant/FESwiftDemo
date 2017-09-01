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
        testRoundModeCeiling()
        testRoundModeFloor()
        testRoundModeUp()
        testRoundModeDown()
        testRoundModeHalfup()
        testRoundModeHalfdown()
        testRoundModeHalfeven()
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
    
    func testRoundModeCeiling() {
        print("RoundMode ceiling测试========")
        var result = NSNumber(value: 8.5).numberFormate(mode: .ceiling)
        if let money = result {
            print("格式化1:\(money)")
        }
        
        result = NSNumber(value: 7.5).numberFormate(mode: .ceiling)
        if let money = result {
            print("格式化2:\(money)")
        }
        
        result = NSNumber(value: 2.7).numberFormate(mode: .ceiling)
        if let money = result {
            print("格式化3:\(money)")
        }
        
        result = NSNumber(value: 2.3).numberFormate(mode: .ceiling)
        if let money = result {
            print("格式化4:\(money)")
        }

        result = NSNumber(value: 2.0).numberFormate(mode: .ceiling)
        if let money = result {
            print("格式化5:\(money)")
        }
        
        result = NSNumber(value: -2.0).numberFormate(mode: .ceiling)
        if let money = result {
            print("格式化6:\(money)")
        }
        
        result = NSNumber(value: -2.3).numberFormate(mode: .ceiling)
        if let money = result {
            print("格式化7:\(money)")
        }
        
        result = NSNumber(value: -2.7).numberFormate(mode: .ceiling)
        if let money = result {
            print("格式化8:\(money)")
        }
        
        result = NSNumber(value: -7.5).numberFormate(mode: .ceiling)
        if let money = result {
            print("格式化9:\(money)")
        }
        
        result = NSNumber(value: -8.5).numberFormate(mode: .ceiling)
        if let money = result {
            print("格式化10:\(money)")
        }
    }
    
    func testRoundModeFloor() {
        print("RoundMode floor测试========")
        var result = NSNumber(value: 8.5).numberFormate(mode: .floor)
        if let money = result {
            print("格式化1:\(money)")
        }
        
        result = NSNumber(value: 7.5).numberFormate(mode: .floor)
        if let money = result {
            print("格式化2:\(money)")
        }
        
        result = NSNumber(value: 2.7).numberFormate(mode: .floor)
        if let money = result {
            print("格式化3:\(money)")
        }
        
        result = NSNumber(value: 2.3).numberFormate(mode: .floor)
        if let money = result {
            print("格式化4:\(money)")
        }
        
        result = NSNumber(value: 2.0).numberFormate(mode: .floor)
        if let money = result {
            print("格式化5:\(money)")
        }
        
        result = NSNumber(value: -2.0).numberFormate(mode: .floor)
        if let money = result {
            print("格式化6:\(money)")
        }
        
        result = NSNumber(value: -2.3).numberFormate(mode: .floor)
        if let money = result {
            print("格式化7:\(money)")
        }
        
        result = NSNumber(value: -2.7).numberFormate(mode: .floor)
        if let money = result {
            print("格式化8:\(money)")
        }
        
        result = NSNumber(value: -7.5).numberFormate(mode: .floor)
        if let money = result {
            print("格式化9:\(money)")
        }
        
        result = NSNumber(value: -8.5).numberFormate(mode: .floor)
        if let money = result {
            print("格式化10:\(money)")
        }
    }
    
    func testRoundModeUp() {
        print("RoundMode up测试========")
        var result = NSNumber(value: 8.5).numberFormate(mode: .up)
        if let money = result {
            print("格式化1:\(money)")
        }
        
        result = NSNumber(value: 7.5).numberFormate(mode: .up)
        if let money = result {
            print("格式化2:\(money)")
        }
        
        result = NSNumber(value: 2.7).numberFormate(mode: .up)
        if let money = result {
            print("格式化3:\(money)")
        }
        
        result = NSNumber(value: 2.3).numberFormate(mode: .up)
        if let money = result {
            print("格式化4:\(money)")
        }
        
        result = NSNumber(value: 2.0).numberFormate(mode: .up)
        if let money = result {
            print("格式化5:\(money)")
        }
        
        result = NSNumber(value: -2.0).numberFormate(mode: .up)
        if let money = result {
            print("格式化6:\(money)")
        }
        
        result = NSNumber(value: -2.3).numberFormate(mode: .up)
        if let money = result {
            print("格式化7:\(money)")
        }
        
        result = NSNumber(value: -2.7).numberFormate(mode: .up)
        if let money = result {
            print("格式化8:\(money)")
        }
        
        result = NSNumber(value: -7.5).numberFormate(mode: .up)
        if let money = result {
            print("格式化9:\(money)")
        }
        
        result = NSNumber(value: -8.5).numberFormate(mode: .up)
        if let money = result {
            print("格式化10:\(money)")
        }
    }
    
    func testRoundModeDown() {
        print("RoundMode down测试========")
        var result = NSNumber(value: 8.5).numberFormate(mode: .down)
        if let money = result {
            print("格式化1:\(money)")
        }
        
        result = NSNumber(value: 7.5).numberFormate(mode: .down)
        if let money = result {
            print("格式化2:\(money)")
        }
        
        result = NSNumber(value: 2.7).numberFormate(mode: .down)
        if let money = result {
            print("格式化3:\(money)")
        }
        
        result = NSNumber(value: 2.3).numberFormate(mode: .down)
        if let money = result {
            print("格式化4:\(money)")
        }
        
        result = NSNumber(value: 2.0).numberFormate(mode: .down)
        if let money = result {
            print("格式化5:\(money)")
        }
        
        result = NSNumber(value: -2.0).numberFormate(mode: .down)
        if let money = result {
            print("格式化6:\(money)")
        }
        
        result = NSNumber(value: -2.3).numberFormate(mode: .down)
        if let money = result {
            print("格式化7:\(money)")
        }
        
        result = NSNumber(value: -2.7).numberFormate(mode: .down)
        if let money = result {
            print("格式化8:\(money)")
        }
        
        result = NSNumber(value: -7.5).numberFormate(mode: .down)
        if let money = result {
            print("格式化9:\(money)")
        }
        
        result = NSNumber(value: -8.5).numberFormate(mode: .down)
        if let money = result {
            print("格式化10:\(money)")
        }
    }
    
    func testRoundModeHalfup() {
        print("RoundMode halfup测试========")
        var result = NSNumber(value: 8.5).numberFormate(mode: .halfUp)
        if let money = result {
            print("格式化1:\(money)")
        }
        
        result = NSNumber(value: 7.5).numberFormate(mode: .halfUp)
        if let money = result {
            print("格式化2:\(money)")
        }
        
        result = NSNumber(value: 2.7).numberFormate(mode: .halfUp)
        if let money = result {
            print("格式化3:\(money)")
        }
        
        result = NSNumber(value: 2.3).numberFormate(mode: .halfUp)
        if let money = result {
            print("格式化4:\(money)")
        }
        
        result = NSNumber(value: 2.0).numberFormate(mode: .halfUp)
        if let money = result {
            print("格式化5:\(money)")
        }
        
        result = NSNumber(value: -2.0).numberFormate(mode: .halfUp)
        if let money = result {
            print("格式化6:\(money)")
        }
        
        result = NSNumber(value: -2.3).numberFormate(mode: .halfUp)
        if let money = result {
            print("格式化7:\(money)")
        }
        
        result = NSNumber(value: -2.7).numberFormate(mode: .halfUp)
        if let money = result {
            print("格式化8:\(money)")
        }
        
        result = NSNumber(value: -7.5).numberFormate(mode: .halfUp)
        if let money = result {
            print("格式化9:\(money)")
        }
        
        result = NSNumber(value: -8.5).numberFormate(mode: .halfUp)
        if let money = result {
            print("格式化10:\(money)")
        }
    }
    
    func testRoundModeHalfdown() {
        print("RoundMode halfDown测试========")
        var result = NSNumber(value: 8.5).numberFormate(mode: .halfDown)
        if let money = result {
            print("格式化1:\(money)")
        }
        
        result = NSNumber(value: 7.5).numberFormate(mode: .halfDown)
        if let money = result {
            print("格式化2:\(money)")
        }
        
        result = NSNumber(value: 2.7).numberFormate(mode: .halfDown)
        if let money = result {
            print("格式化3:\(money)")
        }
        
        result = NSNumber(value: 2.3).numberFormate(mode: .halfDown)
        if let money = result {
            print("格式化4:\(money)")
        }
        
        result = NSNumber(value: 2.0).numberFormate(mode: .halfDown)
        if let money = result {
            print("格式化5:\(money)")
        }
        
        result = NSNumber(value: -2.0).numberFormate(mode: .halfDown)
        if let money = result {
            print("格式化6:\(money)")
        }
        
        result = NSNumber(value: -2.3).numberFormate(mode: .halfDown)
        if let money = result {
            print("格式化7:\(money)")
        }
        
        result = NSNumber(value: -2.7).numberFormate(mode: .halfDown)
        if let money = result {
            print("格式化8:\(money)")
        }
        
        result = NSNumber(value: -7.5).numberFormate(mode: .halfDown)
        if let money = result {
            print("格式化9:\(money)")
        }
        
        result = NSNumber(value: -8.5).numberFormate(mode: .halfDown)
        if let money = result {
            print("格式化10:\(money)")
        }
    }
    
    
    func testRoundModeHalfeven() {
        print("RoundMode halfEven测试========")
        var result = NSNumber(value: 8.5).numberFormate(mode: .halfEven)
        if let money = result {
            print("格式化1:\(money)")
        }
        
        result = NSNumber(value: 7.5).numberFormate(mode: .halfEven)
        if let money = result {
            print("格式化2:\(money)")
        }
        
        result = NSNumber(value: 2.7).numberFormate(mode: .halfEven)
        if let money = result {
            print("格式化3:\(money)")
        }
        
        result = NSNumber(value: 2.3).numberFormate(mode: .halfEven)
        if let money = result {
            print("格式化4:\(money)")
        }
        
        result = NSNumber(value: 2.0).numberFormate(mode: .halfEven)
        if let money = result {
            print("格式化5:\(money)")
        }
        
        result = NSNumber(value: -2.0).numberFormate(mode: .halfEven)
        if let money = result {
            print("格式化6:\(money)")
        }
        
        result = NSNumber(value: -2.3).numberFormate(mode: .halfEven)
        if let money = result {
            print("格式化7:\(money)")
        }
        
        result = NSNumber(value: -2.7).numberFormate(mode: .halfEven)
        if let money = result {
            print("格式化8:\(money)")
        }
        
        result = NSNumber(value: -7.5).numberFormate(mode: .halfEven)
        if let money = result {
            print("格式化9:\(money)")
        }
        
        result = NSNumber(value: -8.5).numberFormate(mode: .halfEven)
        if let money = result {
            print("格式化10:\(money)")
        }
    }

}

