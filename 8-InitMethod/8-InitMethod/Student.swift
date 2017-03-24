//
//  Student.swift
//  8-InitMethod
//
//  Created by keso on 2017/3/19.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit

class Student: Teacher {

    var score:String = ""
    
    // 指定构造方法
    init(name: String,score: String) {
        self.score = ""
        super.init(name: name)

    }
    
    required init(name: String) {
        super.init(name: name)
    }
}

// 便利构造方法调用指定初始化方法
//     convenience override init(name: String) {
//        self.init(name:"",score:"")
//    }
