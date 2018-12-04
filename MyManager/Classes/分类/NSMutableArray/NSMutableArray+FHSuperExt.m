//
//  NSMutableArray+FHSuperExt.m
//  FHCategoriesGather
//
//  Created by FHHou on 2017/5/22.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSMutableArray+FHSuperExt.h"

@implementation NSMutableArray (FHSuperExt)

/** 安全添加对象到数组，防止非对象的崩溃 */
- (void)fh_addSafeObject:(id)obj{
    if (obj != nil) {
        [self addObject:obj];
    }
}

/** 添加BOOL值 */
-(void)fh_addBOOL:(BOOL)boolValue{
    [self addObject:@(boolValue)];
}

/** 添加Int值 */
-(void)fh_addInt:(int)value{
    [self addObject:@(value)];
}

/** 添加Integer值 */
-(void)fh_addInteger:(NSInteger)value{
    [self addObject:@(value)];
}

/** 添加UnsignedInteger值 */
-(void)fh_addUnsignedInteger:(NSUInteger)value{
    [self addObject:@(value)];
}

/** 添加CGFloat值 */
-(void)fh_addCGFloat:(CGFloat)value{
    [self addObject:@(value)];
}

/** 添加Char值 */
-(void)fh_addChar:(char)value{
    [self addObject:@(value)];
}

/** 添加Float值 */
-(void)fh_addFloat:(float)value{
    [self addObject:@(value)];
}

/** 添加CGPoint值 */
-(void)fh_addPoint:(CGPoint)value{
    [self addObject:NSStringFromCGPoint(value)];
}

/** 添加CGSize值 */
-(void)fh_addSize:(CGSize)value{
    [self addObject:NSStringFromCGSize(value)];
}

/** 添加CGRect值 */
-(void)fh_addRect:(CGRect)value{
    [self addObject:NSStringFromCGRect(value)];
}

- (void)fh_removeFirstObject {
    if (self.count > 0) {
        [self removeObjectAtIndex:0];
    }
}

- (void)fh_moveObjectAtIndex:(NSUInteger)index
                     toIndex:(NSUInteger)toIndex{
    
    if (self.count > index && self.count > toIndex) {
        id object = [self objectAtIndex:index];
        if (index > toIndex) {
            [self removeObjectAtIndex:index];
            [self insertObject:object atIndex:toIndex];
        } else if (index < toIndex) {
            [self removeObjectAtIndex:index];
            [self insertObject:object atIndex:toIndex - 1];
        }
    }
}




@end
