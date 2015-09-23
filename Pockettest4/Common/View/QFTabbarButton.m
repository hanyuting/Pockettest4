//
//  QFTabbarButton.m
//  Pockettest4
//
//  Created by qianfeng on 15/9/22.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "QFTabbarButton.h"
#define RATIO 0.4
@implementation QFTabbarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        self.titleLabel.font=[UIFont systemFontOfSize:13.0f];
    }
    return self;
}
//返回文字的frame
-(CGRect)titleRectForContentRect:(CGRect)contentRect{

    return CGRectMake(0, self.frame.size.height*(1-RATIO), self.frame.size.width, self.frame.size.height*RATIO);
}
//返回图片的frame
//-(CGRect)imageRectForContentRect:(CGRect)contentRect{
//
//
//}
@end
