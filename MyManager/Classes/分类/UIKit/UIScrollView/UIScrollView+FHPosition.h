//
//  UIScrollView+FHPosition.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 手势滚动方向 */
typedef NS_ENUM(NSInteger, FHScrollDirection) {
    FHScrollDirectionUp,
    FHScrollDirectionDown,
    FHScrollDirectionLeft,
    FHScrollDirectionRight,
    FHScrollDirectionWTF
};

@interface UIScrollView (FHPosition)

@property (nonatomic, assign) CGFloat fh_contentWidth; /**< 宽 */
@property (nonatomic, assign) CGFloat fh_contentHeight; /**< 高 */
@property (nonatomic, assign) CGFloat fh_contentOffsetX; /**< x */
@property (nonatomic, assign) CGFloat fh_contentOffsetY; /**< y */

/** 顶部偏移量 */
- (CGPoint)fh_topContentOffset;

/** 底部偏移量 */
- (CGPoint)fh_bottomContentOffset;

/** 左边偏移量 */
- (CGPoint)fh_leftContentOffset;

/** 右边偏移量 */
- (CGPoint)fh_rightContentOffset;

/** 手势滚动方向 */
- (FHScrollDirection)fh_ScrollDirection;

/** 是否滚动到了top */
- (BOOL)fh_isScrolledToTop;

/** 是否滚动到了Bottom */
- (BOOL)fh_isScrolledToBottom;

/** 是否滚动到了Left */
- (BOOL)fh_isScrolledToLeft;

/** 是否滚动到了Right */
- (BOOL)fh_isScrolledToRight;

/** 动画滚动 */
- (void)fh_scrollToTopAnimated:(BOOL)animated;
- (void)fh_scrollToBottomAnimated:(BOOL)animated;
- (void)fh_scrollToLeftAnimated:(BOOL)animated;
- (void)fh_scrollToRightAnimated:(BOOL)animated;

/** 当前滚动页面 及 滚动到哪一页 */
- (NSUInteger)fh_verticalPageIndex;
- (NSUInteger)fh_horizontalPageIndex;
- (void)fh_scrollToVerticalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated;
- (void)fh_scrollToHorizontalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated;

@end
