//
//  UIView+FHRecursion.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/4/27.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIView+FHRecursion.h"

@implementation UIView (FHRecursion)

/** 所有 SubView 都执行Block */
- (void)subViewsAllExecuteBlock:(FHSubviewBlock)block{
    block(self);
    for (UIView* view in [self subviews]){
        [view subViewsAllExecuteBlock:block];
    }
}

/** 所有 SuperView 都执行Block */
-(void)superViewsAllExecuteBlock:(FHSuperviewBlock)block{
    block(self);
    if (self.superview){
        [self.superview superViewsAllExecuteBlock:block];
    }
}

/** 所有 SubView Control 设为 Enable  */
- (void)subViewsAllControlsEnable:(BOOL)enable{
    
    [self subViewsAllExecuteBlock:^(UIView *view) {
        if ([view isKindOfClass:[UIControl class]]){
            [(UIControl *)view setEnabled:enable];
        }else if ([view isKindOfClass:[UITextView class]]){
            [(UITextView *)view setEditable:enable];
        }
    }];
}

/** 递归寻找子视图 */
- (UIView *)findSubViewRecursively:(BOOL(^)(UIView *subview, BOOL *stop))recurse{
    
    for(UIView* subview in self.subviews) {
        BOOL stop = NO;
        if( recurse( subview, &stop ) ) {
            return [subview findSubViewRecursively:recurse];
        } else if( stop ) {
            return subview;
        }
    }
    return nil;
}

@end
