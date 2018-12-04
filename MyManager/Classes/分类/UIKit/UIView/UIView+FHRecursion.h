//
//  UIView+FHRecursion.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/4/27.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//  UIView 递归分类

#import <UIKit/UIKit.h>

typedef void (^FHSubviewBlock) (UIView *view);
typedef void (^FHSuperviewBlock) (UIView *superview);

@interface UIView (FHRecursion)

/** 所有 SubView 都执行Block */
- (void)subViewsAllExecuteBlock:(FHSubviewBlock)block;

/** 所有 SuperView 都执行Block */
-(void)superViewsAllExecuteBlock:(FHSuperviewBlock)block;

/** 所有 SubView Control 设为 Enable  */
- (void)subViewsAllControlsEnable:(BOOL)enable;

/** 递归寻找子视图 */
- (UIView *)findSubViewRecursively:(BOOL(^)(UIView *subview, BOOL *stop))recurse;

@end
