//
//  UIScrollView+FHPosition.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIScrollView+FHPosition.h"

@implementation UIScrollView (FHPosition)

- (CGFloat)fh_contentWidth{
    return self.contentSize.width;
}

- (void)setfh_contentWidth:(CGFloat)fh_contentWidth{
    self.contentSize = CGSizeMake(fh_contentWidth, self.frame.size.height);
}

- (CGFloat)fh_contentHeight{
    return self.contentSize.height;
}

- (void)setfh_contentHeight:(CGFloat)fh_contentHeight{
    self.contentSize = CGSizeMake(self.frame.size.width, fh_contentHeight);
}

- (CGFloat)fh_contentOffsetX{
    return self.contentOffset.x;
}

- (void)setfh_contentOffsetX:(CGFloat)fh_contentOffsetX{
    self.contentOffset = CGPointMake(fh_contentOffsetX, self.contentOffset.y);
}

- (CGFloat)fh_contentOffsetY{
    return self.contentOffset.y;
}

- (void)setfh_contentOffsetY:(CGFloat)fh_contentOffsetY{
    self.contentOffset = CGPointMake(self.contentOffset.x, fh_contentOffsetY);
}

- (CGPoint)fh_topContentOffset{
    return CGPointMake(0.0f, -self.contentInset.top);
}

- (CGPoint)fh_bottomContentOffset{
    return CGPointMake(0.0f, self.contentSize.height + self.contentInset.bottom - self.bounds.size.height);
}
- (CGPoint)fh_leftContentOffset{
    return CGPointMake(-self.contentInset.left, 0.0f);
}

- (CGPoint)fh_rightContentOffset{
    return CGPointMake(self.contentSize.width + self.contentInset.right - self.bounds.size.width, 0.0f);
}


- (FHScrollDirection)fh_ScrollDirection{
    
    FHScrollDirection direction;
    
    if ([self.panGestureRecognizer translationInView:self.superview].y > 0.0f){
        direction = FHScrollDirectionUp;
    }else if ([self.panGestureRecognizer translationInView:self.superview].y < 0.0f){
        direction = FHScrollDirectionDown;
    }else if ([self.panGestureRecognizer translationInView:self].x < 0.0f){
        direction = FHScrollDirectionLeft;
    }else if ([self.panGestureRecognizer translationInView:self].x > 0.0f){
        direction = FHScrollDirectionRight;
    }else{
        direction = FHScrollDirectionWTF;
    }
    return direction;
}

- (BOOL)fh_isScrolledToTop{
    return self.contentOffset.y <= [self fh_topContentOffset].y;
}
- (BOOL)fh_isScrolledToBottom{
    return self.contentOffset.y >= [self fh_bottomContentOffset].y;
}

- (BOOL)fh_isScrolledToLeft{
    return self.contentOffset.x <= [self fh_leftContentOffset].x;
}
- (BOOL)fh_isScrolledToRight{
    return self.contentOffset.x >= [self fh_rightContentOffset].x;
}

- (void)fh_scrollToTopAnimated:(BOOL)animated{
    [self setContentOffset:[self fh_topContentOffset] animated:animated];
}

- (void)fh_scrollToBottomAnimated:(BOOL)animated{
    [self setContentOffset:[self fh_bottomContentOffset] animated:animated];
}

- (void)fh_scrollToLeftAnimated:(BOOL)animated{
    [self setContentOffset:[self fh_leftContentOffset] animated:animated];
}

- (void)fh_scrollToRightAnimated:(BOOL)animated{
    [self setContentOffset:[self fh_rightContentOffset] animated:animated];
}

- (NSUInteger)fh_verticalPageIndex{
    return (self.contentOffset.y + (self.frame.size.height * 0.5f)) / self.frame.size.height;
}

- (NSUInteger)fh_horizontalPageIndex{
    return (self.contentOffset.x + (self.frame.size.width * 0.5f)) / self.frame.size.width;
}

- (void)fh_scrollToVerticalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated{
    [self setContentOffset:CGPointMake(0.0f, self.frame.size.height * pageIndex) animated:animated];
}

- (void)fh_scrollToHorizontalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated{
    [self setContentOffset:CGPointMake(self.frame.size.width * pageIndex, 0.0f) animated:animated];
}

@end
