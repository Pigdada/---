//
//  FullTitleController.m
//  Animations
//
//  Created by 朱东阳 on2017/5/17.
//  Copyright © 2017年 YouXianMing. All rights reserved.
//

#import "FullTitleController.h"
#import "UIView+SetRect.h"
#import "UIFont+Fonts.h"

@interface FullTitleController ()

@end

@implementation FullTitleController

- (void)makeViewsConfig:(NSMutableDictionary<NSString *,ControllerBaseViewConfig *> *)viewsConfig {
    
    viewsConfig[contentViewId].frame = CGRectMake(0, 0, Width, Height);
    
    if (iPhoneX) {
        CGFloat statusBarHeight          = [UIApplication sharedApplication].statusBarFrame.size.height;

        ControllerBaseViewConfig *titleViewConfig = viewsConfig[titleViewId];
        titleViewConfig.frame = CGRectMake(0, statusBarHeight, Width, 64 + UIView.additionaliPhoneXTopSafeHeight - statusBarHeight);
    }
}

- (void)setupSubViews {
    
    CGFloat statusBarHeight          = [UIApplication sharedApplication].statusBarFrame.size.height;

    // Title label.
    UILabel *titleLabel      = [[UILabel alloc] initWithFrame:CGRectMake(0, statusBarHeight, Width, 64.f - statusBarHeight)];
    titleLabel.font          = [UIFont HeitiSCWithFontSize:20.f];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor     = [UIColor whiteColor];
    titleLabel.text          = self.title;
    titleLabel.bottom        = self.titleView.height;
    [self.titleView addSubview:titleLabel];
    
    // Line.
    UIView *line         = [[UIView alloc] initWithFrame:CGRectMake(0, self.titleView.height - 0.5f, self.view.width, 0.5f)];
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
