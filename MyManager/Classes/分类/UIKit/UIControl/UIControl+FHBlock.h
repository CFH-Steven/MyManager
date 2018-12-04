//
//  UIControl+FHBlock.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (FHBlock)

/** 添加Block 事件 */
- (void)fh_addControlBlock:(void (^)(__kindof UIControl *sender))block events:(UIControlEvents)events;

@end
