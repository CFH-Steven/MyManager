//
//  NSDateFormatter+FHSuperExt.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSDateFormatter+FHSuperExt.h"

@implementation NSDateFormatter (FHSuperExt)

/** 根据 dateString 和 format 返回 NSDate */
+ (NSDate *)fh_dateWithString:(NSString *)dateString format:(NSString *)format{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    return [inputFormatter dateFromString:dateString];
}

/** 根据 date 和 format 返回字符串日期 */
+ (NSString *)fh_stringWithDate:(NSDate *)date format:(NSString *)format{
    return [self _fh_stringWithDate:date format:format];
}

/** 
 (%)用于表明不论尾随什么字母，随后字符都应该以单字母格式读取。也用于表明单字母格式应以用户定义格式读取。
 
 gg显示时代/纪元字符串（例如 A.D.）
 G:公元时代，例如AD公元
 yy:年的后2位
 yyyy:完整年
 MM:月，显示为1-12
 MMM:月，显示为英文月份简写,如Jan
 MMMM:月，显示为英文月份全称，如Janualy
 dd:日，2位数表示，如02
 d:日，1-2位显示，如2
 EEE:简写星期几，如Sun
 EEEE:全写星期几，如Sunday
 aa:上下午，AM/PM
 H:时，24小时制，0-23
 K：时，12小时制，0-11
 m:分，1-2位
 mm:分，2位
 s:秒，1-2位
 ss:秒，2位
 S:毫秒
 zzz表示时区
 */

+ (NSString *)fh_MMddyyyyFormat{
    return @"MMddyyyy";
}

/** yyyy-MM-dd 格式 */
+ (NSString *)fh_yyyyMMddFormat{
    return @"yyyy-MM-dd";
}

+ (NSString *)fh_HHmmssFormat{
    return @"HH:mm:ss";
}

+ (NSString *)fh_yyyyMMddHHmmssFormat{
    return @"yyyy-MM-dd HH:mm:ss";
}

+ (NSString *)fh_yyyyMMddHHmmssSSSFormat{
    return @"yyyy-MM-ddHH:mm:ss.SSS";
}

#pragma mark - Private
/** 根据指定format返回 String 时间 */
+ (NSString *)_fh_stringWithDate:(NSDate *)date format:(NSString *)format{
    NSDateFormatter *formatter = [NSDateFormatter new];
    //    formatter.locale = [NSLocale currentLocale]; // Necessary?
    formatter.dateFormat = format;
    return [formatter stringFromDate:date];
}

@end
