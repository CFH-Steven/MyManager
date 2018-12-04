//
//  UIBezierPath+FHSymbol.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIBezierPath+FHSymbol.h"

#define FHCGPointWithOffset(originPoint, offsetPoint) \
CGPointMake(originPoint.x + offsetPoint.x, originPoint.y + offsetPoint.y)

@implementation UIBezierPath (FHSymbol)

// plus
//
//     c-d
//     | |
//  a--b e--f
//  |       |
//  l--k h--g
//     | |
//     j-i
//
/** +号 */
+ (UIBezierPath *)fh_customBezierPathOfPlusSymbolWithRect:(CGRect)rect scale:(CGFloat)scale{
    CGFloat height     = CGRectGetHeight(rect) * scale;
    CGFloat width      = CGRectGetWidth(rect)  * scale;
    CGFloat size       = (height < width ? height : width) * scale;
    CGFloat thick      = size / 3.f;
    CGFloat twiceThick = thick * 2.f;
    
    CGPoint offsetPoint =
    CGPointMake(CGRectGetMinX(rect) + (CGRectGetWidth(rect)  - size) / 2.f,
                CGRectGetMinY(rect) + (CGRectGetHeight(rect) - size) / 2.f);
    
    UIBezierPath * path = [self bezierPath];
    [path moveToPoint:FHCGPointWithOffset(CGPointMake(0.f, thick), offsetPoint)];                // a
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(thick, thick), offsetPoint)];           // b
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(thick, 0.f), offsetPoint)];             // c
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(twiceThick, 0.f), offsetPoint)];        // d
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(twiceThick, thick), offsetPoint)];      // e
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(size, thick), offsetPoint)];            // f
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(size, twiceThick), offsetPoint)];       // g
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(twiceThick, twiceThick), offsetPoint)]; // h
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(twiceThick, size), offsetPoint)];       // i
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(thick, size), offsetPoint)];            // j
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(thick, twiceThick), offsetPoint)];      // k
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(0.f, twiceThick), offsetPoint)];        // l
    [path closePath];
    return path;
}

/** -减号 */
+ (UIBezierPath *)fh_customBezierPathOfMinusSymbolWithRect:(CGRect)rect scale:(CGFloat)scale{
    CGFloat height = CGRectGetHeight(rect) * scale;
    CGFloat width  = CGRectGetWidth(rect)  * scale;
    CGFloat size   = height < width ? height : width;
    CGFloat thick  = size / 3.f;
    
    return [self bezierPathWithRect:
            CGRectOffset(CGRectMake(0.f, thick, size, thick),
                         CGRectGetMinX(rect) + (CGRectGetWidth(rect)  - width)  / 2.f,
                         CGRectGetMinY(rect) + (CGRectGetHeight(rect) - height) / 2.f)];
}

// check
//
//       /---------> degree = 90˚  |
//       |                         |      /----> topPointOffset = thick / √2
//   /---(----/----> thick         |    |<->|
//   |   |    |                    |    |  /b
//   |   |   d\e                   |    | /  \
//   |   |  / /                    |    a/    \
//  a/b  | / /                     |     \     \
//   \ \  / /                      |
//    \ \c /
//     \ -/--------> bottomHeight = thick * √2
//      \/
//      f     |
//      |<--->|
//         \-------> bottomMarginRight = height - topPointOffset
//
+ (UIBezierPath *)fh_customBezierPathOfCheckSymbolWithRect:(CGRect)rect scale:(CGFloat)scale thick:(CGFloat)thick{
    CGFloat height, width;
    // height : width = 32 : 25
    if (CGRectGetHeight(rect) > CGRectGetWidth(rect)) {
        height = CGRectGetHeight(rect) * scale;
        width  = height * 32.f / 25.f;
    }
    else {
        width  = CGRectGetWidth(rect) * scale;
        height = width * 25.f / 32.f;
    }
    
    CGFloat topPointOffset    = thick / sqrt(2.f);
    CGFloat bottomHeight      = thick * sqrt(2.f);
    CGFloat bottomMarginRight = height - topPointOffset;
    CGFloat bottomMarginLeft  = width - bottomMarginRight;
    
    CGPoint offsetPoint =
    CGPointMake(CGRectGetMinX(rect) + (CGRectGetWidth(rect)  - width)  / 2.f,
                CGRectGetMinY(rect) + (CGRectGetHeight(rect) - height) / 2.f);
    
    UIBezierPath * path = [self bezierPath];
    [path moveToPoint:
     FHCGPointWithOffset(CGPointMake(0.f, height - bottomMarginLeft), offsetPoint)];                             // a
    [path addLineToPoint:
     FHCGPointWithOffset(CGPointMake(topPointOffset, height - bottomMarginLeft - topPointOffset), offsetPoint)]; // b
    [path addLineToPoint:
     FHCGPointWithOffset(CGPointMake(bottomMarginLeft, height - bottomHeight), offsetPoint)];                    // c
    [path addLineToPoint:
     FHCGPointWithOffset(CGPointMake(width - topPointOffset, 0.f), offsetPoint)];                                // d
    [path addLineToPoint:
     FHCGPointWithOffset(CGPointMake(width, topPointOffset), offsetPoint)];                                      // e
    [path addLineToPoint:
     FHCGPointWithOffset(CGPointMake(bottomMarginLeft, height), offsetPoint)];                                   // f
    [path closePath];
    return path;
}

