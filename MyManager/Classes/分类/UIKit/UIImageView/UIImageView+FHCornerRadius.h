//
//  UIImageView+FHCornerRadius.h
//  FHCategoriesGather
//
//  Created by FHHou on 2017/8/1.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (FHCornerRadius)

- (instancetype)initWithCornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType;

- (void)fh_cornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType;

- (instancetype)initWithRoundingRectImageView;

- (void)fh_cornerRadiusRoundingRect;

- (void)fh_attachBorderWidth:(CGFloat)width color:(UIColor *)color;

@end
