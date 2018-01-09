//
//  RecommendController.m
//  Blizzard
//
//  Created by slcf888 on 2017/12/1.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "RecommendController.h"
#import "SnowflaksView.h"
@interface RecommendController ()

@end

@implementation RecommendController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    SnowflaksView *snowView =[SnowflaksView snowflakesFallingViewBackgorundImageName:@"phoneimage" snowImageName:@"snow" frame:self.view.bounds];
    [snowView baginSnow];
    [self.view addSubview:snowView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
