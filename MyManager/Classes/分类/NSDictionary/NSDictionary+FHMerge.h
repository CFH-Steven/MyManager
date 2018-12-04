//
//  NSDictionary+FHMerge.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (FHMerge)

/** 合并两个NSDictionary */
+ (NSDictionary *)margeDictionaryWithDict:(NSDictionary *)dict1
                                     dict:(NSDictionary *)dict2;

/** 合并入一个NSDictionary */
- (NSDictionary *)mergeDictionary:(NSDictionary *)dict;

/** 遍历字典的key-Value键值对并 Return处理结果数组 */
- (NSArray *)fh_dictionaryMapBlock:(id (^)(id key, id value))block;

/** 字典选择器 */
- (NSDictionary *)fh_dictionaryPickForKeys:(NSArray *)keys;

/** 字典移除器 */
- (NSDictionary *)fh_removeObjectsForKeys:(NSArray *)keys;

@end
