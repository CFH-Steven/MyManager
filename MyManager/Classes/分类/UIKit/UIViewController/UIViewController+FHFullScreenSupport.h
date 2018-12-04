//
//  UIViewController+FHFullScreenSupport.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//  本类通过修改系统控件的Frame, 以便支持满屏

#import <UIKit/UIKit.h>

typedef void(^FHFinishedBlock)(BOOL finished);

@interface UIViewController (FHFullScreenSupport)

/** 显示导航栏 */
- (void)fh_showNavigationBar:(BOOL)animated toStatusBar:(BOOL)toStatusBar duration:(NSTimeInterval)duration completion:(FHFinishedBlock)completion;

/** 隐藏导航栏 */
- (void)fh_hideNavigationBar:(BOOL)animated toStatusBar:(BOOL)toStatusBar duration:(NSTimeInterval)duration completion:(FHFinishedBlock)completion;

/** 移动导航栏 */
- (void)fh_moveNavigtionBar:(CGFloat)deltaY animated:(BOOL)animated toStatusBar:(BOOL)toStatusBar duration:(NSTimeInterval)duration completion:(FHFinishedBlock)completion;

/** 设置导航栏起始位置 */
- (void)fh_setNavigationBarOriginY:(CGFloat)y animated:(BOOL)animated toStatusBar:(BOOL)toStatusBar duration:(NSTimeInterval)duration completion:(FHFinishedBlock)completion;


/** 显示Toolbar */
- (void)fh_showToolbar:(BOOL)animated duration:(NSTimeInterval)duration completion:(FHFinishedBlock)completion;

/** 隐藏ToolBar */
- (void)fh_hideToolbar:(BOOL)animated duration:(NSTimeInterval)duration completion:(FHFinishedBlock)completion;

/** 移动ToolBar */
- (void)fh_moveToolbar:(CGFloat)deltaY animated:(BOOL)animated duration:(NSTimeInterval)duration completion:(FHFinishedBlock)completion;

/** 设置ToolBar起始位置 */
- (void)fh_setToolbarOriginY:(CGFloat)y animated:(BOOL)animated duration:(NSTimeInterval)duration completion:(FHFinishedBlock)completion;


/** 显示TabBar */
- (void)fh_showTabBar:(BOOL)animated duration:(NSTimeInterval)duration completion:(FHFinishedBlock)completion;

/** 隐藏TabBar */
- (void)fh_hideTabBar:(BOOL)animated duration:(NSTimeInterval)duration completion:(FHFinishedBlock)completion;

/** 移动TabBar */
- (void)fh_moveTabBar:(CGFloat)deltaY animated:(BOOL)animated duration:(NSTimeInterval)duration completion:(FHFinishedBlock)completion;

/** 设置TabBar起始位置 */
- (void)fh_setTabBarOriginY:(CGFloat)y animated:(BOOL)animated duration:(NSTimeInterval)duration completion:(FHFinishedBlock)completion;

@end
