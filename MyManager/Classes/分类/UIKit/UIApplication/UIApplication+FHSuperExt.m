//
//  UIApplication+FHSuperExt.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIApplication+FHSuperExt.h"
#import <libkern/OSAtomic.h>

static volatile int32_t numberOfActiveNetworkConnectionsxxx;   // 网络请求指示
static CGRect _fh_keyboardFrame = (CGRect){ (CGPoint){ 0.0f, 0.0f }, (CGSize){ 0.0f, 0.0f }};


@implementation UIApplication (FHSuperExt)

/** 开始网络请求指示 */
- (void)fh_startNetworkActivity{
    self.networkActivityIndicatorVisible = OSAtomicAdd32(1, &numberOfActiveNetworkConnectionsxxx) > 0;
}

/** 停止网络请求指示 */
- (void)fh_stopNetworkActivity{
    self.networkActivityIndicatorVisible = OSAtomicAdd32(-1, &numberOfActiveNetworkConnectionsxxx) > 0;
}

/** 键盘的大小 */
- (CGRect)fh_keyboardFrame{
    return _fh_keyboardFrame;
}

+ (void)load{
    [NSNotificationCenter.defaultCenter addObserverForName:UIKeyboardDidShowNotification object:nil queue:nil usingBlock:^(NSNotification *note){
         _fh_keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
     }];
    [NSNotificationCenter.defaultCenter addObserverForName:UIKeyboardDidChangeFrameNotification object:nil queue:nil usingBlock:^(NSNotification *note){
         _fh_keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
     }];
    [NSNotificationCenter.defaultCenter addObserverForName:UIKeyboardDidHideNotification object:nil queue:nil usingBlock:^(NSNotification *note){
         _fh_keyboardFrame = CGRectZero;
     }];
}


@end
