//
//  BookModelCell.h
//  Blizzard
//
//  Created by slcf888 on 2017/12/7.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SABookModel;

@interface BookModelCell : UITableViewCell

@property (nonatomic, strong) SABookModel *bookModel;

@property (weak, nonatomic) IBOutlet UIImageView *iconImg;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UIButton *minusBtn;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@end
