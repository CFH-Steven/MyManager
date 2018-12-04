//
//  UIView+FHViewSize.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/20.
//  Copyright © 2015年 hm houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FHViewSize)

/** 自适应宽度 */
- (CGRect)fh_getFrameWithFreeWidth:(CGPoint)origin
                       maxHight:(CGFloat)maxHight;

/** 自适应高度 */
- (CGRect)fh_getFrameWithFreeHight:(CGPoint)origin
                       maxWidth:(CGFloat)maxWidth;

/** 自适应宽度--->可调整字间距 */
- (CGRect)fh_getFrameWithFreeWidth:(CGPoint)origin
                       maxHight:(CGFloat)maxHight
                      textSpace:(CGFloat)textSpace;

/** 自适应高度--->可调整字间距和行间距 */
- (CGRect)fh_getFrameWithFreeHight:(CGPoint)origin
                       maxWidth:(CGFloat)maxWidth
                      textSpace:(CGFloat)textSpace
                      lineSpace:(CGFloat)lineSpace;

@end
