//
//  UIImage+Color.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)
+ (UIImage *)imageWithColor:(UIColor *)color;
- (UIColor *)colorAtPoint:(CGPoint )point;
//more accurate method ,colorAtPixel 1x1 pixel
- (UIColor *)colorAtPixel:(CGPoint)point;
//返回该图片是否有透明度通道
- (BOOL)hasAlphaChannel;

///获得灰度图
+ (UIImage*)covertToGrayImageFromImage:(UIImage*)sourceImage;


//给我一种颜色，一个尺寸，我给你返回一个UIImage:不透明
+(UIImage *)imageFromContextWithColor:(UIColor *)color;
+(UIImage *)imageFromContextWithColor:(UIColor *)color size:(CGSize)size;

- (UIImage *) imageWithTintColor:(UIColor *)tintColor;
- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor;





@end
