//http://www.code4app.com/article/cocoapods-install-usage
//  NewsController.m
//  Blizzard http://blog.cocoachina.com/article/29127
//
//  Created by slcf888 on 2017/12/5.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "InformationController.h"
#import "HMDatePickerView.h"

@interface InformationController ()

@property (nonatomic, strong) UIButton *dateBtn;
@property (nonatomic, copy) NSString *dateStr;
@end

@implementation InformationController

@synthesize actionSheet =_actionSheet;
- (void)viewDidLoad {
    [super viewDidLoad];
    _dateBtn =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _dateBtn.frame =CGRectMake(100, 100, 200, 50);
    _dateBtn.backgroundColor =[UIColor greenColor];
    [_dateBtn setTitle:@"点点" forState:UIControlStateNormal];
    [_dateBtn addTarget:self action:@selector(dateBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_dateBtn];
    
    self.headImage =[[UIImageView alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
    self.headImage.userInteractionEnabled =YES;
    self.headImage.layer.cornerRadius =50;
//    self.headImage.clipsToBounds =NO; contentMode
    self.headImage.layer.masksToBounds =YES;
    self.headImage.backgroundColor =[UIColor yellowColor];
     UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickPlickImage)];
    [self.headImage addGestureRecognizer:tap];
    [self.view addSubview:self.headImage];
    
    [self nameLabel];
    
    // Do any additional setup after loading the view.
}
- (void)dateBtnClick{
   //自定义日期选择器 
    HMDatePickerView *datePickVC =[[HMDatePickerView alloc]initWithFrame:self.view.frame];
    datePickVC.maxYear = -1; //
    datePickVC.date =[NSDate date];
    datePickVC.fontColor =[UIColor redColor];
    //日期回调
    datePickVC.completeBlock = ^(NSString *selectDate) {
        [self.dateBtn setTitle:selectDate forState:UIControlStateNormal];
    };
    [datePickVC configuration]; //调取
    [self.view addSubview:datePickVC];
}




#pragma 图片
- (void)clickPlickImage{
    [self callActionSheetFunc];
}
- (void)callActionSheetFunc{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        self.actionSheet =[[UIActionSheet alloc]initWithTitle:@"选择图像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从相册选择", nil];
    }else{
        self.actionSheet =[[UIActionSheet alloc]initWithTitle:@"选择图像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从相册选择", nil];
    }
    self.actionSheet.tag =100;
    [self.actionSheet showInView:self.view];
}
//点击某个按钮调用，此调用返回后视图自动删除
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (actionSheet.tag == 100) {
        NSUInteger sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        // 判断是否支持相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            switch (buttonIndex) {
                case 0:
                    //来源:相机
                    sourceType = UIImagePickerControllerSourceTypeCamera;
                    break;
                case 1:
                    //来源:相册
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    break;
                case 2:
                    return;
            }
        }
        else {
            if (buttonIndex == 2) {
                return;
            } else {
                sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            }
        }
        // 跳转到相机或相册页面
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = YES;
        imagePickerController.sourceType = sourceType;
        
        [self presentViewController:imagePickerController animated:YES completion:^{
            
        }];
    }
}
//   选择完图片后自动调取
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];//获取图片
    UIImage *image =[info objectForKey:UIImagePickerControllerOriginalImage];
    self.headImage.image =image;
}


#pragma label的各种形式
- (void)nameLabel{
    UILabel *label =[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2, 350, 20, 200)];
    label.text =@"世上本无事庸人自扰之";
    label.numberOfLines =0;
    label.textColor =[UIColor purpleColor];// Helvetica-Bold
    label.font = [UIFont fontWithName:@"PingFangSC-Light" size:20];
    label.adjustsFontSizeToFitWidth =YES;
    //    label.minimumScaleFactor =0.5;
    [self.view addSubview:label];
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString     alloc]initWithString: @"CanIFuckyou?"];
    [attributeString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:40],NSForegroundColorAttributeName:[UIColor redColor]} range:NSMakeRange(0, 1)];
    [attributeString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor purpleColor]} range:NSMakeRange(1, 4)];
    [attributeString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:25],NSForegroundColorAttributeName:[UIColor greenColor]} range:NSMakeRange(5, 3)];
    UILabel *name =[[UILabel alloc]initWithFrame:CGRectMake(100, 350, 20, 300)];
    name.attributedText =attributeString;
    name.numberOfLines =0;
    [self.view addSubview:name];
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
