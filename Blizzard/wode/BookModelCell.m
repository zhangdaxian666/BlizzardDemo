//
//  BookModelCell.m
//  Blizzard
//
//  Created by slcf888 on 2017/12/7.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "BookModelCell.h"
#import "SABookModel.h"

@implementation BookModelCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)plusButton:(id)sender {
    self.bookModel.count ++;
    self.countLabel.text =[NSString stringWithFormat:@"%ld",self.bookModel.count];
    self.minusBtn.enabled =YES;
}
- (IBAction)minusButton:(id)sender {
    self.bookModel.count --;
    self.countLabel.text =[NSString stringWithFormat:@"%ld",self.bookModel.count];
    if (self.bookModel.count ==0) {
        self.minusBtn.enabled =NO;
    }
}
- (void)setBookModel:(SABookModel *)bookModel
{
    _bookModel =bookModel;
    
    self.iconImg.image =[UIImage imageNamed:bookModel.icon];
    self.nameLabel.text =bookModel.name;
    self.priceLabel.text = [NSString stringWithFormat:@"¥%@",bookModel.price];
    // 根据count决定countLabel显示文字
    self.countLabel.text = [NSString stringWithFormat:@"%ld",self.bookModel.count];
    // 根据count决定减号按钮是否能够被点击（如果不写这一行代码，会出现cell复用)
    self.minusBtn.enabled = (bookModel.count > 0);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
