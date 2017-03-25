//
//  DataManager.swift
//  10-SQLite
//
//  Created by keso on 2017/3/25.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation


class DataManager {
    
    static let shareIntance:DataManager = DataManager()
    // 数据库句柄
    var db:OpaquePointer?
    
    func createSQLiteDataBase(dataName:String) {
        
        let path:String = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]
        
        print("应用程序文件目录:\(path)")
        
        let finalPath:String = path.appending("/\(dataName)")
        
        if sqlite3_open(finalPath, &db) != SQLITE_OK {
            print("打开或者创建数据库失败")
        } else {
            print("数据库创建成功:\(finalPath)")
        }
    }
    
    /// 执行查询操作
    func querySQL(querySQL : String) -> [[String : AnyObject]]? {
        
        var stmt : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, querySQL, -1, &stmt, nil) != SQLITE_OK {
            print("没有准备好查询")
            return nil
        }
    
        var dictArray = [[String : AnyObject]]()
        
        while sqlite3_step(stmt) == SQLITE_ROW {
            dictArray.append(getRecord(stmt: stmt!))
        }
        
        return dictArray
    }
    
    /// 根据'游标'获取一条数据
    func getRecord(stmt : OpaquePointer) -> [String : AnyObject] {
        let count = sqlite3_column_count(stmt)
        var dict = [String : AnyObject]()
        for i in 0..<count {
            // 2.取出字典对应的key
            let cKey = sqlite3_column_name(stmt, i)
            guard let key = String(cString: cKey!, encoding: String.Encoding.utf8) else {
                continue
            }
            
            let cValue =  UnsafePointer<UInt8>(sqlite3_column_text(stmt, i))
            let value = String.init(cString: cValue!)
            
            dict[key] = value as AnyObject?
        }
        
        return dict
    }
    
    func execSQL(sql : String) -> Bool {
        let cSQL = sql.cString(using: String.Encoding.utf8)
        return sqlite3_exec(db, cSQL!, nil, nil, nil) == SQLITE_OK
    }
    
}
