//
//  UIBezierPath+FHLength.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (FHLength)

/** 总长度 */
- (CGFloat)fh_length;

/** 百分数的位置 */
- (CGPoint)fh_pointAtPercentOfLength:(CGFloat)percent;

@end
