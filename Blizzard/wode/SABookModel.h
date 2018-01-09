//
//  SABookModel.h
//  Blizzard
//
//  Created by slcf888 on 2017/12/6.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SABookModel : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, assign) NSInteger count;

@end
