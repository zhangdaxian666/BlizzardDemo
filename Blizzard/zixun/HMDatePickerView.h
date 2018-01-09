//
//  HMDatePickerView.h
//  Blizzard
//
//  Created by slcf888 on 2017/12/5.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MyBlockType)(NSString *selectDate);

@interface HMDatePickerView : UIView
//距离当前日期最大年分差  最小年份差
@property (nonatomic, assign) NSInteger maxYear;
@property (nonatomic, assign) NSInteger minYear;
//显示日期   以及回调
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, copy) MyBlockType completeBlock;

@property (nonatomic, strong) UIColor *fontColor;
- (void)configuration;
@end
