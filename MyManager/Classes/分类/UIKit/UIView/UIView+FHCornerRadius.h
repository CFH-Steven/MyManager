//
//  UIView+FHCornerRadius.h
//  FHCategoriesGather
//
//  Created by FHHou on 2017/7/31.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FHCornerRadius)

/**
 设置圆角

 @param rectCorner 圆角类型
 @param cornerRadius 圆角度数
 */
- (void)fh_setCornerWithRectCorner:(UIRectCorner)rectCorner cornerRadius:(CGFloat)cornerRadius;

@end
