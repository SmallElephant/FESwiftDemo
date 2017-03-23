//
//  TextView.m
//  ShuffleAnimation
//
//  Created by FlyElephant on 17/3/8.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "TextView.h"

@interface TextView()

@end

@implementation TextView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}


- (void)tap:(id)sender {
    NSLog(@"Text--点击之后的数据--%@---Tag:%ld",self.data,self.tag);
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    UIView *view = [anim valueForKey:@"commonView"];
    if (view) {
        NSValue *positionValue =  [anim valueForKey:@"position"];
        NSLog(@"textview执行啦--%@",positionValue);
        view.layer.position = positionValue.CGPointValue;
        [view.layer removeAllAnimations];
    }
}


@end
