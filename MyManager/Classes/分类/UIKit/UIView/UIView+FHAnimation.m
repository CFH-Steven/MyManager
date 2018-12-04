//
//  UIView+FHAnimation.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/20.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIView+FHAnimation.h"

float fh_radiansForDegrees(int degrees) {
    return degrees * M_PI / 180.0f;
}

@implementation UIView (FHAnimation)

/** 动画添加子视图 */
- (void)fh_addSubviewWithFadeAnimation:(UIView *)subview
                              duration:(NSTimeInterval)duration
                            completion:(void (^)(BOOL finished))completion{
    
    CGFloat finalAlpha = subview.alpha;
    
    subview.alpha = 0.0;
    [self addSubview:subview];
    [UIView animateWithDuration:duration animations:^{
        subview.alpha = finalAlpha;
    } completion:^(BOOL finished) {
        if (completion) {
            completion(finished);
        }
    }];
}

#pragma mark - Effects
/** 脉冲式 动画 */
- (void)fh_pulseDuration:(NSTimeInterval)duration continuously:(BOOL)continuously{
    [UIView animateWithDuration:duration * 0.5 delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         // Fade out, but not completely
                         self.alpha = 0.3;
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:duration * 0.5 delay:0.0
                                             options:UIViewAnimationOptionCurveLinear
                                          animations:^{
                                              self.alpha = 1.0;
                                          }
                                          completion:^(BOOL finished) {
                                              if (continuously) {
                                                  [self fh_pulseDuration:duration continuously:continuously];
                                              }
                                          }];
                     }];
}

/** 改变alpaca */
- (void)fh_changeAlpha:(float)newAlpha duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion{
    [UIView animateWithDuration:duration delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.alpha = newAlpha;
                     }completion:completion];
}

#pragma mark - Transitions
/** 旋转变小消失 */
- (void)fh_rotateRemoveDuration:(NSTimeInterval)duration{
    self.tag = 20;
    [NSTimer scheduledTimerWithTimeInterval:duration/50 target:self selector:@selector(fh_drainTimer:) userInfo:nil repeats:YES];
}
- (void)fh_drainTimer:(NSTimer *)timer{
    CGAffineTransform trans = CGAffineTransformRotate(CGAffineTransformScale(self.transform, 0.9, 0.9),0.314);
    self.transform = trans;
    self.alpha = self.alpha * 0.98;
    self.tag = self.tag - 1;
    if (self.tag <= 0) {
        [timer invalidate];
        [self removeFromSuperview];
    }
}


#pragma mark - Transforms
/** 是否顺时针不停旋转 */
- (void)fh_rotateClockwise:(BOOL)clockwise duration:(NSTimeInterval)duration{
    
    CGFloat angleValue = 0.0;
    if (clockwise) {
        angleValue = fh_radiansForDegrees(90);
    }else{
        angleValue = fh_radiansForDegrees(270);
    }
    [UIView animateWithDuration:duration delay:0.0f options:UIViewAnimationOptionCurveLinear animations:^{
        self.transform = CGAffineTransformRotate(self.transform, angleValue);
    } completion:^(BOOL finished) {
        [self fh_rotateClockwise:clockwise duration:duration];
    }];
}

/** 动态旋转 degrees=度数 */
- (void)fh_rotateDegrees:(CGFloat)degrees duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion{
    [UIView animateWithDuration:duration
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.transform = CGAffineTransformRotate(self.transform, fh_radiansForDegrees(degrees));
                     }completion:^(BOOL finished) {
                         if (completion) {
                             completion(finished);
                         }
                     }];
}

/** 缩放动画 scaleX 和 scaleY 取值 0~Max*/
- (void)fh_scaleDuration:(NSTimeInterval)duration x:(CGFloat)scaleX y:(CGFloat)scaleY completion:(void (^)(BOOL finished))completion{
    [UIView animateWithDuration:duration
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.transform = CGAffineTransformScale(self.transform, scaleX, scaleY);
                     }
                     completion:^(BOOL finished) {
                         if (completion) {
                             completion(finished);
                         }
                     }];
}


#pragma mark - Moves
/** 动态移动到 snapBack=是否回弹 snapBackOffset=回弹幅度*/
- (void)fh_moveTostopPoint:(CGPoint)destination duration:(NSTimeInterval)duration snapBack:(BOOL)snapBack snapBackOffset:(CGFloat)snapBackOffset completion:(void (^)(BOOL finished))completion{
    
    CGFloat offsetValue = snapBackOffset;
    CGPoint stopPoint = destination;
    if (snapBack) {
        int diffx = destination.x - self.frame.origin.x;
        int diffy = destination.y - self.frame.origin.y;
        if (diffx < 0) {
            stopPoint.x -= offsetValue;
        } else if (diffx > 0) {
            stopPoint.x += offsetValue;
        }
        if (diffy < 0) {
            stopPoint.y -= offsetValue;
        } else if (diffy > 0) {
            stopPoint.y += offsetValue;
        }
    }
    
    [UIView animateWithDuration:duration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.frame = CGRectMake(stopPoint.x, stopPoint.y, self.frame.size.width, self.frame.size.height);
                     }
                     completion:^(BOOL finished) {
                         if (snapBack) {
                             [UIView animateWithDuration:0.1
                                                   delay:0.0
                                                 options:UIViewAnimationOptionCurveLinear
                                              animations:^{
                                                  self.frame = CGRectMake(destination.x, destination.y, self.frame.size.width, self.frame.size.height);
                                              }
                                              completion:^(BOOL finished) {
                                                  if (completion) {
                                                      completion(finished);
                                                  }
                                              }];
                         }else{
                             if (completion) {
                                 completion(finished);
                             }
                         }
                     }];        
}














@end
