//
//  QFTabBar.m
//  QFPocketKitchen
//
//  Created by 郭存 on 15-9-21.
//  Copyright (c) 2015年 lucius. All rights reserved.
//

#import "QFTabBar.h"
#import "QFTabbarButton.h"
@implementation QFTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
        
        
    }
    return self;
}

-(void)setControllers:(NSArray *)controllers{

    _controllers=controllers;
     [self createInit];
}

-(void)createInit{
    // 添加button
    // 拿到controller的个数
    NSInteger count = self.controllers.count;
    // 计算btn的宽度
    CGFloat btnW = self.frame.size.width / count;
    //
    for (int i = 0; i < count; i ++) {
        // 拿到标签页
        UINavigationController *nav = _controllers[i];
        
        QFTabbarButton *btn = [[QFTabbarButton alloc] initWithFrame:CGRectMake(btnW * i, 0, btnW, 49)];
        btn.backgroundColor = [UIColor redColor];
        // 用标签的title赋值给btn
        [btn setTitle:nav.tabBarItem.title forState:UIControlStateNormal];
        //设置字体颜色
        [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        // 拿到image
        [btn setBackgroundImage:nav.tabBarItem.image forState:UIControlStateNormal];
        // [btn setBackgroundImage:nav.tabBarItem.image forState:UIControlStateHighlighted];
        // 拿到selectedImage
        [btn setBackgroundImage:nav.tabBarItem.selectedImage forState:UIControlStateSelected];
        // 给btn添加响应事件
        [btn addTarget:self action:@selector(btnDidSelected:) forControlEvents:UIControlEventTouchUpInside];
        // 去除高亮
        [btn setAdjustsImageWhenHighlighted:NO];
        // 添加tag值
        btn.tag = 1000 + i;
        
        if (i == 0) {
            btn.selected = YES;
        }
        
        [self addSubview:btn];
    }



}
 

- (void)btnDidSelected:(UIButton *)sender
{
    //NSLog(@"------>%@", self.tabBar.subviews);
    // 遍历tabbar的子控件
    for (UIView *view in self.subviews) {
        // 判断是不是uibutton
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)view;
            if (btn.tag == sender.tag) {
                btn.selected = YES;
            }else {
                btn.selected = NO;
            }
        }
    }
    if (_btnOnClick) {
        _btnOnClick(sender.tag-1000);
    }
    
    //self.selectedIndex = sender.tag - 1000;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
