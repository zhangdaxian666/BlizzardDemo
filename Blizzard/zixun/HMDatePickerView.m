//
//  HMDatePickerView.m
//  Blizzard
//
//  Created by slcf888 on 2017/12/5.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "HMDatePickerView.h"

@interface HMDatePickerView ()
{
    NSString *_dateStr;
}
@property (nonatomic, strong) UIDatePicker *hmDatePicker;
@end

@implementation HMDatePickerView

- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        self.backgroundColor =[UIColor colorWithWhite:0.227 alpha:0.5];
    }
    return self;
}
//   选择器
- (void)configuration{
    UIView *dateBgView =[[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-244, self.frame.size.width, 200)];
    dateBgView.backgroundColor =[UIColor whiteColor];
    [self addSubview:dateBgView];
    
    UIButton *commitBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    commitBtn.frame =CGRectMake(dateBgView.bounds.size.width-50, 0, 40, 30);
    commitBtn.tag =1;
    commitBtn.titleLabel.font =[UIFont systemFontOfSize:14];
    [commitBtn setTitle:@"确定" forState:UIControlStateNormal];
    [commitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [commitBtn addTarget:self action:@selector(pressentPickerView) forControlEvents:UIControlEventTouchUpInside];
    [dateBgView addSubview:commitBtn];
    
    UIButton *cancelBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame =CGRectMake(10, 0, 40, 30);
    cancelBtn.tag =1;
    cancelBtn.titleLabel.font =[UIFont systemFontOfSize:14];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(pressentPickerViewT) forControlEvents:UIControlEventTouchUpInside];
    [dateBgView addSubview:cancelBtn];
    
    UIDatePicker *datePicker =[[UIDatePicker alloc]initWithFrame:CGRectMake(0, 38, [UIScreen mainScreen].bounds.size.width, 162)];
    datePicker.datePickerMode =UIDatePickerModeDate;
    [datePicker setValue:[UIColor magentaColor] forKey:@"textColor"];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:[datePicker bounds]];
    imageView1.image = [UIImage imageNamed:@"phoneimage"];
    [datePicker addSubview:imageView1];
    [datePicker sendSubviewToBack:imageView1];
    NSDate *currentDate =[NSDate date];
//   判断的按钮颜色
    if (self.fontColor) {
        [commitBtn setTitleColor:self.fontColor forState:UIControlStateNormal];
        [cancelBtn setTitleColor:self.fontColor forState:UIControlStateNormal];
    }
    //设置默认日期
    if (!self.date) {
        self.date =currentDate;
    }
    datePicker.date =self.date;
    //日期格式
    NSDateFormatter *formater =[[NSDateFormatter alloc]init];
    [formater setDateFormat:@"yyyy-MM-dd"];
    
    _dateStr =[formater stringFromDate:self.date];
    NSString *tempStr =[formater stringFromDate:self.date];
    NSArray *dateArray =[tempStr componentsSeparatedByString:@"-"];
    //设置日期选择区最大可选日期
    if (self.maxYear) {
        NSInteger maxYear =[dateArray[0] integerValue] -self.maxYear;
        NSString *maxStr =[NSString stringWithFormat:@"%ld-%@-%@",maxYear,dateArray[1],dateArray[2]];
        NSDate *maxDate =[formater dateFromString:maxStr];
        datePicker.maximumDate =maxDate;
    }
    //设置日期选择器最小可选日期
    if (self.minYear) {
        NSInteger minYear =[dateArray[0] integerValue] -self.minYear;
        NSString *minStr =[NSString stringWithFormat:@"%ld-%@-%@",minYear,dateArray[1],dateArray[2]];
        NSDate *minDate =[formater dateFromString:minStr];
        datePicker.minimumDate =minDate;
    }
    [dateBgView addSubview:datePicker];
    self.hmDatePicker =datePicker;
    
    [self.hmDatePicker addTarget:self action:@selector(selectDate:) forControlEvents:UIControlEventValueChanged];
}
#pragma 时间选择器的确定和取消
//- (void)pressentPickerView:(UIButton *)button{
//    if (button.tag ==1) {
//        self.completeBlock(_dateStr);
//    }
//    [self removeFromSuperview];
//}
- (void)pressentPickerView{
    self.completeBlock(_dateStr);
    [self removeFromSuperview];
}
- (void)pressentPickerViewT{[self removeFromSuperview];}
#pragma 时间选择器日期改变
- (void)selectDate:(id)sender{
    NSDateFormatter *outputFormatter =[[NSDateFormatter alloc]init];
    [outputFormatter setDateFormat:@"yyyy-MM-dd"];
    _dateStr =[outputFormatter stringFromDate:self.hmDatePicker.date];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
