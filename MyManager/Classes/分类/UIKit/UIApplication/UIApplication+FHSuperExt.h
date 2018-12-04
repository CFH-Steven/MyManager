//
//  UIApplication+FHSuperExt.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (FHSuperExt)

/** 开始网络请求指示 */
- (void)fh_startNetworkActivity;

/** 停止网络请求指示 */
- (void)fh_stopNetworkActivity;

/** 键盘的大小 */
- (CGRect)fh_keyboardFrame;

@end
