//
//  NSArray+FHSuperExt.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSArray+FHSuperExt.h"

@implementation NSArray (FHSuperExt)

/** 安全取出数组中的元素,避免越界造成的崩溃 */
- (id)fh_objectSafeAtIndex:(NSUInteger)index{
    if (self.count > index){
        return [self objectAtIndex:index];
    }
    return nil;
}

- (NSArray *)fh_removeObject:(id)object{
    NSMutableArray *result = [self mutableCopy];
    [result removeObject:object];
    return result;
}

- (NSArray *)fh_removeFirstObject{
    if (self.count == 0) return self;
    return [self subarrayWithRange:NSMakeRange(1, self.count - 1)];
}

- (NSArray *)fh_removeLastObject{
    if (self.count == 0) return self;
    return [self subarrayWithRange:NSMakeRange(0, self.count - 1)];
}

- (NSArray *)fh_reverseObject{
//    return [[self reverseObjectEnumerator] allObjects];
    
    NSMutableArray *resultArray = [NSMutableArray arrayWithArray:self];
    for (NSInteger min = 0, max = resultArray.count - 1; min < max; min++, max--) {
        id tmp = resultArray[min];
        resultArray[min] = resultArray[max];
        resultArray[max] = tmp;
    }
    return resultArray;
}

- (NSArray *)fh_shuffledArray {
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSMutableArray *copy = [self mutableCopy];
    while ([copy count] > 0)
    {
        int index = arc4random() % [copy count];
        id objectToMove = [copy objectAtIndex:index];
        [array addObject:objectToMove];
        [copy removeObjectAtIndex:index];
    }
    return array;
}

- (NSArray *)fh_uniqueArray {
    
    NSSet *set = [NSSet setWithArray:self];
    NSArray *array = [[NSArray alloc] initWithArray:[set allObjects]];
    return array;
}

- (NSArray *)fh_arraySorting:(NSString *)parameters  ascending:(BOOL)ascending{
    
    NSSortDescriptor*sorter=[[NSSortDescriptor alloc]initWithKey:parameters ascending:ascending];
    NSMutableArray *sortDescriptors=[[NSMutableArray alloc]initWithObjects:&sorter count:1];
    NSArray *sortArray=[self sortedArrayUsingDescriptors:sortDescriptors];
    return sortArray;
}



@end

