//
//  UIScrollView+FHSuperExt.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (FHSuperExt)

/** 共多少页 */
- (NSInteger)fh_allPages;

/** 当前是第几页 */
- (NSInteger)fh_currentPage;

/** 滚动百分比 */
- (CGFloat)fh_scrollPercent;

/** x方向上的页数 */
- (CGFloat)fh_pagesX;

/** y方向上的页数 */
- (CGFloat)fh_pagesY;

/** X当前是第几页 */
- (CGFloat)fh_currentPageX;

/** Y当前是第几页 */
- (CGFloat)fh_currentPageY;

/** 设置X方向页数 */
- (void)fh_setPageX:(NSInteger)page animated:(BOOL)animated;

/** 设置Y方向页数 */
- (void)fh_setPageY:(NSInteger)page animated:(BOOL)animated;

@end
