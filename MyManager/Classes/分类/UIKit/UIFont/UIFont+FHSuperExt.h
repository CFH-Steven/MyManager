//
//  UIFont+FHSuperExt.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (FHSuperExt)

/** 自定义字体的获取 */
+ (UIFont *)fh_fontWithTTFAtPath:(NSString *)path size:(CGFloat)size;

@end
