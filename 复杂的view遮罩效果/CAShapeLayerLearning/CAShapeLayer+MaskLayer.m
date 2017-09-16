//
//  CAShapeLayer+MaskLayer.m
//  CAShapeLayerLearning
//
//  Created by Zahi on 2017/9/16.
//  Copyright © 2017年 Zahi. All rights reserved.
//

#import "CAShapeLayer+MaskLayer.h"

@implementation CAShapeLayer (MaskLayer)

+ (instancetype)maskLayerWithView:(UIView *)view {
    
    // 宽
    CGFloat viewW = CGRectGetWidth(view.frame);
    // 高
    CGFloat viewH = CGRectGetHeight(view.frame);
    // 右边的间距
    CGFloat marginR = 20;
    // 顶部的间距
    CGFloat marginT= 30;
    // 点
    CGPoint p1 = CGPointMake(0, 0);
    
    CGPoint p2 = CGPointMake(viewW - marginR, 0);
    
    CGPoint p3 = CGPointMake(viewW - marginR, marginT);
    
    CGPoint p4 = CGPointMake(viewW, marginT);
    
    CGPoint p5 = CGPointMake(viewW - marginR, marginT + 10.f);
    
    CGPoint p6 = CGPointMake(viewW - marginR, viewH);
    
    CGPoint p7 = CGPointMake(0, viewH);
    
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:p1];
    [path addLineToPoint:p2];
    [path addLineToPoint:p3];
    [path addLineToPoint:p4];
    [path addLineToPoint:p5];
    [path addLineToPoint:p6];
    [path addLineToPoint:p7];
    
    [path closePath];
    
   
    CAShapeLayer *shapeLayer = [CAShapeLayer new];
    
    shapeLayer.path = path.CGPath;
    
    
    return shapeLayer;
    
}

@end