// cross
//
//                /---> thick |
//     b       d /            |      b
//   a/ \     / \e            |     /|\
//    \  \   /  /             |    / |_/----> offset = thick / √2
//     \  \c/  /              |  a/__|  \
//      \     /               |   \      \
//       \l f/                |___________________________________
//       /   \                |
//      /  i  \               |      c  /---> thick
//     /  / \  \              |      |\/
//   k/  /   \  \g            |   l  |_\f
//    \ /     \ /             |       \----> offset
//     j       h              |      i
//
+ (UIBezierPath *)fh_customBezierPathOfCrossSymbolWithRect:(CGRect)rect scale:(CGFloat)scale thick:(CGFloat)thick{
    CGFloat height     = CGRectGetHeight(rect) * scale;
    CGFloat width      = CGRectGetWidth(rect)  * scale;
    CGFloat halfHeight = height / 2.f;
    CGFloat halfWidth  = width  / 2.f;
    CGFloat size       = height < width ? height : width;
    CGFloat offset     = thick / sqrt(2.f);
    
    CGPoint offsetPoint =
    CGPointMake(CGRectGetMinX(rect) + (CGRectGetWidth(rect)  - size) / 2.f,
                CGRectGetMinY(rect) + (CGRectGetHeight(rect) - size) / 2.f);
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:FHCGPointWithOffset(CGPointMake(0.f, offset), offsetPoint)];                       // a
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(offset, 0.f), offsetPoint)];                    // b
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(halfWidth, halfHeight - offset), offsetPoint)]; // c
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(width - offset, 0.f), offsetPoint)];            // d
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(width, offset), offsetPoint)];                  // e
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(halfWidth + offset, halfHeight), offsetPoint)]; // f
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(width, height - offset), offsetPoint)];         // g
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(width - offset, height), offsetPoint)];         // h
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(halfWidth, halfHeight + offset), offsetPoint)]; // i
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(offset, height), offsetPoint)];                 // j
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(0.f, height - offset), offsetPoint)];           // k
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(halfWidth - offset, halfHeight), offsetPoint)]; // l
    [path closePath];
    return path;
}

