//
//  SnowflaksView.m
//  Blizzard
//
//  Created by slcf888 on 2017/12/6.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "SnowflaksView.h"
@interface SnowflaksView ()
@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) NSString *snowImageName;
@end
@implementation SnowflaksView

// 各种赋值
+ (instancetype)snowflakesFallingViewBackgorundImageName:(NSString *)bgImageName snowImageName:(NSString *)snowImagename frame:(CGRect)frame
{
    SnowflaksView *view =[[SnowflaksView alloc]initWithFrame:frame];
    view.bgImageView.image =[UIImage imageNamed:bgImageName];
    view.snowImageName =snowImagename;
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        self.clipsToBounds =YES;
    //  添加背景图片的imageview
        self.bgImageView =[[UIImageView alloc]init];
        self.bgImageView.frame =self.bounds;
        self.bgImageView.contentMode =UIViewContentModeScaleToFill;
        [self addSubview:self.bgImageView];
    }
    return self;
}

// 开始CADisplayLink定时器和NSTimer不同
- (void)baginSnow{
    //不能手动调用- (void)drawRect:(CGRect)rect
    //启动定时器，使得一直调用setNeedDisplay从而被动调用
    CADisplayLink *link =[CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}
- (void)drawRect:(CGRect)rect
{
    //控制雪花的个数
    if (self.subviews.count >300) {
        return;
    }
    //雪花的宽度
    int width =arc4random()%20;
    while (width <15) {
        width =arc4random()%20;
    }
    //雪花速度
    int speed =arc4random()%15;
    while (speed <5) {
        speed =arc4random()%15;
    }
    //雪花起点 Y
    int startY = -(arc4random()%100);
    //雪花起点 X
    int startX = arc4random()% (int)[UIScreen mainScreen].bounds.size.width;
    //雪花终点
    int endx = arc4random()% (int)[UIScreen mainScreen].bounds.size.width;
    
    UIImageView *imageView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:self.snowImageName]];
    imageView.frame =CGRectMake(startX, startY, width, width);
    [self addSubview:imageView];
    // 动画 雪花最终的位置 以及雪花的旋转
    [UIView animateWithDuration:speed animations:^{
        imageView.frame =CGRectMake(endx, [UIScreen mainScreen].bounds.size.height, width, width);
        imageView.transform =CGAffineTransformRotate(imageView.transform, M_PI);
        imageView.alpha =0.3;
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
