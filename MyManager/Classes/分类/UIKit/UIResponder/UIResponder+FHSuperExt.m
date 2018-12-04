//
//  UIResponder+FHSuperExt.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIResponder+FHSuperExt.h"

static __weak id fh_currentFirstResponder;

@implementation UIResponder (FHSuperExt)

/** 当前第一响应者 */
+ (id)fh_currentFirstResponder{
    fh_currentFirstResponder = nil;
    
    [[UIApplication sharedApplication] sendAction:@selector(fh_findCurrentFirstResponder:) to:nil from:nil forEvent:nil];
    return fh_currentFirstResponder;
}

- (void)fh_findCurrentFirstResponder:(id)sender {
    fh_currentFirstResponder = self;
}

/** 响应者链 */
- (NSString *)fh_responderChainDescription{
    
    NSMutableArray *responderChainStrings = [NSMutableArray array];
    [responderChainStrings addObject:[self class]];
    UIResponder *nextResponder = self;
    while ((nextResponder = [nextResponder nextResponder])) {
        [responderChainStrings addObject:[nextResponder class]];
    }
    __block NSString *returnString = @"Responder Chain:\n";
    __block int tabCount = 0;
    [responderChainStrings enumerateObjectsWithOptions:NSEnumerationReverse
                                            usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                                                if (tabCount) {
                                                    returnString = [returnString stringByAppendingString:@"|"];
                                                    for (int i = 0; i < tabCount; i++) {
                                                        returnString = [returnString stringByAppendingString:@"----"];
                                                    }
                                                    returnString = [returnString stringByAppendingString:@" "];
                                                }
                                                else {
                                                    returnString = [returnString stringByAppendingString:@"| "];
                                                }
                                                returnString = [returnString stringByAppendingFormat:@"%@ (%@)\n", obj, @(idx)];
                                                tabCount++;
                                            }];
    return returnString;
}

@end
