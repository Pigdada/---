//
//  FullTitleVisualEffectController.m
//  Animations
//
//  Created by 朱东阳 on2017/5/17.
//  Copyright © 2017年 YouXianMing. All rights reserved.
//

#import "FullTitleVisualEffectController.h"
#import "UIView+SetRect.h"
#import "UIFont+Fonts.h"

@interface FullTitleVisualEffectController ()

@property (nonatomic, strong) UIVisualEffectView *effectView;
@property (nonatomic, strong) UIVisualEffectView *vibrancyEffectView;

@end

@implementation FullTitleVisualEffectController

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

    // 添加模糊效果
    self.effectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    self.effectView.frame                  = self.titleView.bounds;
    self.effectView.userInteractionEnabled = YES;
    [self.titleView addSubview:self.effectView];
    
    // 需要与作用的effectView的效果一致
    _vibrancyEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIVibrancyEffect effectForBlurEffect:(UIBlurEffect *)self.effectView.effect]];
    _vibrancyEffectView.frame = self.effectView.bounds;
    [self.effectView.contentView addSubview:self.vibrancyEffectView];
    

    // Title label.
    UILabel *titleLabel      = [[UILabel alloc] initWithFrame:CGRectMake(0, statusBarHeight, Width, 64.f - statusBarHeight)];
    titleLabel.font          = [UIFont HeitiSCWithFontSize:20.f];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor     = [UIColor whiteColor];
    titleLabel.text          = self.title;
    titleLabel.bottom        = self.titleView.height;
    
    // Back button.
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, statusBarHeight, 100, 64 - statusBarHeight)];
    backButton.center    = CGPointMake(20, titleLabel.centerY);
    [backButton setImage:[UIImage imageNamed:@"backIcon"]             forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"backIcon_highlighted"] forState:UIControlStateHighlighted];
    [backButton addTarget:self action:@selector(popSelf) forControlEvents:UIControlEventTouchUpInside];
    [backButton.imageView setContentMode:UIViewContentModeCenter];
    [self.titleView addSubview:backButton];
    
    [_vibrancyEffectView.contentView addSubview:backButton];
    [_vibrancyEffectView.contentView addSubview:titleLabel];
}

- (void)popSelf {
    
    [self popViewControllerAnimated:YES];
}

@end
