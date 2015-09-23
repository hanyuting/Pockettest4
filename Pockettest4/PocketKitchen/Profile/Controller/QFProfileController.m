//
//  QFProfileController.m
//  Pockettest4
//
//  Created by qianfeng on 15/9/22.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "QFProfileController.h"
#import "QFProfileModel.h"
#import "QFMacros.h"
#import "QFUserInfoViewController.h"
@interface QFProfileController()

@property(nonatomic,strong)UIImageView *bgView;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation QFProfileController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self creatData];
    [self creatUI];
    
    //更改navbar的背景颜色。
    //self.view.backgroundColor=[UIColor grayColor];
    // Do any additional setup after loading the view.
}

-(void)creatData{
    
        _dataArray=[NSMutableArray array];
    
    NSMutableArray *first=[NSMutableArray array];
    
    NSMutableArray *seconds=[NSMutableArray array];
    
    QFProfileModel *model=[[QFProfileModel alloc]init];
    
    model.imageName=@"me_info";
    model.title=@"我的信息";
    
    [first addObject:model];
    
    //创建第二个
    
    NSArray *titles=@[@"缓存数据",@"新书推荐",@"消息列表",@"意见反馈",@"给我ing分",@"关于我们"];
    NSArray *images=@[@"me_videocache",@"me_checkversion",@"me_msg",@"me_feedback",@"me_grade",@"me_about"];
    for ( int i=0; i<titles.count; i++) {
        QFProfileModel *model=[[QFProfileModel alloc]init];
        
        model.title=titles[i];
        model.imageName=images[i];
        
        [seconds addObject:model];
    }
    
    [_dataArray addObject:first];
    [_dataArray addObject:seconds];
}
-(void)creatUI{

    self.bgView.image=[UIImage imageNamed:@"homeview_bg"];

    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    

}

#pragma mark ***tableview 代理方法*
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return _dataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *item =_dataArray[section];
    return item.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifer=@"PROFILE";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    //获取数据
    NSArray *array=_dataArray[indexPath.section];
    QFProfileModel *model=array[indexPath.row];
    //给cell赋值
    cell.imageView.image=[UIImage imageNamed:model.imageName];
    cell.textLabel.text=model.title;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


    if (indexPath.section==0) {
        if (indexPath.row==0) {
            //页面跳转，跳转到登录页面
            QFUserInfoViewController *userInfo=[[QFUserInfoViewController alloc]init];
            
            userInfo.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:userInfo animated:YES];
            
            
        }
    }

}
#pragma mark **懒加载**
-(UIImageView *)bgView{

    if (!_bgView) {
        //注意，不能写成self.bgView=[[UIImageView alloc]initWithFrame:self.view.bounds];
        _bgView=[[UIImageView alloc]initWithFrame:self.view.bounds];
        [self.view addSubview:_bgView];
    }
    return _bgView;

}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64-49) style:UITableViewStyleGrouped];
        
        _tableView.backgroundColor=[UIColor clearColor];
        
        [self.view addSubview:_tableView];
    }

    
    return _tableView;

}
@end
