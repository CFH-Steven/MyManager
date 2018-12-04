//
//  UIViewController+FHFullScreenSupport.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIViewController+FHFullScreenSupport.h"

#if __IPHONE_7_0 && __IPHONE_OS_VERSION_MAX_ALLOWED >=  __IPHONE_7_0
#define fh_IS_RUNNING_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#else
#define fh_IS_RUNNING_IOS7 NO
#endif

@implementation UIViewController (FHFullScreenSupport)

- (void)fh_showNavigationBar:(BOOL)animated toStatusBar:(BOOL)toStatusBar duration:(NSTimeInterval)duration completion:(FHFinishedBlock)completion{
    CGSize statuBarFrameSize = [UIApplication sharedApplication].statusBarFrame.size;
    CGFloat statusBarHeight = [self isPortrait] ? statuBarFrameSize.height : statuBarFrameSize.width;
    [self fh_setNavigationBarOriginY:statusBarHeight animated:animated toStatusBar:(BOOL)toStatusBar duration:duration completion:completion];
    
}

- (void)fh_hideNavigationBar:(BOOL)animated toStatusBar:(BOOL)toStatusBar duration:(NSTimeInterval)duration completion:(FHFinishedBlock)completion{
    CGSize statuBarFrameSize = [UIApplication sharedApplication].statusBarFrame.size;
    CGFloat statusBarHeight = [self isPortrait] ? statuBarFrameSize.height : statuBarFrameSize.width;
    CGFloat navigationBarHeight = self.navigationController.navigationBar.frame.size.height;
    CGFloat top = (toStatusBar)?(-navigationBarHeight + statusBarHeight):(-navigationBarHeight - statusBarHeight);
    [self fh_setNavigationBarOriginY:top animated:animated toStatusBar:(BOOL)toStatusBar duration:duration completion:completion];
}

- (void)fh_moveNavigtionBar:(CGFloat)deltaY animated:(BOOL)animated toStatusBar:(BOOL)toStatusBar duration:(NSTimeInterval)duration completion:(FHFinishedBlock)completion{
    CGRect frame = self.navigationController.navigationBar.frame;
    CGFloat nextY = frame.origin.y + deltaY;
    [self fh_setNavigationBarOriginY:nextY animated:animated toStatusBar:(BOOL)toStatusBar duration:duration completion:completion];
}

- (void)fh_setNavigationBarOriginY:(CGFloat)y animated:(BOOL)animated toStatusBar:(BOOL)toStatusBar duration:(NSTimeInterval)duration completion:(FHFinishedBlock)completion{
    CGSize statuBarFrameSize = [UIApplication sharedApplication].statusBarFrame.size;
    CGFloat statusBarHeight = [self isPortrait] ? statuBarFrameSize.height : statuBarFrameSize.width;
    CGRect frame = self.navigationController.navigationBar.frame;
    CGFloat navigationBarHeight = frame.size.height;
    
    CGFloat topLimit = (toStatusBar)?(-navigationBarHeight + statusBarHeight):(-navigationBarHeight - statusBarHeight);
    CGFloat bottomLimit = statusBarHeight;
    
    frame.origin.y = fmin(fmax(y, topLimit), bottomLimit);
    CGFloat alpha = 1 - (statusBarHeight - frame.origin.y) / statusBarHeight;
//    UIColor *titleTextColor = [UIColor colorWithWhite:0.0 alpha:alpha]; // fade title
    
    [UIView animateWithDuration:animated ? duration : 0.0f animations:^{
        self.navigationController.navigationBar.frame = frame;
//        [self.navigationController.navigationBar setTitleTextAttributes:@{ NSForegroundColorAttributeName : titleTextColor }];
        if (fh_IS_RUNNING_IOS7) {
            // fade bar buttons
            UIColor *tintColor = self.navigationController.navigationBar.tintColor;
            if (tintColor) {
                CGFloat *components = (CGFloat *)CGColorGetComponents(tintColor.CGColor);
                self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:components[0] green:components[1] blue:components[2] alpha:alpha];
            }
        }
    } completion:completion];
}

