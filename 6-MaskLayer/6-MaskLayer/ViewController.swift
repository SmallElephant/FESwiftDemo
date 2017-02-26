//
//  ViewController.swift
//  6-MaskLayer
//
//  Created by keso on 2017/2/26.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var backImgView:UIImageView!
    var frontImgView:UIImageView!
    var masklayer:CALayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    

    @IBAction func beginAnimation(_ sender: UIButton) {
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut, animations: { 
            self.masklayer.position = CGPoint(x: 50, y: 50)
        }) { (isfinished) in
            
        }
    }

    // MARK:- SetUp 
    
    private func setUp() {
        
        let imgFrame:CGRect = CGRect.init(x: 100, y: 200, width: 100, height: 100)
        self.backImgView = UIImageView.init(frame: imgFrame)
        self.backImgView.image = UIImage.init(named: "animal")?.grayImage()
        self.backImgView.contentMode = UIViewContentMode.scaleAspectFit;
        self.view.addSubview(self.backImgView)
        
        self.frontImgView = UIImageView.init(frame: imgFrame)
        self.frontImgView.image = UIImage.init(named: "animal")
        self.frontImgView.contentMode = UIViewContentMode.scaleAspectFit;
        self.view.addSubview(self.frontImgView)
        
        self.masklayer = CAShapeLayer()
        self.masklayer.frame = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        self.masklayer.position = CGPoint(x: 50, y: 150)
        self.masklayer.backgroundColor = UIColor.white.cgColor
        self.frontImgView.layer.mask = self.masklayer
    }
    
}

