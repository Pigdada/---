//
//  DYBlogCell.m
//  简书博客-刀客传奇
//
//  Created by 朱东阳 on 2018/4/19.
//  Copyright © 2018年 zqlm. All rights reserved.
//

#import "DYBlogCell.h"
#import "DYBlogModel.h"
#import "UIFont+Fonts.h"
#import "RxWebViewController.h"
#import "UIImageView+WebCache.h"
#import "DYWebViewCtrl.h"


static NSString * const lastClickIndexKey   =   @"lastClickIndexKey";

@interface DYBlogCell()

@property (nonatomic, strong) UILabel *titleL;
@property (nonatomic, strong) UILabel *contentL;

@property (nonatomic, strong) UIImageView *imageV;


@property (nonatomic, strong) UIView *lineView;
@end

@implementation DYBlogCell

- (void)setupCell {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}


- (void)buildSubview {

    CGFloat width = [UIScreen mainScreen].bounds.size.width;

    _titleL           = [[UILabel alloc] initWithFrame:CGRectMake(18, 5, 250, 40)];
    _titleL.font      = [UIFont AvenirWithFontSize:14];
    _titleL.numberOfLines = 0;
    _titleL.textColor = [UIColor blackColor];
    [self addSubview:_titleL];
    
    _contentL           = [[UILabel alloc] initWithFrame:CGRectMake(18, 45, 250, 50)];
    _contentL.font      = [UIFont AvenirWithFontSize:12];
    _contentL.numberOfLines = 0;
    _contentL.textColor = [UIColor grayColor];
    [self addSubview:_contentL];
    
    
    _imageV       = [[UIImageView alloc] initWithFrame:CGRectMake(width - 90, 10, 80, 80)];
//    _imageV.image = [UIImage imageNamed:@"plane"];
    _imageV.backgroundColor = [UIColor yellowColor];
//    _imageV.alpha = 0.f;
    [self addSubview:_imageV];
    
    

    _lineView                 = [[UIView alloc] initWithFrame:CGRectMake(18, 98, width - 32, 2)];
//    _lineView.alpha           = 0.f;
    _lineView.backgroundColor = [UIColor grayColor];
    [self addSubview:_lineView];
}

static DYBlogCell *lastCell = nil;

- (void)loadContent {
    
    DYBlogModel *model = self.dataAdapter.data;
//    self.name.text           = model.title;

    NSString *key;
    if (model) {
        key = [[NSUserDefaults standardUserDefaults] valueForKey:[self savaKeyWithTitle:model.section]];
    }
    
    if ([model.url isEqualToString:key]){
        self.backgroundColor = [UIColor yellowColor];
        lastCell = self;
    }else{
        self.backgroundColor = [UIColor whiteColor];
    }
    
    self.titleL.text = model.title;
    self.contentL.text = model.desc;
    
    if(model.image.length > 0){
        [self.imageV sd_setImageWithURL:[NSURL URLWithString:model.image]];
    }else{
        self.imageV.image = nil;
    }
}

- (void)selectedEvent {
    
    DYBlogModel *model = self.dataAdapter.data;
    
    
    [[NSUserDefaults standardUserDefaults] setValue:model.url forKey:[self savaKeyWithTitle:model.section]];
    
    if (lastCell) [lastCell loadContent];
    [self loadContent];

    NSLog(@"%@",model.url);
    RxWebViewController* webViewController = [[DYWebViewCtrl alloc] initWithUrl:[NSURL URLWithString:model.url]];
    [self.controller.navigationController pushViewController:webViewController animated:YES];
}

- (NSString *)savaKeyWithTitle:(NSString *)title;
{
//    NSParameterAssert(title);
    if (title == nil) {
        return nil;
    }
    return [lastClickIndexKey stringByAppendingString:title];
}


@end
