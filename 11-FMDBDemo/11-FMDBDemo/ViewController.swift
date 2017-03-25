//
//  ViewController.swift
//  11-FMDBDemo
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
        
        dataManager.createDataBase(dataName: "FlyElephant.sqlite")
        
        let order = Order()
        order.createTable()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func addAction(_ sender: UIButton) {
        for i in 0...10 {
            let order:Order = Order()
            order.orderNumber = i
            order.orderName = "FlyElephant-\(i)"
            order.insertOrder()
        }
    }
    
    @IBAction func updateAction(_ sender: UIButton) {
        let order:Order = Order()
        order.updateData()
    }
    
    @IBAction func searchAction(_ sender: UIButton) {
        let order:Order = Order()
        order.searchData()
    }
    
    @IBAction func deleteAction(_ sender: UIButton) {
        let order:Order = Order()
        order.deleteData()
    }
    
}

