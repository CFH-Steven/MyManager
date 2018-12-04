//
//  NSArray+FHLog.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 houmanager@Hotmail.com. All rights reserved.
//

#import "NSArray+FHLog.h"

@implementation NSArray (FHLog)

- (NSString *)descriptionWithLocale:(id)locale{
    
    NSMutableString *str = [NSMutableString stringWithFormat:@"%lu (\n", (unsigned long)self.count];
    for (id obj in self) {
        [str appendFormat:@"\t%@, \n", obj];
    }
    [str appendString:@")"];
    return str;
}

@end
