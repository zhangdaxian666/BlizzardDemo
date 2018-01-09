//
//  TableViewController.m
//  Blizzard
//
//  Created by slcf888 on 2017/12/7.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "constant.h"

@interface TableViewController ()
{
    UIImageView* tableheadView;
    UIButton* userImageButton;

    CGFloat tableviewHerderOriginY;
    CGFloat tableviewHeaderHeight;
    CGFloat userImageViewHeight;
    
    NSArray* dataSource;
}
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataSource = @[
                   @[@{@"title":@"个人收藏",@"image":@"MoreMyFavorites"}],
                   @[@{@"title":@"我的银行卡",@"image":@"MoreMyBankCard"},@{@"title":@"我的游戏",@"image":@"MoreGame"}],
                   @[@{@"title":@"系统设置",@"image":@"MoreSetting"},@{@"title":@"我的卡包",@"image":@"MyCardPackageIcon"}]
                   ];
    
    
    // 去掉tableView底部多余的表格线
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    
    self.automaticallyAdjustsScrollViewInsets =NO;
    
    [self.tableView setSeparatorColor:kCuttingLineColor];
    
    tableheadView= [[UIImageView alloc ]init];
    tableheadView.backgroundColor = kTableHeaderBgColor;
    
    userImageButton = [[UIButton alloc]init];
    userImageButton.layer.masksToBounds=YES;
    [userImageButton setBackgroundImage:[UIImage imageNamed:@"phoneimage"] forState:UIControlStateNormal];
    [tableheadView addSubview:userImageButton];
    
    self.tableView.tableHeaderView   =  [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kInitHeaderViewHeight)];
    
    tableviewHerderOriginY = kInitHeaderViewOriginY;
    tableviewHeaderHeight = kInitHeaderViewHeight;
    userImageViewHeight = kInitUserImageViewHeight;
    
    [self.tableView addSubview:tableheadView];
     
    // self.clearsSelectionOnViewWillAppear = NO;
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma 若是上面注册了cell，则下面用forIndexPath
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    // tableviewHerderOriginY
    tableheadView.frame = CGRectMake(0, tableviewHerderOriginY, [UIScreen mainScreen].bounds.size.width, tableviewHeaderHeight);
    userImageButton.frame =CGRectMake(0, 0, userImageViewHeight, userImageViewHeight);
    
    userImageButton.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, (kInitHeaderViewHeight - kInitUserImageViewHeight) / 2 + userImageViewHeight / 2 +30);
    
    
    userImageButton.layer.cornerRadius = userImageViewHeight / 2;
    
}

- (void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    if(scrollView.contentOffset.y < 0) {
        CGFloat offsetY = (scrollView.contentOffset.y + scrollView.contentInset.top) * -1;
        tableviewHerderOriginY = kInitHeaderViewOriginY + -1 *offsetY;
        tableviewHeaderHeight = kInitHeaderViewHeight + offsetY;
        
        userImageViewHeight = kInitUserImageViewHeight + offsetY;
        
    }
    else {
        
        [scrollView setContentOffset: CGPointMake(0, 0)];
        
    }
}



#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return dataSource.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSArray* arr = dataSource[section];
    return arr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"CCMeTableViewCell";
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil] firstObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    cell.ImageView.image = [UIImage imageNamed:dataSource[indexPath.section][indexPath.row][@"image"]];
    cell.titLabel.text = dataSource[indexPath.section][indexPath.row][@"title"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001f;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
