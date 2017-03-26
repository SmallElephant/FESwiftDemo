//
//  ViewController.swift
//  12-ShadowDash
//
//  Created by keso on 2017/3/26.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: SetUp
    
    func setUp() {
        
        let view:UIView = UIView.init(frame: CGRect(x: 50, y: 200, width: 50, height: 50))
        
        view.backgroundColor = UIColor.blue
        
        view.layer.shadowColor = UIColor.red.cgColor
        view.layer.shadowOpacity = 1.0
        
        self.view.addSubview(view)
        
        let view1:UIView = UIView.init(frame: CGRect(x: 150, y: 200, width: 50, height: 50))
        
        view1.backgroundColor = UIColor.blue
        
        view1.layer.shadowColor = UIColor.red.cgColor
        view1.layer.shadowOpacity = 1.0
        view1.layer.shadowOffset = CGSize(width: 0, height: 0)
        view1.layer.shadowRadius = 4
        
        self.view.addSubview(view1)
        
        let view2:UIView = UIView.init(frame: CGRect(x: 250, y: 200, width: 50, height: 50))
        
        view2.backgroundColor = UIColor.blue
        view2.layer.masksToBounds = true
        view2.layer.cornerRadius = 25
        
        view2.layer.shadowColor = UIColor.red.cgColor
        view2.layer.shadowOpacity = 1.0
        view2.layer.shadowOffset = CGSize(width: 0, height: 0)
        view2.layer.shadowRadius = 4
        
        self.view.addSubview(view2)
        
        
        let shadowView:UIView = UIView(frame: CGRect(x: 50, y: 300, width: 50, height: 50))
        shadowView.backgroundColor = UIColor.white
        shadowView.layer.shadowColor = UIColor.red.cgColor
        shadowView.layer.shadowOpacity = 1.0
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
        shadowView.layer.shadowRadius = 4
        shadowView.clipsToBounds = false
        shadowView.layer.cornerRadius = 25.0
        
        let innerView:UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        innerView.backgroundColor = UIColor.yellow
        innerView.clipsToBounds = true
        innerView.layer.cornerRadius = 25
        
        shadowView.addSubview(innerView)
        
        self.view.addSubview(shadowView)
        
    }
    
    
    
    
    

}

