//
//  UIResponder+FHSuperExt.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (FHSuperExt)

/** 当前第一响应者 */
+ (id)fh_currentFirstResponder;

/** 响应者链 */
- (NSString *)fh_responderChainDescription;

@end
