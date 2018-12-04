//
//  UIViewController+FHBackButtonBlock.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIViewController+FHBackButtonBlock.h"
#import <objc/runtime.h>

static char const * const FHBackButtonHandlerKey = "FHBackButtonHandlerKey";

@implementation UIViewController (FHBackButtonBlock)

/** 返回按钮的预处理操作 */
- (void)fh_backButtonClickBlock:(FHBackButtonHandlBlock)clickBlock{
    objc_setAssociatedObject(self, FHBackButtonHandlerKey, clickBlock, OBJC_ASSOCIATION_COPY);
}

- (FHBackButtonHandlBlock)fh_backButtonClickBlock{
    return objc_getAssociatedObject(self, FHBackButtonHandlerKey);
}

@end


@implementation UINavigationController (FHBackButtonBlock)

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item{
    
    if([self.viewControllers count] < [navigationBar.items count]) {
        return YES;
    }
    
   	UIViewController *vc = [self topViewController];
    FHBackButtonHandlBlock handler = [vc fh_backButtonClickBlock];
    if (handler) {
        for(UIView *subview in [navigationBar subviews]) {
            if(subview.alpha < 1.0f) {
                [UIView animateWithDuration:0.25f animations:^{
                    subview.alpha = 1.0f;
                }];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            handler(self);
        });
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self popViewControllerAnimated:YES];
        });
    }
    return NO;
}
@end

