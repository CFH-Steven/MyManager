//
//  CATransaction+FHAnimationDuration.h
//  FHCategoriesGather
//
//  Created by FHHou on 2017/5/22.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#if __has_feature(nullability) // Xcode 6.3+
#pragma clang assume_nonnull begin
#else
#define nullable
#define __nullable
#endif

@interface CATransaction (FHAnimationDuration)

/**
 CATransaction 动画执 block回调

 @param duration 动画时间
 @param animations 动画代码块
 @param completion 完成
 */
+(void)fh_animationDuration:(NSTimeInterval)duration
                 animations:(void (^)(void))animations
                 completion:(void (^)())completion;

@end

#if __has_feature(nullability)
#pragma clang assume_nonnull end
#endif
