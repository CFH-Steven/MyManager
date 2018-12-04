//
//  NSTimer+FHSuperExt.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSTimer+FHSuperExt.h"

@implementation NSTimer (FHSuperExt)

/** 暂停NSTimer */
- (void)fh_pauseTimer{
    if (![self isValid]) { return; }
    [self setFireDate:[NSDate distantFuture]];
}

/** 开始NSTimer */
- (void)fh_resumeTimer{
    if (![self isValid]) { return ; }
    [self setFireDate:[NSDate date]];
}

/** 延迟开始NSTimer */
- (void)fh_resumeTimerAfterTimeInterval:(NSTimeInterval)interval{
    if (![self isValid]) { return ; }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

@end
