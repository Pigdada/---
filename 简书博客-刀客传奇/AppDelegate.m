//
//  AppDelegate.m
//  简书博客-刀客传奇
//
//  Created by 朱东阳 on 2018/4/19.
//  Copyright © 2018年 zqlm. All rights reserved.
//

#import "AppDelegate.h"
#import "DYFirstCtrl.h"
#import "BaseCustomNavigationController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    DYFirstCtrl *vc = [DYFirstCtrl new];
    
    vc.title = @"刀客传奇的blog";
    
    BaseCustomNavigationController *nav = [[BaseCustomNavigationController alloc] initWithRootViewController:vc];
    
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}




@end
