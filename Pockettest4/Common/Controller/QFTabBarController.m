//
//  QFTabBarController.m
//  QFPocketKitchen
//
//  Created by 郭存 on 15-9-21.
//  Copyright (c) 2015年 lucius. All rights reserved.
//

#import "QFTabBarController.h"
#import "QFTabbarButton.h"
#import "QFTabBar.h"
#import "QFCompetitiveController.h"
#import "QFCookBookController.h"
#import "QFSoupController.h"
#import "QFProfileController.h"
#import "QFNavigationController.h"
@interface QFTabBarController ()
@property(nonatomic,strong)QFTabBar *afTabBar;
@end

@implementation QFTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"1");
    // Do any additional setup after loading the view.
    [self createInit];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"2");
    
    NSLog(@"------>%@", self.tabBar.subviews);
    
    // 清除tabbar的子view
        if (!_afTabBar) {
            for (UIView *view in self.tabBar.subviews) {
                [view removeFromSuperview];
            }

            
        QFTabBar *tabBar=[[QFTabBar alloc]initWithFrame:self.tabBar.bounds];//注意tabbar的定位
        //将我们controller传到自定义的tabbar里
        _afTabBar=tabBar;
        tabBar.controllers=self.childViewControllers;
        
        __weak typeof(self) ws=self;
        tabBar.btnOnClick=^(NSInteger index){
            //注意用法，不能直接用sefl,会造成循环引用
            ws.selectedIndex=index;
        };
        //添加到我们系统的tabbar里
        [self.tabBar addSubview:tabBar];
    }
   
        
}


// 初始化界面
- (void)createInit
{
    // 3创建子标签
    // 3.1创建菜谱标签
    [self createControllersWithTitle:@"菜谱"
                               image:@"tab_cookbook"
                       selectedImage:@"tab_cookbook_hl" className:[QFCookBookController class]];
    // 3.2创建精品标签
    [self createControllersWithTitle:@"精品会"
                               image:@"tab_explore"
                       selectedImage:@"tab_explore_hl" className:[QFCompetitiveController class]];
    // 3.3创建卖汤汤标签
    [self createControllersWithTitle:@"卖汤汤"
                               image:@"tab_plaza"
                       selectedImage:@"tab_plaza_hl" className:[QFSoupController class]];
    // 3.4创建我的标签
    [self createControllersWithTitle:@"我的"
                               image:@"tab_aboutme"
                       selectedImage:@"tab_aboutme_hl" className:[QFProfileController class]];
}

// 提取公共方法
- (void)createControllersWithTitle:(NSString *)title
                             image:(NSString *)image
                     selectedImage:(NSString *)selectedImage className:(Class)class
{
    // 1.创建vc
    UIViewController *vc = [[class alloc] init];
    vc.title = title;
    // 2.添加到nav
    QFNavigationController *nav = [[QFNavigationController alloc] initWithRootViewController:vc];
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 3.添加到tabbarVC
    [self addChildViewController:nav];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
