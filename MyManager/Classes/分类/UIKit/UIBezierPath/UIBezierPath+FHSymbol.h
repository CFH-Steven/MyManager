//
//  UIBezierPath+FHSymbol.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, FHUIBezierPathArrowDirection) {
    kUIBezierPathArrowDirectionNone  = 0,
    kUIBezierPathArrowDirectionRight = 1 << 0,
    kUIBezierPathArrowDirectionLeft  = 1 << 1,
    kUIBezierPathArrowDirectionUp    = 1 << 2,
    kUIBezierPathArrowDirectionDown  = 1 << 3
};

@interface UIBezierPath (FHSymbol)

/** +号 */
+ (UIBezierPath *)fh_customBezierPathOfPlusSymbolWithRect:(CGRect)rect scale:(CGFloat)scale;

/** -减号 */
+ (UIBezierPath *)fh_customBezierPathOfMinusSymbolWithRect:(CGRect)rect scale:(CGFloat)scale;

/** 对号 */
+ (UIBezierPath *)fh_customBezierPathOfCheckSymbolWithRect:(CGRect)rect scale:(CGFloat)scale thick:(CGFloat)thick;

/** x号 */
+ (UIBezierPath *)fh_customBezierPathOfCrossSymbolWithRect:(CGRect)rect scale:(CGFloat)scale thick:(CGFloat)thick;

/** 箭头 */
+ (UIBezierPath *)fh_customBezierPathOfArrowSymbolWithRect:(CGRect)rect scale:(CGFloat)scale thick:(CGFloat)thick direction:(FHUIBezierPathArrowDirection)direction;

/** 铅笔 */
+ (UIBezierPath *)fh_customBezierPathOfPencilSymbolWithRect:(CGRect)rect scale:(CGFloat)scale thick:(CGFloat)thick;

@end
