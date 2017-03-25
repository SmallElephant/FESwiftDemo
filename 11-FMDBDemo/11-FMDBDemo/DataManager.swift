//
//  DataManager.swift
//  11-FMDBDemo
//
//  Created by keso on 2017/3/25.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class DataManager {
    
    static let shareIntance:DataManager = DataManager()
    
    var db:FMDatabase = FMDatabase()
    
    func createDataBase(dataName:String) {
        
        let path:String = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]
        
        let finalPath:String = path.appending("/\(dataName)")
        
        print("数据存储地址:\(finalPath)")
        
        db = FMDatabase(path: finalPath)
        
        if db.open() {
            print("数据库打开成功")
        }
    }
    
}
