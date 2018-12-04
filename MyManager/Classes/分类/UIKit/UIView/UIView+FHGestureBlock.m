//
//  UIView+FHGestureBlock.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/4/27.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIView+FHGestureBlock.h"
#import <objc/runtime.h>

static char const * const kHandleTapGestureKey       = "kHandleTapGestureKey";
static char const * const kHandleTapGestureBlockKey  = "kHandleTapGestureBlockKey";

static char const * const kHandleLongGestureKey      = "kHandleLongGestureKey";
static char const * const kHandleLongGestureBlockKey = "kHandleLongGestureBlockKey";

@implementation UIView (FHGestureBlock)

/** 添加 Tap 手势 */
- (void)addTapGestureWithBlock:(FHGestureActionBlock)block{
    
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, kHandleTapGestureKey);
    if (!gesture){
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_handleTapGestureAction:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, kHandleTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, kHandleTapGestureBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)_handleTapGestureAction:(UITapGestureRecognizer *)gesture{
    
    if (gesture.state == UIGestureRecognizerStateRecognized){
        FHGestureActionBlock block = objc_getAssociatedObject(self, kHandleTapGestureBlockKey);
        if (block){
            block(gesture);
        }
    }
}

/** 添加 LongPressGesture 收拾 */
- (void)addLongPressGestureWithBlock:(FHGestureActionBlock)block{
    
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, kHandleLongGestureKey);
    if (!gesture){
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(_handleLongPressGestureAction:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, kHandleLongGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, kHandleLongGestureBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)_handleLongPressGestureAction:(UITapGestureRecognizer *)gesture{
    if (gesture.state == UIGestureRecognizerStateRecognized){
        FHGestureActionBlock block = objc_getAssociatedObject(self, kHandleLongGestureBlockKey);
        if (block){
            block(gesture);
        }
    }
}

@end
