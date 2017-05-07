//
//  ViewController.swift
//  15-Predicate
//
//  Created by keso on 2017/5/7.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Pragram MARK: SetUp
    
    func setUp() {
        
        setUpComparareOperator()
        setUpJoinOperator()
        setUpString()
        setUpCollection()
        setUpDynamic()
    }
    
    private func setUpComparareOperator() {
        let name:String = "FlyElephant"
        let predicate:NSPredicate = NSPredicate(format: " SELF =  %@ ", "FlyElephant")

        if predicate.evaluate(with: name) {
            print("name--\(name)过滤成功")
        }
        
        
        let number:Int = 27
        let numPredicate:NSPredicate = NSPredicate(format: " SELF =  %d ", 27)
        
        if numPredicate.evaluate(with: number) {
            print("Number--\(number)过滤成功")
        }
        
        let data:Int = 5
        let rangePredicate:NSPredicate = NSPredicate(format: " SELF BETWEEN  {1,10}")
        
        if rangePredicate.evaluate(with: data) {
            print("范围--\(data)过滤成功")
        }
        
    }
    
    
    private func setUpJoinOperator() {
        let data:Int = 8
        let dataPredicate:NSPredicate = NSPredicate(format: " SELF > 5 && SELF < 10")
        if dataPredicate.evaluate(with: data) {
            print("逻辑---\(data)过滤成功")
        }
    }
    
    private func setUpString() {
        let regex:String = "^[0-9]+$"
        let matchPredicate:NSPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let data:String = "123456789"
        if matchPredicate.evaluate(with: data) {
            print("FlyElephant---字符串---\(data)符合---\(regex)")
        }
    }
    
    private func setUpCollection() {
        let inData:String = "Keso"
        let inPredicate:NSPredicate = NSPredicate(format: " SELF IN  {'FlyElephant','Keso'}")
        
        if inPredicate.evaluate(with: inData) {
            print("范围--\(inData)过滤成功")
        }
    }
    
    private func setUpDynamic() {
        let name:String = "FlyElephant"
        var predicate:NSPredicate = NSPredicate(format: " SELF =  $VALUE ")
        predicate = predicate.withSubstitutionVariables(["VALUE":name])
        if predicate.evaluate(with: name) {
            print("name--\(name)过滤成功")
        }
    }

}

