//
//  TextView.h
//  ShuffleAnimation
//
//  Created by FlyElephant on 17/3/8.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextView : UIView<CAAnimationDelegate>

@property (strong, nonatomic) NSMutableArray *data;

@property (strong, nonatomic) id associatedObject;

@end
