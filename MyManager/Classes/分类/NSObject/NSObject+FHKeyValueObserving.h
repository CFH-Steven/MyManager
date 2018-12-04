//
//  NSObject+FHKeyValueObserving.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/5/19.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (FHKeyValueObserving)

@property (nonatomic, strong) NSMutableArray *keyPathObservers; /**< 保存监察者们 @{@"keyPath":observer}*/

/** 安全添加kvo */
- (void)fh_addSafeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath;

/** 安全移除kvo */
- (void)fh_removeSafeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath;

/** 移除本类所有的监听者们 */
- (void)fh_removeSafeAllObservers;

@end
