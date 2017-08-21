//
//  ViewController.swift
//  21-CATransformLayer
//
//  Created by FlyElephant on 2017/8/21.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        setup()
        setup1()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func layerOfColor(_ color: UIColor, zPosition: CGFloat) -> CALayer {
        let layer = CALayer()
        layer.frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        layer.backgroundColor = color.cgColor
        layer.zPosition = zPosition
        layer.opacity = 0.5
        
        return layer
    }
    
    func setup() {
        let layer = CATransformLayer()
        layer.addSublayer(layerOfColor(.red, zPosition: 20))
        layer.addSublayer(layerOfColor(.green, zPosition: 40))
        layer.addSublayer(layerOfColor(.orange, zPosition: 60))
        
        var perspective = CATransform3DIdentity
        perspective.m34 = -1 / 100
        layer.backgroundColor = UIColor.gray.cgColor
        layer.transform = CATransform3DRotate(perspective, 0.1, 0, 1, 0)
        self.view.layer.addSublayer(layer)
    }
    
    func setup1() {
        let layer = CALayer()
        layer.addSublayer(layerOfColor(.red, zPosition: 20))
        layer.addSublayer(layerOfColor(.green, zPosition: 40))
        layer.addSublayer(layerOfColor(.orange, zPosition: 60))
        
        var perspective = CATransform3DIdentity
        perspective.m34 = -1 / 100
        layer.backgroundColor = UIColor.gray.cgColor
        layer.transform = CATransform3DRotate(perspective, 0.1, 0, 1, 0)
        self.view.layer.addSublayer(layer)
    }

}

