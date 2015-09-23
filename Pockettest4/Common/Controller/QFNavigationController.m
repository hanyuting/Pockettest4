//
//  QFNavigationController.m
//  QFPocketKitchen
//
//  Created by 郭存 on 15-9-21.
//  Copyright (c) 2015年 lucius. All rights reserved.
//

#import "QFNavigationController.h"

@interface QFNavigationController ()

@end

@implementation QFNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //更改navbar的背景颜色。
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"PK_top_bg"] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor whiteColor]};
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
