//
//  UIView+FHBadge.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FHBadge)

@property (nonatomic, copy) NSString *badgeValue; /**< 显示数值 */

@property (nonatomic, strong) UILabel  *fh_badgeLabel; /**< 角标 */
@property (nonatomic, assign) CGFloat   fh_badgeOriginX; /**< 原坐标x */
@property (nonatomic, assign) CGFloat   fh_badgeOriginY; /**< 原坐标y */
@property (nonatomic, strong) UIColor  *fh_badgeBgColor; /**< 背景色 */
@property (nonatomic, strong) UIColor  *fh_badgeTextColor; /**< 字体色 */
@property (nonatomic, strong) UIFont   *fh_badgeFont; /**< 字体 */

@property (nonatomic, assign) CGFloat   fh_badgeXPadding; /**< XPadding */
@property (nonatomic, assign) CGFloat   fh_badgeYPadding; /**< YPadding */

@property (nonatomic, assign) CGFloat   fh_badgeMinHeight; /**< MinHeight */

@property (nonatomic, assign) BOOL      fh_hideBadgeWhenZero; /**< 为0时隐藏 */
@property (nonatomic, assign) BOOL      fh_animateBadgeEnable; /**< 当数值变化时是否动画 */

@end
