//
//  UINavigationBar+FHSuperExt.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UINavigationBar+FHSuperExt.h"
#import <objc/message.h>

static char const * const fh_OVERLAY_Key = "FHOVERLAYKey";

@implementation UINavigationBar (FHSuperExt)

- (UIView *)fh_overlayView{
    return objc_getAssociatedObject(self, fh_OVERLAY_Key);
}

- (void)setfh_overlayView:(UIView *)fh_overlayView{
    objc_setAssociatedObject(self, fh_OVERLAY_Key, fh_overlayView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/** 导航栏设置背景颜色 */
- (void)fh_setBackgroundColor:(UIColor *)backgroundColor{
    if (!self.fh_overlayView) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.fh_overlayView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20)];
        self.fh_overlayView.userInteractionEnabled = NO;
        self.fh_overlayView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self insertSubview:self.fh_overlayView atIndex:0];
    }
    self.fh_overlayView.backgroundColor = backgroundColor;
}

/** 修改导航栏的位置 */
- (void)fh_setTranslationY:(CGFloat)translationY{
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
}

/** 设置添加视图的透明度 */
- (void)fh_setElementsAlpha:(CGFloat)alpha{
    [[self valueForKey:@"_leftViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    [[self valueForKey:@"_rightViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    UIView *titleView = [self valueForKey:@"_titleView"];
    titleView.alpha = alpha;
    //    when viewController first load, the titleView maybe nil
    [[self subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:NSClassFromString(@"UINavigationItemView")]) {
            obj.alpha = alpha;
            *stop = YES;
        }
    }];
}

/** 重新设置初始化 */
- (void)fh_reset{
    self.transform = CGAffineTransformMakeTranslation(0, 0);
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.fh_overlayView removeFromSuperview];
    self.fh_overlayView = nil;
}


@end
