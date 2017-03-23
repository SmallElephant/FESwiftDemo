//
//  ViewController.m
//  ShuffleAnimation
//
//  Created by FlyElephant on 17/3/8.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"
#import "TextView.h"

static NSString * const kFormViewKeyCommonView = @"commonView";
static NSString * const kFormViewKeyPosition = @"position";

@interface ViewController ()<CAAnimationDelegate>

@property (strong, nonatomic) TestView *view1;

@property (strong, nonatomic) TextView *view2;

@property (assign, nonatomic) CGPoint upPoint;

@property (assign, nonatomic) CGPoint downPoint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:@"test" forKey:@"11"];
    [dict setValue:@"test1" forKey:@"2"];
    NSLog(@"%@",dict);
    
    
    NSDictionary *dict1 = [[NSDictionary alloc] init];
    [dict setObject:@"11" forKey:@"22"];
    NSLog(@"%@",dict1);
    
    self.view1 = [[TestView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.view1.data = [[NSMutableArray alloc] initWithObjects:@"100",@"200", nil];
    self.view1.backgroundColor = [UIColor redColor];
    self.view1.tag = 100;
    [self.view addSubview:self.view1];
    
    self.view2 = [[TextView alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    self.view2.data = [[NSMutableArray alloc] initWithObjects:@"300",@"400", nil];
    self.view2.backgroundColor = [UIColor blueColor];
    self.view2.tag = 1000;
    [self.view addSubview:self.view2];
    
    self.upPoint = self.view1.layer.position;
    self.downPoint = self.view2.layer.position;
    
    NSMutableDictionary *mutableDict = [[NSMutableDictionary alloc] init];
    [mutableDict setValue:@"10" forKey:@"time"];
    [mutableDict setValue:@"1000" forKey:@"score"];
    
    NSString *result = [self dictionaryToString:mutableDict];
    NSLog(@"转换:%@",result);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    UIView *view = [anim valueForKey:kFormViewKeyCommonView];
    self.view1.userInteractionEnabled = YES;
    self.view2.userInteractionEnabled = YES;
    if (view) {
        view.layer.opacity = 1;
        NSValue *positionValue =  [anim valueForKey:kFormViewKeyPosition];
        view.layer.position = positionValue.CGPointValue;
        [view.layer removeAllAnimations];
    }
    
}

- (IBAction)makeAction:(UIButton *)sender {
    
    
    
   [self make];
}

- (void)make1 {
    NSLog(@"view1的数据%@",self.view1.data);
    NSLog(@"view2的数据%@",self.view2.data);
    
    for (int i = 0; i < 2; i++) {
        
        CGPoint originPosition = i == 0 ? self.view1.layer.position : self.view2.layer.position;
        CGPoint finalPostion = i == 0 ? self.downPoint : self.upPoint;
        
        
        CAKeyframeAnimation *positonAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        positonAnim.values = @[[NSValue valueWithCGPoint:originPosition],
                               [NSValue valueWithCGPoint:CGPointMake((originPosition.x + finalPostion.x) / 2, (originPosition.y + finalPostion.y) / 2)],
                               [NSValue valueWithCGPoint:finalPostion],
                               ];

        positonAnim.duration = 0.25;
        
        positonAnim.removedOnCompletion = NO;
        // 始终保持最新的效果
        positonAnim.fillMode = kCAFillModeForwards;

        if (i == 0) {
            self.view1.associatedObject = positonAnim;
        } else {
            self.view2.associatedObject = positonAnim;
        }
        
        
    }
    
    [self.view1.layer addAnimation:self.view1.associatedObject forKey:@"wave"];
    [self.view2.layer addAnimation:self.view2.associatedObject forKey:@"wave"];
    NSLog(@"view1的数据%@",self.view1.data);
    NSLog(@"view2的数据%@",self.view2.data);
}

- (void)make {
    NSLog(@"view1的数据%@",self.view1.data);
    NSLog(@"view2的数据%@",self.view2.data);
    
    for (int i = 0; i < 2; i++) {
        
        CGPoint originPosition = i == 0 ? self.view1.layer.position : self.view2.layer.position;
        CGPoint finalPostion = i == 0 ? self.downPoint : self.upPoint;
        
        
        CAKeyframeAnimation *positonAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        positonAnim.values = @[[NSValue valueWithCGPoint:originPosition],
                               [NSValue valueWithCGPoint:CGPointMake((originPosition.x + finalPostion.x) / 2, (originPosition.y + finalPostion.y) / 2)],
                               [NSValue valueWithCGPoint:finalPostion],
                               ];
        CAKeyframeAnimation *transformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
        transformAnim.values = @[@(1),@(0.7),@(1)];
        
        CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
        animationGroup.beginTime = CACurrentMediaTime();
        animationGroup.duration = 0.25;
        animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [animationGroup setAnimations:@[positonAnim, transformAnim]];
        animationGroup.removedOnCompletion = false;
        animationGroup.fillMode = kCAFillModeForwards;
       // animationGroup.delegate = self;
        
        if (i == 0) {
            animationGroup.delegate = self.view1;
        } else {
             animationGroup.delegate = self.view2;
        }
        

        if (i == 0) {
            [animationGroup setValue:self.view1 forKey:kFormViewKeyCommonView];
            self.view1.associatedObject = animationGroup;
        } else {
            [animationGroup setValue:self.view2 forKey:kFormViewKeyCommonView];
            self.view2.associatedObject = animationGroup;
        }
        [animationGroup setValue:[NSValue valueWithCGPoint:finalPostion] forKey:kFormViewKeyPosition];
        
    }
    
    [self.view1.layer addAnimation:self.view1.associatedObject forKey:@"randomMove"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.view2.layer addAnimation:self.view2.associatedObject forKey:@"randomMove"];
    });

    NSLog(@"view1的数据%@",self.view1.data);
    NSLog(@"view2的数据%@",self.view2.data);
}

- (NSString *)dictionaryToString:(NSDictionary *)dict {
        
        NSData *data = [NSJSONSerialization dataWithJSONObject:dict
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:NULL];
        NSString *content = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        return content;
}

@end
