//
//  UIViewController+FHSuperExt.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIViewController+FHSuperExt.h"

@implementation UIViewController (FHSuperExt)

/** vc 是否已经显示 */
- (BOOL)fh_isVisible{
    return ([self isViewLoaded] && self.view.window);
}

@end
