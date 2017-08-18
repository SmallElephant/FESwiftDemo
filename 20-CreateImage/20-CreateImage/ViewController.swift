//
//  ViewController.swift
//  20-CreateImage
//
//  Created by FlyElephant on 2017/8/18.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func changeAction(_ sender: UIButton) {
        imgView.image = UIImage.from(color: .red)
    }


}

