//
//  UIView+FHShake.h
//  FHCategoriesGather
//
//  Created by FHHou on 2016/2/18.
//  Copyright © 2016年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 摇晃的方向 */
typedef NS_ENUM(NSInteger, FHShakeDirectionType) {
    FHShakeDirectionHorizontal = 0,  // 水平
    FHShakeDirectionVertical         // 竖直
};

@interface UIView (FHShake)

/** 默认参数配置Shake */
- (void)fh_shakeDefaultHorizontal;

/** 设置水平摇晃的 次数times和幅度offset Block */
- (void)fh_shakeHorizontalWithTimes:(int)times offset:(CGFloat)offset completion:(void(^)())completion;

/** 晃动 相关参数配置 */
- (void)fh_shakeWithTimes:(int)times offset:(CGFloat)offset speed:(NSTimeInterval)speed shakeDirection:(FHShakeDirectionType)shakeDirection completion:(void (^)(void))completion;

@end
