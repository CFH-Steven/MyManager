//
//  NSData+YJGzip.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSData+YJGzip.h"
#import <zlib.h>
#import <dlfcn.h>

@implementation NSData (YJGzip)

static void *libzOpenForYJGzip(){
    static void *libz;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        libz = dlopen("/usr/lib/libz.dylib", RTLD_LAZY);
    });
    return libz;
}

/** GZIP压缩  level 压缩级别*/
- (NSData *)gzippedDataWithCompressionLevel:(float)level{
    if (self.length == 0 || [self isGzippedData]){
        return self;
    }
    
    void *libz = libzOpenForYJGzip();
    int (*deflateInit2_)(z_streamp, int, int, int, int, int, const char *, int) =
    (int (*)(z_streamp, int, int, int, int, int, const char *, int))dlsym(libz, "deflateInit2_");
    int (*deflate)(z_streamp, int) = (int (*)(z_streamp, int))dlsym(libz, "deflate");
    int (*deflateEnd)(z_streamp) = (int (*)(z_streamp))dlsym(libz, "deflateEnd");
    
    z_stream stream;
    stream.zalloc = Z_NULL;
    stream.zfree = Z_NULL;
    stream.opaque = Z_NULL;
    stream.avail_in = (uint)self.length;
    stream.next_in = (Bytef *)(void *)self.bytes;
    stream.total_out = 0;
    stream.avail_out = 0;
    
    static const NSUInteger ChunkSize = 16384;
    
    NSMutableData *output = nil;
    int compression = (level < 0.0f)? Z_DEFAULT_COMPRESSION: (int)(roundf(level * 9));
    if (deflateInit2(&stream, compression, Z_DEFLATED, 31, 8, Z_DEFAULT_STRATEGY) == Z_OK){
        output = [NSMutableData dataWithLength:ChunkSize];
        while (stream.avail_out == 0){
            if (stream.total_out >= output.length){
                output.length += ChunkSize;
            }
            stream.next_out = (uint8_t *)output.mutableBytes + stream.total_out;
            stream.avail_out = (uInt)(output.length - stream.total_out);
            deflate(&stream, Z_FINISH);
        }
        deflateEnd(&stream);
        output.length = stream.total_out;
    }
    return output;
}

/** 默认压缩级别为-1 */
- (NSData *)gzippedDataLevelDefault{
    return [self gzippedDataWithCompressionLevel:-1.0f];
}

/** 解压数据 */
- (NSData *)gunzippedData{
    if (self.length == 0 || ![self isGzippedData]){
        return self;
    }
    
    void *libz = libzOpenForYJGzip();
    int (*inflateInit2_)(z_streamp, int, const char *, int) =
    (int (*)(z_streamp, int, const char *, int))dlsym(libz, "inflateInit2_");
    int (*inflate)(z_streamp, int) = (int (*)(z_streamp, int))dlsym(libz, "inflate");
    int (*inflateEnd)(z_streamp) = (int (*)(z_streamp))dlsym(libz, "inflateEnd");
    
    z_stream stream;
    stream.zalloc = Z_NULL;
    stream.zfree = Z_NULL;
    stream.avail_in = (uint)self.length;
    stream.next_in = (Bytef *)self.bytes;
    stream.total_out = 0;
    stream.avail_out = 0;
    
    NSMutableData *output = nil;
    if (inflateInit2(&stream, 47) == Z_OK){
        int status = Z_OK;
        output = [NSMutableData dataWithCapacity:self.length * 2];
        while (status == Z_OK){
            if (stream.total_out >= output.length){
                output.length += self.length / 2;
            }
            stream.next_out = (uint8_t *)output.mutableBytes + stream.total_out;
            stream.avail_out = (uInt)(output.length - stream.total_out);
            status = inflate (&stream, Z_SYNC_FLUSH);
        }
        if (inflateEnd(&stream) == Z_OK){
            if (status == Z_STREAM_END){
                output.length = stream.total_out;
            }
        }
    }
    return output;
}

/** 是否是压缩的数据 */
- (BOOL)isGzippedData{
    const UInt8 *bytes = (const UInt8 *)self.bytes;
    return (self.length >= 2 && bytes[0] == 0x1f && bytes[1] == 0x8b);
}

@end
