//
//  Teacher.swift
//  8-InitMethod
//
//  Created by keso on 2017/3/19.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit

class Teacher {
    
    var name:String = ""
    
    required init(name:String) {
        //self.name = name
    }
    
    convenience init() {
        self.init(name: "Teacher")
    }

}
