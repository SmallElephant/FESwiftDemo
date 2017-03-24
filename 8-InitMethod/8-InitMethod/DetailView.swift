//
//  DetailView.swift
//  8-InitMethod
//
//  Created by keso on 2017/3/19.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    var name:String
    var address:String
    
     init(detailName:String,address:String) {
        self.name = detailName
        self.address = address
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
