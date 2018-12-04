//
//  UIWindow+FHSuperExt.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIWindow+FHSuperExt.h"

@implementation UIWindow (FHSuperExt)

/** 最底层的控制器 */
- (UIViewController *)fh_topMostController{
    UIViewController *topController = [self rootViewController];
    
    while ([topController presentedViewController])	topController = [topController presentedViewController];
    return topController;
}

/** 当前显示的控制器 */
- (UIViewController *)fh_currentViewController{
    UIViewController *currentViewController = [self fh_topMostController];
    
    while ([currentViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)currentViewController topViewController])
        currentViewController = [(UINavigationController*)currentViewController topViewController];
    
    return currentViewController;
}

@end
