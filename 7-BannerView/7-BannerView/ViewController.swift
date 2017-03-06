//
//  ViewController.swift
//  7-BannerView
//
//  Created by keso on 2017/3/5.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pageControl:UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: SetUp
    
    func setUp() {
        let carouselView:CarouselView = CarouselView(frame: CGRect(x: 0, y: 100, width: self.view.frame.width, height: 200))
        let imgNames:[String] = ["Beauty1.jpg", "Beauty2.jpg" , "Beauty3.jpg"]
        carouselView.setUp(imageNames: imgNames)
        self.view.addSubview(carouselView)
        
       // let bannerView:BannerView = BannerView(frame: CGRect(x: 0, y: 100, width: self.view.frame.width, height: 200))
        //let imgNames:[String] = ["Beauty1.jpg", "Beauty2.jpg" , "Beauty3.jpg"]
        //bannerView.setUp(imageNames: imgNames)
        //self.view.addSubview(bannerView)
    }


}

