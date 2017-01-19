//
//  ViewController.swift
//  3-GrayImage
//
//  Created by FlyElephant on 17/1/18.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var firstImgView: UIImageView!
    
    @IBOutlet weak var nextImagView: UIImageView!
    
    
    @IBOutlet weak var lastImgView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image:UIImage = UIImage.init(named: "test.jpeg")!
        
        self.firstImgView.image = image
        
        self.nextImagView.image = image.grayImage()
        
        self.lastImgView.image = image.grayImage0()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

