//
//  SnowflaksView.h
//  Blizzard
//
//  Created by slcf888 on 2017/12/6.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SnowflaksView : UIView
/*雪花效果的view
 bgImagename背景图片名字
 snowImagename雪花图片名字
 */
+ (instancetype)snowflakesFallingViewBackgorundImageName:(NSString *)bgImageName snowImageName:(NSString *)snowImagename frame:(CGRect)frame;
//开始
- (void)baginSnow;
@end
