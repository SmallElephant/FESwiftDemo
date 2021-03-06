//
//  ViewController.swift
//  16-Notification
//
//  Created by keso on 2017/5/13.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    var requestIdentifier:String = "FlyElephant---requestIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let view:UIView = UIView()
        view.layer.setNeedsDisplay()
        
        view.layer.transform = CATransform3DMakeScale(-1.0,-1.0,1.0);
        
        let transform:CGAffineTransform = CGAffineTransform(rotationAngle: 45.0);
        view.layer.setAffineTransform(transform)
//        testView.frame
//        testView.bounds
        
//        testView.layer.position
//        testView.layer.anchorPoint
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendNotification(_ sender: UIButton) {
        
        let content:UNMutableNotificationContent = UNMutableNotificationContent()
        content.body = "Body:你现在学习成绩不错，继续加油哦"
        content.title = "Title:温馨提示"
        content.subtitle = "Subtitle:FlyElephant"
        content.sound = UNNotificationSound.default()
        content.categoryIdentifier = requestIdentifier
        
        if let path = Bundle.main.path(forResource: "test", ofType: "jpg") {
            let url = URL(fileURLWithPath: path)
            
            do {
                let attachment = try UNNotificationAttachment(identifier: "testImage", url: url, options: nil)
                content.attachments = [attachment]
            } catch {
                print("文件不存在.")
            }
        }
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let request = UNNotificationRequest(identifier: "FlyElephant-Trrigger", content: content, trigger: trigger) // 请求通知
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error : Error?) in
            if let theError = error {
                print("通知--\(theError)")
            }
            print("通知成功")
        }
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: [requestIdentifier])
    }

}

