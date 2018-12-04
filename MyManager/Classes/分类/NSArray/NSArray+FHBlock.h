//
//  NSArray+FHBlock.h
//  FHCategoriesGather
//
//  Created by FHHou on 2017/3/2.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (FHBlock)

/** 遍历数组 index 和 object */
- (NSArray *)fh_arrayWithIndexMapBlock:(id (^)(NSUInteger index, id object))block;

/** 数组过滤器 */
- (NSArray *)fh_filterBlock:(BOOL (^)(id object))block;

/** 数组剔除器 */
- (NSArray *)fh_reversePickWithArray:(NSArray *)array;


@end
