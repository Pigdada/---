//
//  ShowLoadingView.h
//  BaseStructrue
//
//  Created by 朱东阳 on2017/5/15.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowLoadingView : UIView

@property (nonatomic, readonly) NSInteger count;

- (void)push;

- (void)pop;

@end
