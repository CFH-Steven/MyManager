//
//  UIView+FHAnimation.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/20.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FHAnimation)

/** 动画添加子视图 */
- (void)fh_addSubviewWithFadeAnimation:(UIView *)subview
                              duration:(NSTimeInterval)duration
                            completion:(void (^)(BOOL finished))completion;

#pragma mark - Effects
/** 脉冲式 动画 */
- (void)fh_pulseDuration:(NSTimeInterval)duration continuously:(BOOL)continuously;

/** 改变alpaca */
- (void)fh_changeAlpha:(float)newAlpha duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion;

#pragma mark - Transitions
/** 旋转变小消失 */
- (void)fh_rotateRemoveDuration:(NSTimeInterval)duration;

#pragma mark - Transforms
/** 是否顺时针不停旋转 */
- (void)fh_rotateClockwise:(BOOL)clockwise duration:(NSTimeInterval)duration;

/** 动态旋转 degrees=度数 */
- (void)fh_rotateDegrees:(CGFloat)degrees duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion;

/** 缩放动画 scaleX 和 scaleY 取值 0~Max*/
- (void)fh_scaleDuration:(NSTimeInterval)duration x:(CGFloat)scaleX y:(CGFloat)scaleY completion:(void (^)(BOOL finished))completion;

#pragma mark - Moves

/** 动态移动到 snapBack=是否回弹 snapBackOffset=回弹幅度*/
- (void)fh_moveTostopPoint:(CGPoint)destination duration:(NSTimeInterval)duration snapBack:(BOOL)snapBack snapBackOffset:(CGFloat)snapBackOffset completion:(void (^)(BOOL finished))completion;


@end
