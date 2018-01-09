//  http://www.cocoachina.com/ios/20170124/18617.html
//  ZoneController.m
//  Blizzard
//
//  Created by slcf888 on 2017/12/1.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "ZoneController.h"
#import "greenView.h"

@interface ZoneController () <CAAnimationDelegate>

@property (nonatomic, strong) UIImageView *ballView;

@property (nonatomic, strong) UIImageView *ballViewTwo;

@end

@implementation ZoneController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor =[UIColor whiteColor];
    [self greenView];
    [self imageView];
    
    UIImage *ballImage =[UIImage imageNamed:@"timg"];
    self.ballView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    self.ballView.center =CGPointMake(150, -30);
    self.ballView.image =ballImage;
    self.ballView.contentMode =UIViewContentModeScaleAspectFill;
    [self.view addSubview:self.ballView];
    
    self.ballViewTwo =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    self.ballViewTwo.center =CGPointMake(240, -130);
    self.ballViewTwo.image =ballImage;
    self.ballViewTwo.contentMode =UIViewContentModeScaleAspectFill;
    [self.view addSubview:self.ballViewTwo];
    
    UIView *view =[[UIView alloc] initWithFrame:CGRectMake(0, 590, CGRectGetWidth(self.view.bounds), 2)];
    view.backgroundColor =[UIColor redColor];
    [self.view addSubview:view];
    
    
    
    // Do any additional setup after loading the view.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.ballView.center =CGPointMake(150, 32);
    CAKeyframeAnimation *animation =[CAKeyframeAnimation animation];
    animation.keyPath =@"position";
    animation.duration =1.0;
    animation.delegate =self;
    animation.values =@[[NSValue valueWithCGPoint:CGPointMake(150,32)],
                        [NSValue valueWithCGPoint:CGPointMake(150,568)],
                        [NSValue valueWithCGPoint:CGPointMake(150,240)],
                        [NSValue valueWithCGPoint:CGPointMake(150,568)],
                        [NSValue valueWithCGPoint:CGPointMake(150,320)],
                        [NSValue valueWithCGPoint:CGPointMake(150,568)],
                        [NSValue valueWithCGPoint:CGPointMake(150,450)],
                        [NSValue valueWithCGPoint:CGPointMake(150,568)]];
    animation.timingFunctions =@[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    //  设置每个关键帧的时长
    animation.keyTimes =@[@0.0, @0.3,@0.5, @0.7,@0.8, @0.9,@0.95, @1.0]; // 位置    arc4random()%375  换150
    self.ballView.layer.position =CGPointMake(150, 568);
    CABasicAnimation *animationl =[CABasicAnimation animation];
    animationl.keyPath =@"transform.rotation.z";
    animationl.repeatCount =100;
    animationl.duration =0.5;
    animationl.speed =1.5;
    animationl.toValue =@(M_PI*2);
    
    CAAnimationGroup * group = [CAAnimationGroup animation];
    group.animations =@[animation,animationl];
    group.duration = animation.duration;
    group.speed =0.2;
    
    [self.ballView.layer addAnimation:group forKey:nil];
    
    
  // xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    
    self.ballViewTwo.center =CGPointMake(240, 32);
    CAKeyframeAnimation *animationTwo =[CAKeyframeAnimation animation];
    animationTwo.keyPath =@"position";
    animationTwo.duration =1.0;
    animationTwo.delegate =self;
    animationTwo.values =@[[NSValue valueWithCGPoint:CGPointMake(240,32)],
                        [NSValue valueWithCGPoint:CGPointMake(240,568)],
                        [NSValue valueWithCGPoint:CGPointMake(240,240)],
                        [NSValue valueWithCGPoint:CGPointMake(240,568)],
                        [NSValue valueWithCGPoint:CGPointMake(240,360)],
                        [NSValue valueWithCGPoint:CGPointMake(240,568)],
                        [NSValue valueWithCGPoint:CGPointMake(240,500)],
                        [NSValue valueWithCGPoint:CGPointMake(240,568)]];
    animationTwo.timingFunctions =@[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    //  设置每个关键帧的时长
    animationTwo.keyTimes =@[@0.0, @0.3,@0.5, @0.7,@0.8, @0.9,@0.95, @1.0];
    self.ballViewTwo.layer.position =CGPointMake(240, 568);
    CABasicAnimation *animationlw =[CABasicAnimation animation];
    animationlw.keyPath =@"transform.rotation.z";
    animationlw.repeatCount =100;
    animationlw.duration =3.5;
    animationlw.speed =1.5;
    animationlw.toValue =@(M_PI*2);
    CAAnimationGroup * groupTwo = [CAAnimationGroup animation];
    groupTwo.animations =@[animationTwo,animationlw];
    groupTwo.duration = animationTwo.duration;
    groupTwo.speed =0.1;
    [self.ballViewTwo.layer addAnimation:groupTwo forKey:nil];

}






- (void)greenView{

    greenView *snowView =[[greenView alloc]initWithFrame:CGRectMake(30, 200, 100, 100)];
    [self.view addSubview:snowView];
}
- (void)imageView{
    UIImageView *imageNmae =[[UIImageView alloc]initWithFrame:CGRectMake(230, 300, 100, 100)];
    imageNmae.image =[UIImage imageNamed:@"timg-1"];
    [self.view addSubview:imageNmae];
    CABasicAnimation *animation =  [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = [NSNumber numberWithFloat:0.f];
    animation.toValue =  [NSNumber numberWithFloat: M_PI *2];
    animation.duration  = 3;
    animation.autoreverses = NO;
    animation.speed =4.0;
    animation.fillMode =kCAFillModeForwards;
    animation.repeatCount = MAXFLOAT;
    [imageNmae.layer addAnimation:animation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation
www.cocoachina.com/ios/20160323/15770.html
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
