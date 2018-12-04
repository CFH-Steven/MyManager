//
//  NSDictionary+FHLog.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 houmanager@Hotmail.com. All rights reserved.
//

#import "NSDictionary+FHLog.h"

@implementation NSDictionary (FHLog)

- (NSString *)descriptionWithLocale:(id)locale{
    NSArray *allKeys = [self allKeys];
    NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"{\t\n "];
    for (NSString *key in allKeys) {
        id value= self[key];
        [str appendFormat:@"\t \"%@\" = %@,\n",key, value];
        
    }
    [str appendString:@"}"];
    return str;
}

@end
