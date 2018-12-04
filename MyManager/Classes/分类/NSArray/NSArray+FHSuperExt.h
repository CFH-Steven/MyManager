//
//  NSArray+FHSuperExt.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSArray (FHSuperExt)

/** 安全取出数组中的元素,避免越界造成的崩溃 */
- (id)fh_objectSafeAtIndex:(NSUInteger)index;

/** 移除对象 */
- (NSArray *)fh_removeObject:(id)object;

/** 移除第一个对象 */
- (NSArray *)fh_removeFirstObject;

/** 移除最后一个对象 */
- (NSArray *)fh_removeLastObject;

/**
 逆序数组元素

 @return 已经逆序的数组
 */
- (NSArray *)fh_reverseObject;

/**
 数组洗牌

 @return 打乱的数组
 */
- (NSArray *)fh_shuffledArray;

/**
 数组去重

 @return unique Array
 */
- (NSArray *)fh_uniqueArray;

/**
 根据关键词 对array的内容进行排序，并返回排序后的array

 @param parameters key
 @param ascending ascending
 @return result
 */
- (NSArray *)fh_arraySorting:(NSString *)parameters
                   ascending:(BOOL)ascending;

@end

