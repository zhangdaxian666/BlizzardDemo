//
//  ZQTabBar.m
//  Blizzard
//
//  Created by slcf888 on 2017/12/6.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "ZQTabBar.h"

@implementation ZQTabBar

- (void)layoutSubviews
{
    [super layoutSubviews];
    for (UIControl *tabBarBtn in self.subviews) {
        if (![tabBarBtn isKindOfClass:NSClassFromString(@"UITabBarButton")])  continue;
            if (self.previousClickTabBarButton == nil) {
            self.previousClickTabBarButton = tabBarBtn;
        }
        [tabBarBtn addTarget:self action:@selector(TabBarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}
- (void)TabBarBtnClick:(UIControl *)tabBarBtn{
    if (self.previousClickTabBarButton ==tabBarBtn) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ZQTabBarButtonDidRepeatClickNotification" object:nil];
    }
    self.previousClickTabBarButton =tabBarBtn;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
