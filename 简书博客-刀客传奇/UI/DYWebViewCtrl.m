//
//  DYWebViewCtrl.m
//  简书博客-刀客传奇
//
//  Created by 朱东阳 on 2018/4/19.
//  Copyright © 2018年 zqlm. All rights reserved.
//

#import "DYWebViewCtrl.h"
#import "WebViewJavascriptBridge.h"
#import "UIImage+Color.h"

@interface DYWebViewCtrl () <UIWebViewDelegate>
@property (nonatomic, strong) WebViewJavascriptBridge *webViewBridge;
@end

@implementation DYWebViewCtrl

- (void)viewDidLoad;
{
    [super viewDidLoad];
    
    _webViewBridge = [WebViewJavascriptBridge bridgeForWebView:self.webView];
    // 如果控制器里需要监听WKWebView 的`navigationDelegate`方法，就需要添加下面这行。
    [_webViewBridge setWebViewDelegate:self];

    
    UIButton *gotoJianShu = [UIButton new];
    gotoJianShu.backgroundColor = [UIColor blueColor];
//    [gotoJianShu setImage:[UIImage imageWithColor:[UIColor yellowColor]] forState:UIControlStateNormal];
//    [gotoJianShu setImage:[UIImage imageWithColor:[UIColor blueColor]] forState:UIControlStateHighlighted];

    [gotoJianShu addTarget:self action:@selector(gotojianshuAction) forControlEvents:UIControlEventTouchUpOutside];
    gotoJianShu.frame = CGRectMake(self.view.frame.size.width - 50, 2, 40, 40);
//    self.navigationController.navigationBar.userInteractionEnabled = YES;
    UIBarButtonItem *myBtn = [[UIBarButtonItem alloc] initWithCustomView:gotoJianShu];
    self.navigationItem.leftBarButtonItem = myBtn;
}

- (BOOL)webView: (UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"%@",request);
    
    // 静止跳转到app store
    if ([request.URL.path isEqualToString:@"/apps/download"]) {
        return NO;
    }
    
    
    // 静止跳转到app store
    if ([request.URL.absoluteString hasPrefix:@"https://itunes.apple.com"]) {
        return NO;
    }
    
    
    
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView;
{
//    // 1.获取页面标题
//    NSString *string = @"document.title";
//    [webView stringByEvaluatingJavaScriptFromString:string];
//    // 2.去掉页面标题
    NSMutableString *str = [NSMutableString string];
    
//    // 3.根据标签类型获取指定标签的元素
//    [str appendString:@"header = document.getElementsByClassName(\"header-wrap\")[0]"];
//    [str appendString:@"header.parentNode.removeChild(header);"]; // 移除头部的导航栏
//
//    // 4.去掉footer一栏
//    [str appendString:@"var footer = document.getElementsByClassName(\"user-panel\")[0];"];
//    [str appendString:@"footer.parentNode.removeChild(footer);"];
//
//    // 5.去掉最底下的一块区域
//    [str appendString:@"var btn = document.getElementsByClassName(\"footer\")[0];"];
//    [str appendString:@"btn.parentNode.removeChild(btn);"];
    
    // 3.根据标签类型获取指定标签的元素
    [str appendString:@"note = document.getElementsByClassName(\"note\")[0]"];
    [str appendString:@"header.parentNode.removeChild(note);"]; // 移除头部的导航栏
    
    
    [webView stringByEvaluatingJavaScriptFromString:str];
    
    
}

- (void)gotojianshuAction;
{
    NSLog(@"%s",__func__);
    
    NSString *urlStr = self.url.absoluteString;
    
    urlStr = [urlStr stringByReplacingOccurrencesOfString:@"://www." withString:@"://oia."];
    
    [self.webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlStr]]];
}

@end
