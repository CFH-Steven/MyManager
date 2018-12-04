//
//  NSDictionary+FHSuperExt.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (FHSuperExt)

/** 转换为 NSString */
- (NSString *)fh_convertToJSONString;

/** 转换为 NSData */
- (NSData *)fh_convertToJSONData;

/** 安全设置键值对 */
- (void)setSafeValue:(id)value forKey:(NSString *)key;

/** 将NSDictionary转换成 url 参数字符串 */
- (NSString *)fh_parameterDictToUrlString;

@end
