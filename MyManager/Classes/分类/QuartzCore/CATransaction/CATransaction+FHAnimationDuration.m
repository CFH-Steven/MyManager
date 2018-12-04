//
//  CATransaction+FHAnimationDuration.m
//  FHCategoriesGather
//
//  Created by FHHou on 2017/5/22.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "CATransaction+FHAnimationDuration.h"

@implementation CATransaction (FHAnimationDuration)

+ (void)fh_animationDuration:(NSTimeInterval)duration
                 animations:(void (^)(void))animations
                 completion:(void (^)())completion{
    [CATransaction begin];
    [CATransaction setAnimationDuration:duration];
    
    if (completion){
        [CATransaction setCompletionBlock:completion];
    }
    
    if (animations){
        animations();
    }
    [CATransaction commit];
}


@end
