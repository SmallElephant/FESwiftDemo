//
//  ViewController.swift
//  9-SaveData
//
//  Created by FlyElephant on 17/3/23.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let dir = NSHomeDirectory()
        print("文件主目录:\(dir)")
        
        let defaults:UserDefaults = UserDefaults.standard
        defaults.setValue("FlyElephant", forKeyPath: "userName")
        
        let localPath:String = getSavePath()
        print("保存路径:\(localPath)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func archiverAction(_ sender: UIButton) {
        
        let order:Order = Order(orderName: "123456789", userName: "FlyElephant")
        
        NSKeyedArchiver.archiveRootObject(order, toFile: getSavePath())
    }
    
    
    @IBAction func unArchiverAction(_ sender: UIButton) {
        
        let order:Order = NSKeyedUnarchiver.unarchiveObject(withFile: getSavePath()) as! Order
        
        print("订单的名称:\(order.orderName)---用户名称--\(order.userName)")
        
    }

    // PARAMK: SetUp
    
    private func getSavePath()->String {
        let cacheDir:String = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
        let localPath:String = cacheDir.appending("TempTest.plist")
        return localPath;
    }
}

