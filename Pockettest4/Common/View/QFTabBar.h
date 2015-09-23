//
//  QFTabBar.h
//  QFPocketKitchen
//
//  Created by 郭存 on 15-9-21.
//  Copyright (c) 2015年 lucius. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QFTabBar : UIView

@property(nonatomic,strong)NSArray *controllers;
@property(nonatomic,copy)void (^btnOnClick)(NSInteger index);
@end
