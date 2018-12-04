//
//  UIView+FHShake.m
//  FHCategoriesGather
//
//  Created by FHHou on 2016/2/18.
//  Copyright © 2016年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIView+FHShake.h"

@implementation UIView (FHShake)

/** 默认参数配置Shake */
- (void)fh_shakeDefaultHorizontal{
    [self _fh_shakeWithTimes:10 direction:1 currentTimes:0 offset:5 speed:0.03 shakeDirection:FHShakeDirectionHorizontal completion:nil];
}

/** 设置水平摇晃的 次数times和幅度offset Block */
- (void)fh_shakeHorizontalWithTimes:(int)times offset:(CGFloat)offset completion:(void(^)())completion{
    [self _fh_shakeWithTimes:times direction:1 currentTimes:0 offset:offset speed:0.03 shakeDirection:FHShakeDirectionHorizontal completion:completion];
}

/** 晃动 相关参数配置 */
- (void)fh_shakeWithTimes:(int)times offset:(CGFloat)offset speed:(NSTimeInterval)speed shakeDirection:(FHShakeDirectionType)shakeDirection completion:(void (^)(void))completion{
    [self _fh_shakeWithTimes:times direction:1 currentTimes:0 offset:offset speed:speed shakeDirection:shakeDirection completion:completion];
}

#pragma mark - Private
/** shake相关配置 */
- (void)_fh_shakeWithTimes:(int)times
                 direction:(int)direction
              currentTimes:(int)currentTimes
                    offset:(CGFloat)offset
                     speed:(NSTimeInterval)speed
            shakeDirection:(FHShakeDirectionType)shakeDirection
                completion:(void (^)(void))completionHandler{
    
    [UIView animateWithDuration:speed animations:^{
        self.layer.affineTransform = (shakeDirection == FHShakeDirectionHorizontal)?CGAffineTransformMakeTranslation(offset * direction, 0) : CGAffineTransformMakeTranslation(0, offset * direction);
    } completion:^(BOOL finished) {
        if(currentTimes >= times) {
            [UIView animateWithDuration:speed animations:^{
                self.layer.affineTransform = CGAffineTransformIdentity;
            } completion:^(BOOL finished){
                if (completionHandler != nil) {
                    completionHandler();
                }
            }];
            return;
        }
        [self _fh_shakeWithTimes:(times - 1)
                       direction:direction * -1
                    currentTimes:currentTimes + 1
                          offset:offset
                           speed:speed
                  shakeDirection:shakeDirection
                      completion:completionHandler];
    }];
}

@end
