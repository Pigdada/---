




//
//  DYFirstCtrl.m
//  简书博客-刀客传奇
//
//  Created by 朱东阳 on 2018/4/19.
//  Copyright © 2018年 zqlm. All rights reserved.
//

#import "DYFirstCtrl.h"
#import "DYBlogModel.h"
#import "MJExtension.h"
#import "ViewController.h"

@interface DYFirstCtrl ()
@property (nonatomic, strong) NSArray *sectionTitleArr;
@property (nonatomic, strong) NSDictionary *allSectionDataDict;
@end

@implementation DYFirstCtrl

- (void)setupDataSource ;
{
    
    [super setupDataSource];
    
//    1.获得plist的全路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data.plist" ofType:nil];
    
    NSArray * arrayDictArr = [NSArray arrayWithContentsOfFile:path];
    
    NSArray * array = [DYBlogModel mj_objectArrayWithKeyValuesArray:arrayDictArr];
    
    [self handleData:array];
    
    
    
    // Adapters
    __weak typeof(self) weakSelf = self;
    [self.sectionTitleArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [self.adapters addObject:[CustomCell dataAdapterWithCellReuseIdentifier:nil data:self.sectionTitleArr[idx] cellHeight:80 type:0]];
    }];
}


- (void)registerCellsWithTableView:(UITableView *)tableView {
    
    [CustomCell registerToTableView:tableView];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CellDataAdapter *adapter = self.adapters[indexPath.row];
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:adapter.cellReuseIdentifier];
    cell.dataAdapter = adapter;
    cell.data        = adapter.data;
    cell.tableView   = tableView;
    cell.indexPath   = indexPath;
    cell.delegate    = self;
    [cell loadContent];
    
    
    cell.textLabel.text = adapter.data;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CellDataAdapter *adapter = self.adapters[indexPath.row];

    ViewController *ctrl = [ViewController new];
    ctrl.title = adapter.data;
    ctrl.showDataArr = self.allSectionDataDict[adapter.data];
    
    [self.navigationController pushViewController:ctrl animated:YES];
    
}

#pragma mark  - privaty

- (void)handleData:(NSArray *)arr;
{
    NSMutableDictionary *sectionsDict = [NSMutableDictionary dictionary];
    
    
    for (DYBlogModel *model in arr) {
        NSMutableArray *mulArr;
        if (sectionsDict[model.section] == nil) {
            mulArr = [NSMutableArray array];
        }else{
            mulArr = sectionsDict[model.section];
        }
        [mulArr addObject:model];
        sectionsDict[model.section] = mulArr;
    }
    
    
    
    self.sectionTitleArr = [sectionsDict allKeys];
    
    self.allSectionDataDict = sectionsDict;
}


@end
