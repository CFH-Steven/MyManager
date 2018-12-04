//
//  NSFileManager+FHSuperExt.h
//  FHCategoriesGather
//
//  Created by FHHou on 2017/3/2.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (FHSuperExt)

/** DocumentsURL */
+ (NSURL *)fh_documentsURL;

/** LibraryURL */
+ (NSURL *)fh_libraryURL;

/** CachesURL */
+ (NSURL *)fh_cachesURL;

/** 设置path跳过备份 */
+ (BOOL)fh_addSkipBackupAttributeToFile:(NSString *)path;

/** 可用磁盘空间 */
+ (double)fh_availableDiskSpace;

/** 获取应用沙盒根路径 */
+ (NSString *)fh_homePath;

/** 获取Tmp目录路径 */
+ (NSString *)fh_tmpPath;

/**
 file is Exists

 @param filePath filePath
 @return file exists or not
 */
- (BOOL)fh_isFileExists:(NSString *)filePath;

/**
 判断文件是否超时

 @param filePath filePath
 @param timeout timeout
 @return timeout or not
 */
- (BOOL)fh_isFile:(NSString *)filePath timeout:(NSTimeInterval)timeout;

@end
