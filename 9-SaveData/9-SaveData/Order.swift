//
//  Order.swift
//  9-SaveData
//
//  Created by FlyElephant on 17/3/23.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class Order:NSObject,NSCoding {
    
    var orderName:String = ""
    
    var userName:String = ""
    
    init(orderName:String, userName:String) {
        self.orderName = orderName
        self.userName = userName
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.orderName = aDecoder.decodeObject(forKey: "OrderName") as! String
        self.userName = aDecoder.decodeObject(forKey: "UserName") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.orderName, forKey:"OrderName")
        
        aCoder.encode(self.userName, forKey: "UserName")
    }
    
}
