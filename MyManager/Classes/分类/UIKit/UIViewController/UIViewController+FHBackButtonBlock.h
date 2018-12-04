//
//  UIViewController+FHBackButtonBlock.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//  在点击返回按钮前需要做的操作

#import <UIKit/UIKit.h>

typedef void(^FHBackButtonHandlBlock)(__kindof UIViewController *vc);

@interface UIViewController (FHBackButtonBlock)

/** 返回按钮的预处理操作 */
- (void)fh_backButtonClickBlock:(FHBackButtonHandlBlock)clickBlock;

@end
