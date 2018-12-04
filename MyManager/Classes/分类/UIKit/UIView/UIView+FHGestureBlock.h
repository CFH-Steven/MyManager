//
//  UIView+FHGestureBlock.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/4/27.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^FHGestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface UIView (FHGestureBlock)

/** 添加 Tap 手势 */
- (void)addTapGestureWithBlock:(FHGestureActionBlock)block;

/** 添加 LongPressGesture 手势 */
- (void)addLongPressGestureWithBlock:(FHGestureActionBlock)block;

@end
