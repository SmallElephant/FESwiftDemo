//
//  ViewController.swift
//  10-SQLite
//
//  Created by keso on 2017/3/25.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let dataManager:DataManager = DataManager.shareIntance
        
        dataManager.createSQLiteDataBase(dataName: "FlyElephant.db")
        
        let order:Order = Order()
        let isCreated:Bool = order.createTable()
        if isCreated {
            print("创建成功")
        } else {
            print("数据库表已存在")
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func insertAction(_ sender: UIButton) {
        for i in 0...100 {
            let order:Order = Order()
            order.orderNumber = i
            order.orderName = "FlyElephant-\(i)"
            order.insertOrder()
        }
    }
    
    
    @IBAction func deleteAction(_ sender: UIButton) {
        let order:Order = Order()
        order.deleteData()
    }
    
    
    @IBAction func searchAction(_ sender: UIButton) {
        let order:Order = Order()
        order.searchData()
    }
    
    @IBAction func updateAction(_ sender: UIButton) {
        let order:Order = Order()
        order.updateData()
    }

}

