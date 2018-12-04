//
//  NSDictionary+FHXML.m
//  FHCategoriesGather
//
//  Created by FHHou on 2017/3/2.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSDictionary+FHXML.h"

@implementation NSDictionary (FHXML)

/** 不带XML声明 不带根节点 */
- (NSString *)fh_xmlString{
    return [self  fh_xmlStringWithRootElement:nil declaration:nil];
}

/** 默认 <?xml version=\"1.0\" encoding=\"utf-8\"?> 声明   自定义根节点 */
- (NSString*)fh_xmlStringDefaultDeclarationWithRootElement:(NSString *)rootElement{
    return [self  fh_xmlStringWithRootElement:rootElement declaration:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"];
    
}

/** 将NSDictionary转换成XML字符串, 自定义根节点  自定义xml声明 */
- (NSString*)fh_xmlStringWithRootElement:(NSString *)rootElement declaration:(NSString *)declaration{
    NSMutableString *xml = [[NSMutableString alloc] initWithString:@""];
    if (declaration) {
        [xml appendString:declaration]; // xml声明
    }
    if (rootElement) {
        [xml appendString:[NSString stringWithFormat:@"<%@>",rootElement]];
    }
    [self _fh_convertNode:self xmlString:xml tag:nil];
    if (rootElement) {
        [xml appendString:[NSString stringWithFormat:@"</%@>",rootElement]];
    }
    NSString *finalXML=[xml stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"];
    return finalXML;
}

#pragma mark - Private
/** 将在xml后拼接node的数据 tag=外层标记 */
- (void)_fh_convertNode:(id)node xmlString:(NSMutableString *)xml tag:(NSString *)tag{
    if ([node isKindOfClass:[NSDictionary class]] && !tag) {
        NSArray *keys = [node allKeys];
        for (NSString *key in keys) {
            [self _fh_convertNode:[node objectForKey:key] xmlString:xml tag:key];
        }
    }else if ([node isKindOfClass:[NSArray class]]) {
        for (id value in node) {
            [self _fh_convertNode:value xmlString:xml tag:tag];
        }
    }else {
        [xml appendString:[NSString stringWithFormat:@"<%@>", tag]];
        if ([node isKindOfClass:[NSString class]]) {
            [xml appendString:node];
        }else if ([node isKindOfClass:[NSDictionary class]]) {
            [self _fh_convertNode:node xmlString:xml tag:nil];
        }
        [xml appendString:[NSString stringWithFormat:@"</%@>", tag]];
    }
}

#pragma mark - Plist
/** 字典转 plistString*/
- (NSString *)fh_plistString{
    NSString *result = [[NSString alloc] initWithData:[self fh_plistData]  encoding:NSUTF8StringEncoding];
    return result;
}

/** 转换为plistData类型 */
- (NSData *)fh_plistData{
    //    return [NSPropertyListSerialization dataFromPropertyList:self format:NSPropertyListXMLFormat_v1_0   errorDescription:nil];
    NSError *error = nil;
    NSData *plistData = [NSPropertyListSerialization dataWithPropertyList:self format:NSPropertyListXMLFormat_v1_0
                                                                  options:0
                                                                    error:&error];
    if (error) {
        return nil;
    }
    return plistData;
}

@end
