//
//  ViewController.m
//  简书博客-刀客传奇
//
//  Created by 朱东阳 on 2018/4/19.
//  Copyright © 2018年 zqlm. All rights reserved.
//

#import "ViewController.h"
#import "DYBlogCell.h"
#import "DYBlogModel.h"
#import "MJExtension.h"
#import "NSArray+Chinese.h"
#import "NSString+Chinese.h"


@interface ViewController ()

@end

@implementation ViewController


- (void)setupDataSource ;
{
    
    [super setupDataSource];


    [self.showDataArr sortedArrayUsingComparator:^NSComparisonResult(DYBlogModel*  _Nonnull obj1, DYBlogModel*  _Nonnull obj2) {
        if (obj1.time.longLongValue > obj2.time.longLongValue) {
            return NSOrderedDescending;
        }else{
            return NSOrderedAscending;
        }
    }];
    
    // Adapters
    __weak typeof(self) weakSelf = self;
    [self.showDataArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

        [self.adapters addObject:[DYBlogCell dataAdapterWithCellReuseIdentifier:nil data:weakSelf.showDataArr[idx] cellHeight:100 type:0]];
    }];
}


- (void)registerCellsWithTableView:(UITableView *)tableView {
    
    [DYBlogCell registerToTableView:tableView];
}

@end