// arrow
//
//            /----> thick
// LEFT:    b-c                  RIGHT:   b-c
//         / /                             \ \
//       a/ /d                             a\ \d
//        \ \                               / /
//         \ \                             / /
//          f-e                           f-e
//
//
// UP:       a                   DOWN:  f      b
//          /\                          |\    /|
//         / d\                         | \  / |
//       f/ /\ \b                       e\ \/ /c
//       | /  \ |                         \ a/
//       |/    \|                          \/
//       e      c                           d
//
+ (UIBezierPath *)fh_customBezierPathOfArrowSymbolWithRect:(CGRect)rect scale:(CGFloat)scale thick:(CGFloat)thick direction:(FHUIBezierPathArrowDirection)direction{
    CGFloat height     = CGRectGetHeight(rect) * scale;
    CGFloat width      = CGRectGetWidth(rect)  * scale;
    CGFloat halfHeight = height / 2.f;
    CGFloat halfWidth  = width  / 2.f;
    
    CGPoint offsetPoint =
    CGPointMake(CGRectGetMinX(rect) + (CGRectGetWidth(rect)  - width)  / 2.f,
                CGRectGetMinY(rect) + (CGRectGetHeight(rect) - height) / 2.f);
    
    UIBezierPath * path = [self bezierPath];
    if (direction == kUIBezierPathArrowDirectionLeft || direction == kUIBezierPathArrowDirectionRight) {
        if (direction == UISwipeGestureRecognizerDirectionLeft) {
            [path moveToPoint:FHCGPointWithOffset(CGPointMake(0.f, halfHeight), offsetPoint)];          // a
            [path addLineToPoint:FHCGPointWithOffset(CGPointMake(width - thick, 0.f), offsetPoint)];    // b
            [path addLineToPoint:FHCGPointWithOffset(CGPointMake(width, 0.f), offsetPoint)];            // c
            [path addLineToPoint:FHCGPointWithOffset(CGPointMake(thick, halfHeight), offsetPoint)];     // d
            [path addLineToPoint:FHCGPointWithOffset(CGPointMake(width, height), offsetPoint)];         // e
            [path addLineToPoint:FHCGPointWithOffset(CGPointMake(width - thick, height), offsetPoint)]; // f
        }else {
            [path moveToPoint:FHCGPointWithOffset(CGPointMake(width - thick, halfHeight), offsetPoint)]; // a
            [path addLineToPoint:FHCGPointWithOffset(CGPointMake(0.f, 0.f), offsetPoint)];               // b
            [path addLineToPoint:FHCGPointWithOffset(CGPointMake(thick, 0.f), offsetPoint)];             // c
            [path addLineToPoint:FHCGPointWithOffset(CGPointMake(width, halfHeight), offsetPoint)];      // d
            [path addLineToPoint:FHCGPointWithOffset(CGPointMake(thick, height), offsetPoint)];          // e
            [path addLineToPoint:FHCGPointWithOffset(CGPointMake(0.f, height), offsetPoint)];            // f
        }
    }else {
        if (direction == kUIBezierPathArrowDirectionUp) {
            [path moveToPoint:FHCGPointWithOffset(CGPointMake(halfWidth, 0.f), offsetPoint)];           // a
            [path addLineToPoint:FHCGPointWithOffset(CGPointMake(width, height - thick), offsetPoint)]; // b
            [path addLineToPoint:FHCGPointWithOffset(CGPointMake(width, height), offsetPoint)];         // c
            [path addLineToPoint:FHCGPointWithOffset(CGPointMake(halfWidth, thick), offsetPoint)];      // d
            [path addLineToPoint:FHCGPointWithOffset(CGPointMake(0.f, height), offsetPoint)];           // e
            [path addLineToPoint:FHCGPointWithOffset(CGPointMake(0.f, height - thick), offsetPoint)];   // f
        }else {
            [path moveToPoint:FHCGPointWithOffset(CGPointMake(halfWidth, height - thick), offsetPoint)]; // a
            [path addLineToPoint:FHCGPointWithOffset(CGPointMake(width, 0.f), offsetPoint)];             // b
            [path addLineToPoint:FHCGPointWithOffset(CGPointMake(width, thick), offsetPoint)];           // c
            [path addLineToPoint:FHCGPointWithOffset(CGPointMake(halfWidth, height), offsetPoint)];      // d
            [path addLineToPoint:FHCGPointWithOffset(CGPointMake(0.f, thick), offsetPoint)];             // e
            [path addLineToPoint:FHCGPointWithOffset(CGPointMake(0.f, 0.f), offsetPoint)];               // f
        }
    }
    [path closePath];
    return path;
}

// pencil
//
//       c  /---> thick
//       /\/
//      /  \d
//     /   /
//   b/   /
//   |   /
//  a|__/e
//     \--------> edgeWidth = thick / √2
//
+ (UIBezierPath *)fh_customBezierPathOfPencilSymbolWithRect:(CGRect)rect scale:(CGFloat)scale thick:(CGFloat)thick{
    CGFloat height    = CGRectGetHeight(rect) * scale;
    CGFloat width     = CGRectGetWidth(rect)  * scale;
    CGFloat edgeWidth = thick / sqrt(2.f);
    
    CGPoint offsetPoint =
    CGPointMake(CGRectGetMinX(rect) + (CGRectGetWidth(rect)  - width)  / 2.f,
                CGRectGetMinY(rect) + (CGRectGetHeight(rect) - height) / 2.f);
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:FHCGPointWithOffset(CGPointMake(0.f, height), offsetPoint)];                // a
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(0.f, height - edgeWidth), offsetPoint)]; // b
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(width - edgeWidth, 0.f), offsetPoint)];  // c
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(width, edgeWidth), offsetPoint)];        // d
    [path addLineToPoint:FHCGPointWithOffset(CGPointMake(edgeWidth, height), offsetPoint)];       // e
    [path closePath];
    return path;
}


@end
