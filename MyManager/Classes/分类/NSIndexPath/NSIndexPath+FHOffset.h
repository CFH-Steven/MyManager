//
//  NSIndexPath+FHOffset.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSIndexPath (FHOffset)

/** 上一行 */
- (NSIndexPath *)previousRow;

/** 下一行 */
- (NSIndexPath *)nextRow;

/** 上一项 */
- (NSIndexPath *)previousItem;

/** 下一项 */
- (NSIndexPath *)nextItem;

/** 上一组 */
- (NSIndexPath *)previousSection;

/** 下一组 */
- (NSIndexPath *)nextSection;


@end
