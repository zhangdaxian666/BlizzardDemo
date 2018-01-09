//
//  InformationController.h
//  Blizzard
//
//  Created by slcf888 on 2017/12/5.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InformationController : UIViewController <UIImagePickerControllerDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) UIActionSheet *actionSheet;
@end
