//
//  NSMutableArray+FHSuperExt.h
//  FHCategoriesGather
//
//  Created by FHHou on 2017/5/22.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSMutableArray (FHSuperExt)

/** 安全添加对象到数组，防止非对象的崩溃 */
- (void)fh_addSafeObject:(id)obj;

/** 添加BOOL值 */
-(void)fh_addBOOL:(BOOL)boolValue;

/** 添加Int值 */
-(void)fh_addInt:(int)value;

/** 添加Integer值 */
-(void)fh_addInteger:(NSInteger)value;

/** 添加UnsignedInteger值 */
-(void)fh_addUnsignedInteger:(NSUInteger)value;

/** 添加CGFloat值 */
-(void)fh_addCGFloat:(CGFloat)value;

/** 添加Char值 */
-(void)fh_addChar:(char)value;

/** 添加Float值 */
-(void)fh_addFloat:(float)value;

/** 添加CGPoint值 */
-(void)fh_addPoint:(CGPoint)value;

/** 添加CGSize值 */
-(void)fh_addSize:(CGSize)value;

/** 添加CGRect值 */
-(void)fh_addRect:(CGRect)value;

/** 移除第一个对象 */
- (void)fh_removeFirstObject ;

/**
 move item

 @param index form
 @param toIndex to
 */
- (void)fh_moveObjectAtIndex:(NSUInteger)index
                     toIndex:(NSUInteger)toIndex;

@end
