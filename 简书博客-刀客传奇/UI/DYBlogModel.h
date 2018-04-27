//
//  DYBlogModel.h
//  简书博客-刀客传奇
//
//  Created by 朱东阳 on 2018/4/19.
//  Copyright © 2018年 zqlm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DYBlogModel : NSObject
@property (nonatomic, copy)   NSString *title;
@property (nonatomic, copy)   NSString *url;

@property (nonatomic, copy)   NSString *desc;
@property (nonatomic, copy)   NSString *image;

@property (nonatomic, strong) NSNumber *time;
@property (nonatomic, strong) NSString *section;
@end
