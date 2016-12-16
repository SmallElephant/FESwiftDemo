//
//  ViewController.swift
//  1-CGSizeExtension
//
//  Created by FlyElephant on 16/12/16.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
//Users/FlyElephant/Desktop/Git/Swift/FESwiftDemo/1-CGSizeExtension/1-CGSizeExtension/ViewController.swift:17:20: 'CGSizeMake' is unavailable in Swift
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let size = CGSize(width: 100, height: 100)
        print(size * 2)
        print(size / 2)
        print(size + 10)
        print(size - 10)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}




