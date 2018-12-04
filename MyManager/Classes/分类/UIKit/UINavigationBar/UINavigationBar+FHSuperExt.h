//
//  UINavigationBar+FHSuperExt.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (FHSuperExt)

@property (nonatomic, strong) UIView *fh_overlayView; /**< 导航条颜色视图 */

/** 导航栏设置背景颜色 */
- (void)fh_setBackgroundColor:(UIColor *)backgroundColor;

/** 修改导航栏的位置 */
- (void)fh_setTranslationY:(CGFloat)translationY;

/** 设置添加视图的透明度 */
- (void)fh_setElementsAlpha:(CGFloat)alpha;

/** 重新设置初始化 */
- (void)fh_reset;


@end
