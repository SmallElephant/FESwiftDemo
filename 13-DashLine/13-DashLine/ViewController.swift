//
//  ViewController.swift
//  13-DashLine
//
//  Created by keso on 2017/3/26.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.lor.red
        setUp()
        setUp1()
        setUp2()
        setUp3()
        setUp4()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:SetUp
    
    func setUp() {
        let imgView:UIImageView = UIImageView(frame: CGRect(x: 0, y: 100, width: self.view.frame.width, height: 20))
        self.view.addSubview(imgView)
        
        UIGraphicsBeginImageContext(imgView.frame.size) // 位图上下文绘制区域
        imgView.image?.draw(in: imgView.bounds)
        
        let context:CGContext = UIGraphicsGetCurrentContext()!
        
        context.setLineCap(CGLineCap.square)
        
        let lengths:[CGFloat] = [10,20] // 绘制 跳过 无限循环
        
        context.setStrokeColor(UIColor.red.cgColor)
        context.setLineWidth(5)
        context.setLineDash(phase: 0, lengths: lengths)
        context.move(to: CGPoint(x: 0, y: 10))
        context.addLine(to: CGPoint(x: self.view.frame.width, y: 10))
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        
    }
    
    func setUp1() {
        
        let imgView:UIImageView = UIImageView(frame: CGRect(x: 0, y: 150, width: self.view.frame.width, height: 20))
        self.view.addSubview(imgView)
        
        UIGraphicsBeginImageContext(imgView.frame.size) // 位图上下文绘制区域
        imgView.image?.draw(in: imgView.bounds)
        
        let context:CGContext = UIGraphicsGetCurrentContext()!
        
        context.setLineCap(CGLineCap.square)
        
        let lengths:[CGFloat] = [10,20] // 绘制 跳过 无限循环
        
        context.setStrokeColor(UIColor.red.cgColor)
        context.setLineWidth(5)
        context.setLineDash(phase: 5, lengths: lengths)
        context.move(to: CGPoint(x: 0, y: 10))
        context.addLine(to: CGPoint(x: self.view.frame.width, y: 10))
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        
    }
    
    func setUp2() {
        
        let imgView:UIImageView = UIImageView(frame: CGRect(x: 0, y: 200, width: self.view.frame.width, height: 20))
        self.view.addSubview(imgView)
        
        UIGraphicsBeginImageContext(imgView.frame.size) // 位图上下文绘制区域
        imgView.image?.draw(in: imgView.bounds)
        
        let context:CGContext = UIGraphicsGetCurrentContext()!
        
        context.setLineCap(CGLineCap.square)
        
        let lengths:[CGFloat] = [10,20,10] // 绘制 跳过 无限循环
        
        context.setStrokeColor(UIColor.red.cgColor)
        context.setLineWidth(5)
        context.setLineDash(phase: 0, lengths: lengths)
        context.move(to: CGPoint(x: 0, y: 10))
        context.addLine(to: CGPoint(x: self.view.frame.width, y: 10))
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        
    }
    
    func setUp3() {
        
        let imgView:UIImageView = UIImageView(frame: CGRect(x: 0, y: 250, width: self.view.frame.width, height: 20))
        self.view.addSubview(imgView)
        
        UIGraphicsBeginImageContext(imgView.frame.size) // 位图上下文绘制区域
        imgView.image?.draw(in: imgView.bounds)
        
        let context:CGContext = UIGraphicsGetCurrentContext()!
        
        context.setLineCap(CGLineCap.square)
        
        let lengths:[CGFloat] = [10,20] // 绘制 跳过 无限循环
        
        context.setStrokeColor(UIColor.red.cgColor)
        context.setLineWidth(2)
        context.setLineDash(phase: 0, lengths: lengths)
        context.move(to: CGPoint(x: 0, y: 10))
        context.addLine(to: CGPoint(x: self.view.frame.width, y: 10))
        context.strokePath()
        
        context.setStrokeColor(UIColor.blue.cgColor)
        context.setLineWidth(2)
        context.setLineDash(phase: 0, lengths: lengths)
        context.move(to: CGPoint(x: 15, y: 10))
        context.addLine(to: CGPoint(x: self.view.frame.width, y: 10))
        context.strokePath()
        
 
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        
    }
    
    func setUp4() {
        
        let lineView:UIView = UIView(frame: CGRect(x: 0, y: 300, width: self.view.frame.width, height: 20))
        self.view.addSubview(lineView)
        
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        
        shapeLayer.bounds = lineView.bounds
        
        shapeLayer.position = CGPoint(x: lineView.frame.width / 2, y: lineView.frame.height / 2)
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        shapeLayer.strokeColor = UIColor.red.cgColor
        
        shapeLayer.lineWidth = 5
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineDashPhase = 0
        shapeLayer.lineDashPattern = [NSNumber(value: 10), NSNumber(value: 20)]
        
        let path:CGMutablePath = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 10))
        path.addLine(to: CGPoint(x: lineView.frame.width, y: 10))
        shapeLayer.path = path
        
        lineView.layer.addSublayer(shapeLayer)
        
    }

}

