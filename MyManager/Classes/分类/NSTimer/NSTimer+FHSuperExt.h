//
//  NSTimer+FHSuperExt.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (FHSuperExt)

/** 暂停NSTimer */
- (void)fh_pauseTimer;

/** 开始NSTimer */
- (void)fh_resumeTimer;

/** 延迟开始NSTimer */
- (void)fh_resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
