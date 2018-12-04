//
//  UIView+FHBadge.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIView+FHBadge.h"
#import <objc/runtime.h>

static char const *const kUIViewBadegeLabelKey             = "kUIViewBadegeLabelKey";
static char const *const kUIViewBadegeOriginXKey           = "kUIViewBadegeOriginXKey";
static char const *const kUIViewBadegeOriginYKey           = "kUIViewBadegeOriginYKey";
static char const *const kUIViewBadegeValueKey             = "kUIViewBadegeValueKey";
static char const *const kUIViewBadegeBgColorKey           = "kUIViewBadegeBgColorKey";
static char const *const kUIViewBadegeTextColorKey         = "kUIViewBadegeTextColorKey";
static char const *const kUIViewBadegeTextFontKey          = "kUIViewBadegeTextFontKey";
static char const *const kUIViewBadegeXPaddingKey          = "kUIViewBadegeXPaddingKey";
static char const *const kUIViewBadegeYPaddingKey          = "kUIViewBadegeYPaddingKey";
static char const *const kUIViewBadegeMinHeightKey         = "kUIViewBadegeMinHeightKey";
static char const *const kUIViewBadegeHideBadgeWhenZeroKey = "kUIViewBadegeHideBadgeWhenZeroKey";
static char const *const kUIViewBadegeAnimateBadgeKey      = "kUIViewBadegeAnimateBadgeKey";

@implementation UIView (FHBadge)

// 初始化设置
- (void)fh_badgeInitial{
    
    // 初始配置
    self.fh_badgeBgColor = [UIColor redColor];
    self.fh_badgeTextColor = [UIColor whiteColor];
    self.fh_badgeFont = [UIFont systemFontOfSize:12.0f];
    self.fh_badgeXPadding = 6.0f;
    self.fh_badgeYPadding = 6.0f;
    self.fh_badgeMinHeight = 8.0f;
    self.fh_badgeOriginX = self.frame.size.width - self.fh_badgeLabel.frame.size.width * 0.5;
    self.fh_badgeOriginY = -4.0f;
    self.fh_hideBadgeWhenZero = YES;
    self.fh_animateBadgeEnable = YES;
    self.clipsToBounds = NO;
}

