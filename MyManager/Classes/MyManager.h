//
//  MyManager.h
//  Pods
//
//  Created by iOS on 2018/12/3.
//

#import <Foundation/Foundation.h>
#import "FHFileManager.h"
#import "YJUIKit.h"
#import "YJCategories.h"
#import "YJFoundation.h"
#import "YJQuartzCore.h"

@interface MyManager : NSObject
/**
 字典转json格式字符串
 
 @param dic 需要转换的字段
 @return json字符串
 */
+ (NSString *)dictionaryToJson:(NSDictionary *)dic;

/**
 json字符串转换字典

 @param jsonString json
 @return 字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/**
 验证身份证是否正确

 @param identityString 身份证ID
 @return yes为身份证可用
 */
+ (BOOL)judgeIdentityStringValid:(NSString *)identityString;

/**
 把时间戳转换成指定格式的日期格式

 @param timeString 时间戳
 @param fotmat 时间格式
 @return 时间
 */
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString format:(NSString *)fotmat;

/**
 获取当前的tabbar
 
 @return tabbar
 */
+ (UITabBarController *)getCurrentTabBar;

/**
 获取当前屏幕显示的viewcontroller
 
 @return 返回当前的控制器
 */
+ (UIViewController *)getCurrentVC;

/**
 保存数据到属性列表中
 
 @param value 值
 @param key 键
 */
+ (void)saveToLocaleWithValue:(id)value key:(NSString *)key;

/**
 从本地中清除key对应的数据
 
 @param key key
 */
+ (void)removeLoacaleDataFromKey:(NSString *)key;

/**
 从本地中获取数据
 
 @param key 键
 @return 值
 */
+ (id)getDataFromLocaleWithKey:(NSString *)key;

/**
 获取时间戳
 
 @return 时间戳
 */
+ (NSString *)getintervalTime;
@end
