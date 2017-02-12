//
//  ViewController.swift
//  5-ContextGraphics
//
//  Created by keso on 2017/2/12.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setUp1()
        
        self.setUp2()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:SetUp
    
    func setUp1() {
        //创建CGContextRef
        UIGraphicsBeginImageContext(self.view.bounds.size);
        
        let context:CGContext = UIGraphicsGetCurrentContext()!
        
        let path:CGMutablePath = CGMutablePath()
      
        context.addArc(center:CGPoint(x: 150, y: 150), radius: 50, startAngle: 0, endAngle: 1.5*CGFloat(M_PI), clockwise: true)
        
        context.move(to: CGPoint(x: 150, y: 100))
        context.addLine(to: CGPoint(x: 150, y: 150))
        context.addLine(to: CGPoint(x: 200, y: 150))
        
        context.addPath(path)
        
        UIColor.gray.setFill()
        UIColor.red.setStroke()
        
        context.drawPath(using: .fillStroke)
        
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        let imgView:UIImageView = UIImageView.init(image: image)
        self.view.addSubview(imgView)
        
    }
    
    
    func setUp2() {
        //创建CGContextRef
        UIGraphicsBeginImageContext(self.view.bounds.size);
        
        let context:CGContext = UIGraphicsGetCurrentContext()!
        
        let path:CGMutablePath = CGMutablePath()
        
        context.move(to: CGPoint(x: 100, y: 300))
        
        context.addArc(tangent1End: CGPoint(x: 200, y: 300), tangent2End: CGPoint(x: 200, y: 400), radius: 5.0)
        context.addArc(tangent1End: CGPoint(x: 200, y: 400), tangent2End: CGPoint(x: 100, y: 400), radius: 5.0)
        
        context.addArc(tangent1End: CGPoint(x: 100, y: 400), tangent2End: CGPoint(x: 100, y: 300), radius: 5.0)
        context.addArc(tangent1End: CGPoint(x: 100, y: 300), tangent2End: CGPoint(x: 200, y: 300), radius: 5.0)
        
        context.addPath(path)
        
        UIColor.gray.setFill()
        UIColor.red.setStroke()
        
        context.drawPath(using: .fillStroke)
        
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        let imgView:UIImageView = UIImageView.init(image: image)
        self.view.addSubview(imgView)
        
    }


}

