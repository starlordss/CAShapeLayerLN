//
//  ViewController.m
//  CircleProgress
//
//  Created by Zahi on 2017/9/16.
//  Copyright © 2017年 Zahi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    UIBezierPath *_path;
    CAGradientLayer *_gradinetLayer;
    CAShapeLayer *_shapeLayer;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.view.center.x, self.view.center.y) radius:100 startAngle:M_PI endAngle:-M_PI clockwise:NO];
    
    [self show];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self startAnimate];
}

- (void)show {

    
    
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    shapeLayer.lineCap = @"round";
    
    shapeLayer.frame = self.view.bounds;
    
    shapeLayer.path = _path.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    
    shapeLayer.opacity = 0.6f;
    
    shapeLayer.lineWidth = 20.f;
    
    [self.view.layer addSublayer:shapeLayer];

}

- (void)startAnimate {

    CAShapeLayer *shapeLayer = [CAShapeLayer new];

    _shapeLayer = shapeLayer;
    shapeLayer.frame = self.view.bounds;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
    shapeLayer.lineWidth = 20.f;
    shapeLayer.lineCap = @"round";
    shapeLayer.path = _path.CGPath;
    
    // 创建颜色渐变数组
    NSMutableArray *colors = [NSMutableArray array];
    
    for (int i = 0; i <= 360; i += 50) {
        
        UIColor *color = [UIColor colorWithHue:i / 360.0 saturation:1.f brightness:1.f alpha:1.f];
        
        [colors addObject:(id)(color.CGColor)];
    }
    
    // 渐变层
    CAGradientLayer *gradinetLayer = [CAGradientLayer layer];
    _gradinetLayer = gradinetLayer;
    gradinetLayer.frame = self.view.bounds;
    gradinetLayer.colors = colors;
    gradinetLayer.mask = shapeLayer;
    
    gradinetLayer.startPoint = CGPointMake(0.5, 0);
    gradinetLayer.endPoint = CGPointMake(0.5, 1);
    
    [self.view.layer addSublayer:gradinetLayer];
    
    // 定时器实现动画
    shapeLayer.strokeStart = 0.f;
    shapeLayer.strokeEnd = 0.f;
    __block CGFloat end = 0;
    
    [NSTimer scheduledTimerWithTimeInterval:0.2f repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        end += 0.1f;
        
        if (end >= 1) [timer invalidate];
        
        shapeLayer.strokeEnd = end;

    }];
    
    // 核心动画实现动画
//    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    anim.duration = 1.f;
//    anim.fromValue = @0.f;
//    anim.toValue = @1.f;
//    [shapeLayer addAnimation:anim forKey:@"abc"];
    
}



@end
