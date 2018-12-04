//
//  UIView+FHFind.h
//  FHCategoriesGather
//
//  Created by FHHou on 2016/2/18.
//  Copyright © 2016年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FHFind)

/** 找到指定类名的subview子对象 */
- (id)fh_findSubViewWithSubViewClass:(Class)clazz;

/** 找到指定类名的SuperView对象 */
- (id)fh_findSuperViewWithSuperViewClass:(Class)clazz;

/** 找到第一响应者 */
- (UIView *)fh_findFirstResponder;

/** 找到第一响应者并注销 */
- (BOOL)fh_findFirstResponderAndResign;

/** 找到当前view所在的viewcontroler */
- (UIViewController *)fh_findSelfInViewController;

@end
