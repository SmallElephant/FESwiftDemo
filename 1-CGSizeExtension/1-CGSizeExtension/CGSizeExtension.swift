//
//  CGSizeExtension.swift
//  1-CGSizeExtension
//
//  Created by FlyElephant on 16/12/16.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation
import UIKit

func *(size: CGSize,num: CGFloat)-> CGSize {
    return CGSize(width: num*size.width, height:num*size.height)
}

func /(size: CGSize,num: CGFloat)-> CGSize {
    return CGSize(width: size.width/num, height:size.height/num)
}

func +(size: CGSize,num: CGFloat)-> CGSize {
    return CGSize(width: num+size.width, height:num+size.height)
}

func -(size: CGSize,num: CGFloat)-> CGSize {
    return CGSize(width: size.width-num, height:size.height-num)
}