#pragma mark - ToolBar
- (void)fh_showToolbar:(BOOL)animated duration:(NSTimeInterval)duration completion:(FHFinishedBlock)completion{
    CGSize viewSize = self.navigationController.view.frame.size;
    CGFloat viewHeight = [self isPortrait] ? viewSize.height : viewSize.width;
    CGFloat toolbarHeight = self.tabBarController.tabBar.frame.size.height;
    [self fh_setToolbarOriginY:viewHeight - toolbarHeight animated:animated duration:duration completion:completion];
}

- (void)fh_hideToolbar:(BOOL)animated duration:(NSTimeInterval)duration completion:(FHFinishedBlock)completion{
    CGSize viewSize = self.navigationController.view.frame.size;
    CGFloat viewHeight = [self isPortrait] ? viewSize.height : viewSize.width;
    [self fh_setToolbarOriginY:viewHeight animated:animated duration:duration completion:completion];
}

- (void)fh_moveToolbar:(CGFloat)deltaY animated:(BOOL)animated duration:(NSTimeInterval)duration completion:(FHFinishedBlock)completion{
    CGRect frame = self.tabBarController.tabBar.frame;
    CGFloat nextY = frame.origin.y + deltaY;
    [self fh_setToolbarOriginY:nextY animated:animated duration:duration completion:completion];
}

- (void)fh_setToolbarOriginY:(CGFloat)y animated:(BOOL)animated duration:(NSTimeInterval)duration completion:(FHFinishedBlock)completion{
    CGRect frame = self.tabBarController.tabBar.frame;
    CGFloat toolBarHeight = frame.size.height;
    CGSize viewSize = self.navigationController.view.frame.size;
    CGFloat viewHeight = [self isPortrait] ? viewSize.height : viewSize.width;
    
    CGFloat topLimit = viewHeight - toolBarHeight;
    CGFloat bottomLimit = viewHeight;
    
    frame.origin.y = fmin(fmax(y, topLimit), bottomLimit); // limit over moving
    
    [UIView animateWithDuration:animated ? duration : 0.0 animations:^{
        self.tabBarController.tabBar.frame = frame;
    } completion:completion];
}

- (BOOL)isPortrait {
    return [[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait;
}

#pragma mark - TabBar

- (void)fh_showTabBar:(BOOL)animated duration:(NSTimeInterval)duration completion:(FHFinishedBlock)completion{
    CGFloat viewHeight = self.tabBarController.view.frame.size.height;
    CGFloat toolbarHeight = self.tabBarController.tabBar.frame.size.height;
    [self fh_setToolbarOriginY:viewHeight - toolbarHeight animated:animated duration:duration completion:completion];
}

- (void)fh_hideTabBar:(BOOL)animated duration:(NSTimeInterval)duration completion:(FHFinishedBlock)completion{
    CGSize viewSize = self.tabBarController.view.frame.size;
    CGFloat viewHeight = [self isPortrait] ? viewSize.height : viewSize.width;
    [self fh_setToolbarOriginY:viewHeight animated:animated duration:duration completion:completion];
}

- (void)fh_moveTabBar:(CGFloat)deltaY animated:(BOOL)animated duration:(NSTimeInterval)duration completion:(FHFinishedBlock)completion{
    CGRect frame =  self.tabBarController.tabBar.frame;
    CGFloat nextY = frame.origin.y + deltaY;
    [self fh_setToolbarOriginY:nextY animated:animated duration:duration completion:completion];
}

- (void)fh_setTabBarOriginY:(CGFloat)y animated:(BOOL)animated duration:(NSTimeInterval)duration completion:(FHFinishedBlock)completion{
    CGRect frame = self.tabBarController.tabBar.frame;
    CGFloat toolBarHeight = frame.size.height;
    CGSize viewSize = self.tabBarController.view.frame.size;
    CGFloat viewHeight = [self isPortrait] ? viewSize.height : viewSize.width;
    
    CGFloat topLimit = viewHeight - toolBarHeight;
    CGFloat bottomLimit = viewHeight;
    
    frame.origin.y = fmin(fmax(y, topLimit), bottomLimit); // limit over moving
    
    [UIView animateWithDuration:animated ? duration : 0.0 animations:^{
        self.tabBarController.tabBar.frame = frame;
    } completion:completion];
}

@end
