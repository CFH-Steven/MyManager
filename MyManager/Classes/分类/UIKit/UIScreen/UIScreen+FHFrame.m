//
//  UIScreen+FHFrame.m
//  FHCategoriesGather
//
//  Created by FHHou on 2017/8/25.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIScreen+FHFrame.h"

@implementation UIScreen (FHFrame)

+ (CGSize)fh_size{
    return [[UIScreen mainScreen] bounds].size;
}

+ (CGFloat)fh_width{
    return [[UIScreen mainScreen] bounds].size.width;
}

+ (CGFloat)fh_height{
    return [[UIScreen mainScreen] bounds].size.height;
}

+ (CGSize)fh_orientationSize{
    CGFloat systemVersion = [[[UIDevice currentDevice] systemVersion]
                             doubleValue];
    BOOL isLand =   UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation);
    return (systemVersion>8.0 && isLand) ? fh_SizeSWAP([UIScreen fh_size]) : [UIScreen fh_size];
}

+ (CGFloat)fh_orientationWidth{
    return [UIScreen fh_orientationSize].width;
}

+ (CGFloat)fh_orientationHeight{
    return [UIScreen fh_orientationSize].height;
}

+ (CGSize)fh_DPISize{
    CGSize size = [[UIScreen mainScreen] bounds].size;
    CGFloat scale = [[UIScreen mainScreen] scale];
    return CGSizeMake(size.width * scale, size.height * scale);
}


/**
 *  交换高度与宽度
 */
static inline CGSize fh_SizeSWAP(CGSize size) {
    return CGSizeMake(size.height, size.width);
}

@end
