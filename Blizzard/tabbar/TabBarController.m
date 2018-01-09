//
//  TabBarController.m
//  Blizzard
//
//  Created by slcf888 on 2017/12/1.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "TabBarController.h"
#import "ZQTabBar.h"
@interface TabBarController () <UITabBarControllerDelegate>

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
//    ZQTabBar *tabBar = [[ZQTabBar alloc]init];
//    [self setValue:tabBar forKey:@"tabBar"];
    self.delegate =self;
    // Do any additional setup after loading the view.
}
//- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
//{
//
//}
//- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
//{
//    if ([tabBarController.selectedViewController
//         isEqual:viewController] &&tabBarController.selectedIndex ==0) {
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"ZQTabBarButtonDidRepeatClickNotification" object:nil];
//    }
//    return YES;
//}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;
{
    NSLog(@"%ld",tabBarController.selectedIndex);
    
    [ [NSNotificationCenter defaultCenter] postNotificationName:@"DXDTabBarDidSelectNotification" object:nil userInfo:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation
https://github.com/yixiangboy/IOSAnimationDemo 动画特效
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
