//
//  ViewController.swift
//  17-AnchorPoint
//
//  Created by keso on 2017/5/30.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUp()
        setUp1()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func setUp() {
        
        let bgView:UIView = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        bgView.backgroundColor = UIColor.red
        self.view.addSubview(bgView)
        
        let midView:UIView = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        midView.backgroundColor = UIColor.blue
        bgView.addSubview(midView)
        
        print("FlyElephant---中间视图的frame:\(midView.layer.frame)")
        print("FlyElephant---中间视图的position:\(midView.layer.position)")
        print("FlyElephant---中间视图的anchorPoint:\(midView.layer.anchorPoint)")
        
    }
    
    private func setUp1() {
        let bgView:UIView = UIView(frame: CGRect(x: 100, y: 400, width: 200, height: 200))
        bgView.backgroundColor = UIColor.red
        self.view.addSubview(bgView)
        
        let midView:UIView = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        midView.backgroundColor = UIColor.blue
        midView.layer.anchorPoint = CGPoint(x: 1, y: 1)
        midView.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        bgView.addSubview(midView)
        
        print("anchorPoint---中间视图的frame:\(midView.layer.frame)")
        print("anchorPoint---中间视图的position:\(midView.layer.position)")
        print("anchorPoint---中间视图的anchorPoint:\(midView.layer.anchorPoint)")
    }

}

