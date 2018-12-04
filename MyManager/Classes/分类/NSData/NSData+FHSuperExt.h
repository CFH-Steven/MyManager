//
//  NSData+FHSuperExt.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (FHSuperExt)

/** 将APNS NSData类型token 格式化成字符串 */
- (NSString *)APNSTokenString;

// 创建密匙
- (NSData *)fh_ctreatAKeyData;

@end
