//
//  UIScreen+FHFrame.h
//  FHCategoriesGather
//
//  Created by FHHou on 2017/8/25.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (FHFrame)

+ (CGSize)fh_size;

+ (CGFloat)fh_width;
+ (CGFloat)fh_height;

+ (CGSize)fh_orientationSize;
+ (CGFloat)fh_orientationWidth;
+ (CGFloat)fh_orientationHeight;
+ (CGSize)fh_DPISize;

@end
