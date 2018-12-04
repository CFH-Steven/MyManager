//
//  UIButton+FHImagePosition.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, FHButtomImagePosition) {
    FHButtomImagePositionLeft   = 0,
    FHButtomImagePositionRight,
    FHButtomImagePositionTop,
    FHButtomImagePositionBottom,
};

@interface UIButton (FHImagePosition)

/** 设置图片和image的位置 */
- (void)fh_setImagePosition:(FHButtomImagePosition)postion spacing:(CGFloat)spacing;

@end
