//
//  NSArray+FHBlock.m
//  FHCategoriesGather
//
//  Created by FHHou on 2017/3/2.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSArray+FHBlock.h"

@implementation NSArray (FHBlock)

/** 遍历数组 index 和 object */
- (NSArray *)fh_arrayWithIndexMapBlock:(id (^)(NSUInteger index, id object))block{
    
    NSMutableArray *array = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id objects, NSUInteger idx, BOOL *stop) {
        id object = block(idx, objects);
        if (object) {
            [array addObject:object];
        }
    }];
    return array;
}

/** 数组过滤器 */
- (NSArray *)fh_filterBlock:(BOOL (^)(id object))block{
    return [self filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return block(evaluatedObject);
    }]];
}

/** 数组剔除器 */
- (NSArray *)fh_reversePickWithArray:(NSArray *)array{
    
    NSMutableArray *results = [NSMutableArray arrayWithArray:self];
 
    for (id obj in array) {
        if ([self containsObject:obj]) { // 包含就剔除
            [results removeObject:obj];
        }
    }
    return results;
}



@end
