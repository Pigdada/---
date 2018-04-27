//
//  NormalTitleController.m
//  Animations
//
//  Created by 朱东阳 on2017/5/17.
//  Copyright © 2017年 YouXianMing. All rights reserved.
//

#import "NormalTitleController.h"
#import "UIView+SetRect.h"
#import "UIFont+Fonts.h"

@interface NormalTitleController ()

@end

@implementation NormalTitleController

- (void)makeViewsConfig:(NSMutableDictionary<NSString *,ControllerBaseViewConfig *> *)viewsConfig {
    
    if (iPhoneX) {
//        CGFloat statusBarHeight          = [UIApplication sharedApplication].statusBarFrame.size.height;
        CGFloat realHeight               = 64 + UIView.additionaliPhoneXTopSafeHeight;
//        CGFloat titleAreaHeight          = statusBarHeight + realHeight;
        
        ControllerBaseViewConfig *titleViewConfig = viewsConfig[titleViewId];
        ControllerBaseViewConfig *contentViewConfig = viewsConfig[contentViewId];
        
        titleViewConfig.frame   = CGRectMake(0, 0, Width, realHeight);
        contentViewConfig.frame = CGRectMake(0, realHeight, Width, Height - realHeight);
    }
}

- (void)setupSubViews {
    self.titleView.backgroundColor = [UIColor yellowColor];
    // Title label.
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
    
    // Back button.
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, statusBarHeight, 100, 64 - statusBarHeight)];
    backButton.center    = CGPointMake(20, titleLabel.centerY);
    [backButton setImage:[UIImage imageNamed:@"backIcon"]             forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"backIcon_highlighted"] forState:UIControlStateHighlighted];
    [backButton addTarget:self action:@selector(popSelf) forControlEvents:UIControlEventTouchUpInside];
    [backButton.imageView setContentMode:UIViewContentModeCenter];
    [self.titleView addSubview:backButton];
}

- (void)popSelf {
    
    [self popViewControllerAnimated:YES];
}

@end
