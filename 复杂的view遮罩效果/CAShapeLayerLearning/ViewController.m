//
//  ViewController.m
//  CAShapeLayerLearning
//
//  Created by Zahi on 2017/9/16.
//  Copyright © 2017年 Zahi. All rights reserved.
//

#import "ViewController.h"
#import "CAShapeLayer+MaskLayer.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, 400)];
    
    view.center = self.view.center;
    
    [self.view addSubview:view];
    
    view.backgroundColor = [UIColor cyanColor];
    
    view.layer.mask = [CAShapeLayer maskLayerWithView:view];
}

@end
