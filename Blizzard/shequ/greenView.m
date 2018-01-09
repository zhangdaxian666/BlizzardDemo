//
//  greenView.m
//  Blizzard
//
//  Created by slcf888 on 2017/12/8.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "greenView.h"

@implementation greenView

- (instancetype)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    CALayer *layer = [CALayer layer];
    
    _redLayer = layer;
    
    layer.backgroundColor = [UIColor yellowColor].CGColor;
    
    layer.frame = CGRectMake(50, 50, 100, 100);
//    layer.cornerRadius =50;
    [self.layer addSublayer:_redLayer];
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.duration = 0.3;
    anim.keyPath = @"transform";
    NSValue *value =  [NSValue valueWithCATransform3D:CATransform3DMakeRotation((-15) / 180.0 * M_PI, 0, 0, 1)];
    NSValue *value1 =  [NSValue valueWithCATransform3D:CATransform3DMakeRotation((15) / 180.0 * M_PI, 0, 0, 1)];
    NSValue *value2 =  [NSValue valueWithCATransform3D:CATransform3DMakeRotation((-15) / 180.0 * M_PI, 0, 0, 1)];
    anim.values = @[value,value1,value2];
    
    anim.repeatCount = MAXFLOAT;
    
    [_redLayer addAnimation:anim forKey:nil];
 
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
