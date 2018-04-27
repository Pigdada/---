//
//  NormalTopTitleController.m
//  Animations
//
//  Created by 朱东阳 on2017/5/17.
//  Copyright © 2017年 YouXianMing. All rights reserved.
//

#import "NormalTopTitleController.h"
#import "UIView+SetRect.h"
#import "UIFont+Fonts.h"

@interface NormalTopTitleController ()

@end

@implementation NormalTopTitleController

- (void)makeViewsConfig:(NSMutableDictionary<NSString *,ControllerBaseViewConfig *> *)viewsConfig {
    
    
    CGFloat realHeight               = 64;
    CGFloat toolbarHeight            = self.tabBarController.tabBar.height;
    ControllerBaseViewConfig *contentViewConfig = viewsConfig[contentViewId];
    contentViewConfig.frame = CGRectMake(0, realHeight, Width, Height - realHeight - toolbarHeight);
    
    if (iPhoneX) {
        //        CGFloat statusBarHeight          = [UIApplication sharedApplication].statusBarFrame.size.height;
        CGFloat realHeight               = 64 + UIView.additionaliPhoneXTopSafeHeight;
        //        CGFloat titleAreaHeight          = statusBarHeight + realHeight;
        
        ControllerBaseViewConfig *titleViewConfig = viewsConfig[titleViewId];
        ControllerBaseViewConfig *contentViewConfig = viewsConfig[contentViewId];
        
        titleViewConfig.frame   = CGRectMake(0, 0, Width, realHeight);
        contentViewConfig.frame = CGRectMake(0, realHeight, Width, Height - realHeight - toolbarHeight);
    }
    


    
}

- (void)setupSubViews {
    // Title label.
    self.titleView.backgroundColor = [UIColor yellowColor];
    CGFloat statusBarHeight          = [UIApplication sharedApplication].statusBarFrame.size.height;
    
    UILabel *titleLabel      = [[UILabel alloc] initWithFrame:CGRectMake(0, statusBarHeight, Width, 64.f - statusBarHeight)];
    titleLabel.font          = [UIFont HeitiSCWithFontSize:20.f];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor     = [UIColor whiteColor];
    titleLabel.text          = self.title;
    titleLabel.bottom        = self.titleView.height;
    [self.titleView addSubview:titleLabel];
    
    // Line.
    UIView *line         = [[UIView alloc] initWithFrame:CGRectMake(0, self.titleView.height - 0.5, self.view.width, 0.5)];
    line.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.25f];
    [self.titleView addSubview:line];
    
}


@end