#pragma mark - Lazy
// 显示badge
- (void)setfh_badgeLabel:(UILabel *)fh_badgeLabel{
    objc_setAssociatedObject(self, kUIViewBadegeLabelKey, fh_badgeLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)fh_badgeLabel{
    UILabel *badgeLabel = objc_getAssociatedObject(self, kUIViewBadegeLabelKey);
    return badgeLabel;
}

// 起始X
- (void)setfh_badgeOriginX:(CGFloat)fh_badgeOriginX{
    NSNumber *badgeOriginX = [NSNumber numberWithDouble:fh_badgeOriginX];
    objc_setAssociatedObject(self, kUIViewBadegeOriginXKey, badgeOriginX, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.fh_badgeLabel) {
        [self _fh_updateBadgeFrame];
    }
}

- (CGFloat)fh_badgeOriginX{
    NSNumber *badgeOriginX = objc_getAssociatedObject(self, kUIViewBadegeOriginXKey);
    return badgeOriginX.floatValue;
}

// 起始Y

- (void)setfh_badgeOriginY:(CGFloat)fh_badgeOriginY{
    NSNumber *badgeOriginY = [NSNumber numberWithDouble:fh_badgeOriginY];
    objc_setAssociatedObject(self, kUIViewBadegeOriginYKey, badgeOriginY, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.fh_badgeLabel) {
        [self _fh_updateBadgeFrame];
    }
}

- (CGFloat)fh_badgeOriginY{
    NSNumber *badgeOriginX = objc_getAssociatedObject(self, kUIViewBadegeOriginYKey);
    return badgeOriginX.floatValue;
}

// 数值
- (void)setBadgeValue:(NSString *)badgeValue{
    objc_setAssociatedObject(self, kUIViewBadegeValueKey, badgeValue, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    if (!badgeValue || [badgeValue isEqualToString:@""] || ([badgeValue isEqualToString:@"0"] && self.fh_hideBadgeWhenZero)) {
        [self fh_removeBadge];
    } else if (!self.fh_badgeLabel) {
        self.fh_badgeLabel                      = [[UILabel alloc] initWithFrame:CGRectMake(self.fh_badgeOriginX, self.fh_badgeOriginY, 20, 20)];
        self.fh_badgeLabel.textColor            = self.fh_badgeTextColor;
        self.fh_badgeLabel.backgroundColor      = self.fh_badgeBgColor;
        self.fh_badgeLabel.font                 = self.fh_badgeFont;
        self.fh_badgeLabel.textAlignment        = NSTextAlignmentCenter;
        [self fh_badgeInitial];
        [self addSubview:self.fh_badgeLabel];
        [self fh_updateBadgeValueAnimated:NO];
    } else {
        [self fh_updateBadgeValueAnimated:YES];
    }
}

- (NSString *)badgeValue{
    return objc_getAssociatedObject(self, kUIViewBadegeValueKey);
}

// 背景色
- (void)setfh_badgeBgColor:(UIColor *)fh_badgeBgColor{
    objc_setAssociatedObject(self, kUIViewBadegeBgColorKey, fh_badgeBgColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.fh_badgeLabel) {
        [self fh_refreshBadge];
    }
}

- (UIColor *)fh_badgeBgColor{
    return objc_getAssociatedObject(self, kUIViewBadegeBgColorKey);
}

// 字体颜色
- (void)setfh_badgeTextColor:(UIColor *)fh_badgeTextColor{
    objc_setAssociatedObject(self, kUIViewBadegeTextColorKey, fh_badgeTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.fh_badgeLabel) {
        [self fh_refreshBadge];
    }
}

- (UIColor *)fh_badgeTextColor{
    return objc_getAssociatedObject(self, kUIViewBadegeTextColorKey);
}

// 字体
- (void)setfh_badgeFont:(UIFont *)fh_badgeFont{
    objc_setAssociatedObject(self, kUIViewBadegeTextFontKey, fh_badgeFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.fh_badgeLabel) {
        [self fh_refreshBadge];
    }
}

- (UIFont *)fh_badgeFont{
    return objc_getAssociatedObject(self, kUIViewBadegeTextFontKey);
}

// Xpadding
- (void)setfh_badgeXPadding:(CGFloat)fh_badgeXPadding{
    NSNumber *number = [NSNumber numberWithDouble:fh_badgeXPadding];
    objc_setAssociatedObject(self, kUIViewBadegeXPaddingKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.fh_badgeLabel) {
        [self _fh_updateBadgeFrame];
    }
}

- (CGFloat)fh_badgeXPadding{
    NSNumber *paddingNumber = objc_getAssociatedObject(self, kUIViewBadegeXPaddingKey);
    return paddingNumber.floatValue;
}

// Ypadding
- (void)setfh_badgeYPadding:(CGFloat)fh_badgeYPadding{
    NSNumber *number = [NSNumber numberWithDouble:fh_badgeYPadding];
    objc_setAssociatedObject(self, kUIViewBadegeYPaddingKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.fh_badgeLabel) {
        [self _fh_updateBadgeFrame];
    }
}

- (CGFloat)fh_badgeYPadding{
    NSNumber *paddingNumber = objc_getAssociatedObject(self, kUIViewBadegeYPaddingKey);
    return paddingNumber.floatValue;
}

// 最小高度
- (void)setfh_badgeMinHeight:(CGFloat)fh_badgeMinHeight{
    NSNumber *number = [NSNumber numberWithDouble:fh_badgeMinHeight];
    objc_setAssociatedObject(self, kUIViewBadegeMinHeightKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.fh_badgeLabel) {
        [self _fh_updateBadgeFrame];
    }
}

- (CGFloat)fh_badgeMinHeight{
    NSNumber *minHeight = objc_getAssociatedObject(self, kUIViewBadegeMinHeightKey);
    return minHeight.floatValue;
}

// 自动消失
- (void)setfh_hideBadgeWhenZero:(BOOL)fh_hideBadgeWhenZero{
    NSNumber *number = [NSNumber numberWithBool:fh_hideBadgeWhenZero];
    objc_setAssociatedObject(self, kUIViewBadegeHideBadgeWhenZeroKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.fh_badgeLabel) {
        [self fh_refreshBadge];
    }
}

- (BOOL)fh_hideBadgeWhenZero{
    NSNumber *number = objc_getAssociatedObject(self, kUIViewBadegeHideBadgeWhenZeroKey);
    return number.boolValue;
}

/** 动画 */
- (void)setfh_animateBadgeEnable:(BOOL)fh_animateBadgeEnable{
    NSNumber *number = [NSNumber numberWithBool:fh_animateBadgeEnable];
    objc_setAssociatedObject(self, kUIViewBadegeAnimateBadgeKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.fh_badgeLabel) {
        [self fh_refreshBadge];
    }
}

- (BOOL)fh_animateBadgeEnable{
    NSNumber *number = objc_getAssociatedObject(self, kUIViewBadegeAnimateBadgeKey);
    return number.boolValue;
}

#pragma mark - 更新Frame
- (void)_fh_updateBadgeFrame{
    
    CGSize expectedLabelSize = [self fh_badgeExpectedSize];
    CGFloat paddingX = self.fh_badgeXPadding;
    CGFloat paddingY = self.fh_badgeYPadding;
    
    CGFloat minHeight = expectedLabelSize.height;
    minHeight = (minHeight < self.fh_badgeMinHeight)?self.fh_badgeMinHeight:expectedLabelSize.height;
    
    CGFloat minWidth = expectedLabelSize.width;
    minWidth = (minWidth < minHeight)?minHeight:expectedLabelSize.width;
    self.fh_badgeLabel.layer.masksToBounds = YES;
    self.fh_badgeLabel.frame = CGRectMake(self.fh_badgeOriginX, self.fh_badgeOriginY, minWidth + paddingX, minHeight + paddingY);
    self.fh_badgeLabel.layer.cornerRadius = (minHeight + paddingY) * 0.5;
}

// 适配字体
- (CGSize)fh_badgeExpectedSize{
    UILabel *frameLabel = [self fh_duplicateLabel:self.fh_badgeLabel];
    [frameLabel sizeToFit];
    return frameLabel.frame.size;
}

/** 复制 */
- (UILabel *)fh_duplicateLabel:(UILabel *)labelToCopy{
    UILabel *duplicateLabel = [[UILabel alloc] initWithFrame:labelToCopy.frame];
    duplicateLabel.text = labelToCopy.text;
    duplicateLabel.font = labelToCopy.font;
    return duplicateLabel;
}

/** 刷新数据 */
- (void)fh_refreshBadge{
    
    self.fh_badgeLabel.textColor       = self.fh_badgeTextColor;
    self.fh_badgeLabel.backgroundColor = self.fh_badgeBgColor;
    self.fh_badgeLabel.font            = self.fh_badgeFont;
}

- (void)fh_updateBadgeValueAnimated:(BOOL)animated{
    
    if (animated && self.fh_animateBadgeEnable && ![self.fh_badgeLabel.text isEqualToString:self.badgeValue]) {
        CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        [animation setFromValue:[NSNumber numberWithFloat:1.5]];
        [animation setToValue:[NSNumber numberWithFloat:1]];
        [animation setDuration:0.2];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.4f :1.3f :1.f :1.f]];
        [self.fh_badgeLabel.layer addAnimation:animation forKey:@"bounceAnimation"];
    }
    
    self.fh_badgeLabel.text = self.badgeValue;
    
    if (animated && self.fh_animateBadgeEnable) {
        [UIView animateWithDuration:0.2 animations:^{
            [self _fh_updateBadgeFrame];
        }];
    } else {
        [self _fh_updateBadgeFrame];
    }
}

/** 移除 */
- (void)fh_removeBadge{
    
    [UIView animateWithDuration:0.2 animations:^{
        self.fh_badgeLabel.transform = CGAffineTransformMakeScale(0, 0);
    } completion:^(BOOL finished) {
        [self.fh_badgeLabel removeFromSuperview];
        self.fh_badgeLabel = nil;
    }];
}

@end
