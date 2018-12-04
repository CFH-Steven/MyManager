//
//  UIView+FHCustomBorder.h
//  FHCategoriesGather
//
//  Created by FHHou on 2016/2/18.
//  Copyright © 2016年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//  给视图添加自定义Border边框

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, FHExcludePointType) {
    FHExcludePointStart = 1 << 0,
    FHExcludePointEnd   = 1 << 1,
    FHExcludePointAll   = ~0UL    // 无符号长整型 0, ~表示按位取反, 即: 0xffff
};

@interface UIView (FHCustomBorder)

#pragma mark - Add Line
/** 顶部添加Border边框 无删除  */
- (void)fh_addTopBorderWithColor:(UIColor *)color width:(CGFloat)width;
/** Top 添加 边框 */
- (void)fh_addTopBorderWithColor:(UIColor *)color
                           width:(CGFloat)width
                   excludeLength:(CGFloat)length
                excludePointType:(FHExcludePointType)excludeType;

#pragma mark - Left
/** Left添加Border边框 无删除 */
- (void)fh_addLeftBorderWithColor:(UIColor *)color width:(CGFloat)width;
/** Left添加Border边框 */
- (void)fh_addLeftBorderWithColor:(UIColor *)color
                            width:(CGFloat)width
                    excludeLength:(CGFloat)length
                 excludePointType:(FHExcludePointType)excludeType;

#pragma mark - Bottom
/** Bottom添加Border边框 无删除 */
- (void)fh_addBottomBorderWithColor:(UIColor *)color width:(CGFloat)width;
/** Bottom添加Border边框 */
- (void)fh_addBottomBorderWithColor:(UIColor *)color
                              width:(CGFloat)width
                      excludeLength:(CGFloat)length
                   excludePointType:(FHExcludePointType)excludeType;

#pragma mark - Right
/** Right添加Border边框 无删除 */
- (void)fh_addRightBorderWithColor:(UIColor *)color width:(CGFloat)width;
/** Right添加Border边框 */
- (void)fh_addRightBorderWithColor:(UIColor *)color
                             width:(CGFloat)width
                     excludeLength:(CGFloat)length
                  excludePointType:(FHExcludePointType)excludeType;


#pragma mark - Remove
/** 移除顶部的Border */
- (void)fh_removeTopBorder;

/** 移除Left的Border */
- (void)fh_removeLeftBorder;

/** 移除Bottom的Border */
- (void)fh_removeBottomBorder;

/** 移除Right的Border */
- (void)fh_removeRightBorder;

@end
