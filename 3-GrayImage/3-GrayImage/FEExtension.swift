//
//  FEExtension.swift
//  3-GrayImage
//
//  Created by FlyElephant on 17/1/18.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    func grayImage() -> UIImage {
        
        let imageRef:CGImage = self.cgImage!
        
        let width:Int = imageRef.width
        let height:Int = imageRef.height
        
        let colorSpace:CGColorSpace = CGColorSpaceCreateDeviceGray()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue)
        let context:CGContext = CGContext(data: nil, width: width, height: height, bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!
        
        let rect:CGRect = CGRect.init(x: 0, y: 0, width: width, height: height)
        context.draw(imageRef, in: rect)
        let outPutImage:CGImage = context.makeImage()!
        
        let newImage:UIImage = UIImage.init(cgImage: outPutImage, scale: self.scale, orientation: self.imageOrientation)
        
        return newImage
    }
    
    func grayImage0() -> UIImage {
        
        let imageRef:CGImage = self.cgImage!
        
        let width:Int = imageRef.width
        let height:Int = imageRef.height
        
        let colorSpace:CGColorSpace = CGColorSpaceCreateDeviceGray()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue)
        let context:CGContext = CGContext(data: nil, width: width, height: height, bitsPerComponent: 8, bytesPerRow: 4 * width, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!
        
        let rect:CGRect = CGRect.init(x: 0, y: 0, width: width, height: height)
        context.draw(imageRef, in: rect)
        let outPutImage:CGImage = context.makeImage()!
        
        let newImage:UIImage = UIImage.init(cgImage: outPutImage, scale: self.scale, orientation: self.imageOrientation)
        
        return newImage
    }
}
