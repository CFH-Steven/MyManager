//
//  UIWindow+FHSuperExt.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (FHSuperExt)

/** 最底层的控制器 */
- (UIViewController *)fh_topMostController;

/** 当前显示的控制器 */
- (UIViewController *)fh_currentViewController;

@end
