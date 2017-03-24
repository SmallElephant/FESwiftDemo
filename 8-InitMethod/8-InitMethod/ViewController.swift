//
//  ViewController.swift
//  8-InitMethod
//
//  Created by keso on 2017/3/19.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var teacher:Teacher = Teacher(name: "钢的琴")
        
        var student:Student = Student(name: "", score: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

