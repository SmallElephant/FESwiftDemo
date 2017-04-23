//
//  ViewController.swift
//  14-Motion
//
//  Created by keso on 2017/4/23.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UIApplication.shared.applicationSupportsShakeToEdit = true
        self.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        
        let path:String? = Bundle.main.path(forResource: "shake", ofType: "mp3")
        
        if path != nil {
            var soundID:SystemSoundID?
            AudioServicesCreateSystemSoundID(URL.init(fileURLWithPath: path!) as CFURL,&soundID!)
            //播放声音
            AudioServicesPlaySystemSound(soundID!)
        }

        print("FlyElephant--motionBegan")
    }
    
    override func motionCancelled(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("FlyElephant---motionCancelled")
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("FlyElephant--motionEnded")
        
        if event?.subtype == UIEventSubtype.motionShake {
             print("FlyElephant--motionEnded")
        }

    }


}

