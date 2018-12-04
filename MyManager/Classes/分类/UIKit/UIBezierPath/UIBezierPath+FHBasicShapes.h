//
//  UIBezierPath+FHBasicShapes.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (FHBasicShapes)

/** 心形 */
+ (UIBezierPath *)fh_heartShape:(CGRect)originalFrame;

/** 用户头像 */
+ (UIBezierPath *)fh_userShape:(CGRect)originalFrame;

/** 马丁尼酒杯 */
+ (UIBezierPath *)fh_martiniShape:(CGRect)originalFrame;

/** 烧杯 */
+ (UIBezierPath *)fh_beakerShape:(CGRect)originalFrame;

/** 五角星 */
+ (UIBezierPath *)fh_starShape:(CGRect)originalFrame;

/** 多个小五角星 */
+ (UIBezierPath *)fh_stars:(NSUInteger)numberOfStars shapeInFrame:(CGRect)originalFrame;

@end
