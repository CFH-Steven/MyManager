//
//  NSTimer+FHBlock.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSTimer+FHBlock.h"

@implementation NSTimer (FHBlock)

/** 定时器Block执行 scheduled*/
+ (NSTimer *)fh_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats{
    void (^block)() = [inBlock copy];
    NSTimer *ret = [self scheduledTimerWithTimeInterval:inTimeInterval target:self selector:@selector(_fh_ExecuteSimpleBlock:) userInfo:block repeats:inRepeats];
    return ret;
}

/** 定时器Block执行 timer */
+ (NSTimer *)fh_timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats{
    void (^block)() = [inBlock copy];
    NSTimer *ret = [self timerWithTimeInterval:inTimeInterval target:self selector:@selector(_fh_ExecuteSimpleBlock:) userInfo:block repeats:inRepeats];
    return ret;
}

#pragma mark - Private
+ (void)_fh_ExecuteSimpleBlock:(NSTimer *)inTimer{
    if([inTimer userInfo]){
        void (^block)() = (void (^)())[inTimer userInfo];
        block();
    }
}

@end
