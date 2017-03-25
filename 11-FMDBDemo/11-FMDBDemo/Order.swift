//
//  Order.swift
//  11-FMDBDemo
//
//  Created by keso on 2017/3/25.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit

class Order {
    
    var db:FMDatabase = DataManager.shareIntance.db
    
    var orderName:String = ""
    var orderNumber:Int = 0
    
    // 创建订单表
    func createTable()  {
        let createTableSQL = "CREATE TABLE IF NOT EXISTS 't_order' ('id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,'orderName' TEXT,'orderNumber' INTEGER);"
        
        let result = db.executeUpdate(createTableSQL, withArgumentsIn: nil)
        
        if result {
            print("创建表格成功")
        }
    }
    
    // MARK:- 插入数据
    func insertOrder() {
        let insertSQL = "INSERT INTO t_order (orderName, orderNumber) VALUES (\"\(self.orderName)\", \(self.orderNumber));"
        
        let result = db.executeUpdate(insertSQL, withArgumentsIn: nil)
        
        if result {
            print("数据新增成功")
        }
    }
    
    func searchData() {
        let querySQL = "SELECT * FROM t_order"
        
        var resultSet:FMResultSet?
        
        do {
            try resultSet =  db.executeQuery(querySQL, values: nil)
            
            while (resultSet?.next())! {
                let name = resultSet?.string(forColumn: "orderName")
                let number = resultSet?.int(forColumn: "orderNumber")
                print("订单编号:\(number!)--订单名称:\(name!)")
            }
        } catch {
            
        }
        
    }
    
    func deleteData() {
        let deleteSQL = "DELETE FROM t_order WHERE id = 1"
        
        let result = db.executeUpdate(deleteSQL, withArgumentsIn: nil)
        
        if result {
            print("数据删除成功")
        }
    }
    
    func updateData() {
        let updateSQL = "UPDATE t_order SET orderName = '花生' WHERE id = 1"
        
        let result = db.executeUpdate(updateSQL, withArgumentsIn: nil)
        
        if result {
            print("修改成功")
        }
    }


}
