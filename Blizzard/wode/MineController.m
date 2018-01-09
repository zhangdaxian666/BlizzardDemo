//
//  MineController.m
//  Blizzard
//
//  Created by slcf888 on 2017/12/1.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "MineController.h"
#import "SABookModel.h"
#import <MJExtension.h>
#import "BookModelCell.h"
@interface MineController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tableView;
}
@property (nonatomic,strong) NSMutableArray *  dataArr;
@end

@implementation MineController

- (void)viewDidLoad {
    [super viewDidLoad];
    tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64-44)];
    tableView.dataSource =self;
    tableView.delegate =self;
    [tableView registerNib:[UINib nibWithNibName:@"BookModelCell" bundle:nil] forCellReuseIdentifier:@"bookCell"];
    [self.view addSubview:tableView];
    // Do any additional setup after loading the view.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
}

- (UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BookModelCell *cell =[tableView dequeueReusableCellWithIdentifier:@"bookCell"];
    cell.bookModel = self.dataArr[indexPath.row];
    
    return cell;
    
}

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        
        _dataArr = [SABookModel mj_objectArrayWithFilename:@"books.plist"];
        
    }
    return _dataArr;
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
