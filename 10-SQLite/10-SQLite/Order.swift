//
//  Order.swift
//  10-SQLite
//
//  Created by keso on 2017/3/25.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation


class Order {
    
    var orderName:String = ""
    var orderNumber:Int = 0
    
    // 创建订单表
    func createTable() -> Bool {
        let createTableSQL = "CREATE TABLE IF NOT EXISTS 't_order' ('id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,'orderName' TEXT,'orderNumber' INTEGER);"
        return  DataManager.shareIntance.execSQL(sql:createTableSQL)
    }
    
    // MARK:- 插入数据
    func insertOrder() {
        let insertSQL = "INSERT INTO t_order (orderName, orderNumber) VALUES (\"\(self.orderName)\", \(self.orderNumber));"
        // 2.执行SQL语句
        if DataManager.shareIntance.execSQL(sql: insertSQL) {
            print("插入成功")
        }
    }
    
    func searchData() {
        let querySQL = "SELECT * FROM t_order"
        
        // 2.执行查询语句
        guard let array = DataManager.shareIntance.querySQL(querySQL: querySQL) else {
            return
        }
        
        print("查询的数据:\(array)")
    }
    
    func deleteData() {
        let deleteSQL = "DELETE FROM t_order WHERE id = 1"
        
        if DataManager.shareIntance.execSQL(sql: deleteSQL) {
            print("删除成功")
        }
    }
    
    func updateData() {
        let updateSQL = "UPDATE t_order SET orderName = '花生' WHERE id = 1"
        
        if DataManager.shareIntance.execSQL(sql: updateSQL) {
            print("修改成功")
        }
    }

}
