//
//  NSFileManager+FHSuperExt.m
//  FHCategoriesGather
//
//  Created by FHHou on 2017/3/2.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSFileManager+FHSuperExt.h"

@implementation NSFileManager (FHSuperExt)

/** DocumentsURL */
+ (NSURL *)fh_documentsURL{
    return [self fh_URLForDirectory:NSDocumentDirectory];
}

/** LibraryURL */
+ (NSURL *)fh_libraryURL{
    return [self fh_URLForDirectory:NSLibraryDirectory];
}

/** CachesURL */
+ (NSURL *)fh_cachesURL{
    return [self fh_URLForDirectory:NSCachesDirectory];
}

/** 设置path跳过备份 */
+ (BOOL)fh_addSkipBackupAttributeToFile:(NSString *)path{
    return [[NSURL.alloc initFileURLWithPath:path] setResourceValue:@(YES) forKey:NSURLIsExcludedFromBackupKey error:nil];
}
/** 可用磁盘空间 */
+ (double)fh_availableDiskSpace{
    NSDictionary *attributes = [self.defaultManager attributesOfFileSystemForPath:[self fh_documentsURL].path error:nil];
    return [attributes[NSFileSystemFreeSize] unsignedLongLongValue] / (double)0x100000;
}


+ (NSString *)fh_homePath {
    return NSHomeDirectory();
}

+ (NSString *)fh_tmpPath {
    return NSTemporaryDirectory();
}

#pragma mark - Private
/** 文件管理的 URL */
+ (NSURL *)fh_URLForDirectory:(NSSearchPathDirectory)directory{
    return [self.defaultManager URLsForDirectory:directory inDomains:NSUserDomainMask].lastObject;
}

- (BOOL)fh_isFileExists:(NSString *)filePath {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL result = [fileManager fileExistsAtPath:filePath];
    
    return result;
}

- (BOOL)fh_isFile:(NSString *)filePath timeout:(NSTimeInterval)timeout {
    
    if ([[NSFileManager defaultManager] fh_isFileExists:filePath]) {
        NSError *error = nil;
        NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:&error];
        if (error) {
            return YES;
        }
        if ([attributes isKindOfClass:[NSDictionary class]] && attributes) {
            //  NSLog(@"%@", attributes);
            NSString *createDate = [attributes objectForKey:@"NSFileModificationDate"];
            createDate = [NSString stringWithFormat:@"%@", createDate];
            if (createDate.length >= 19) {
                createDate = [createDate substringToIndex:19];
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
                
                NSDate *sinceDate = [formatter dateFromString:createDate];
                NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:sinceDate];
                return interval <= 0;
            }
        }
    }
    return YES;
}



@end
