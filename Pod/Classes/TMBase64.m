//
//  FLBase64.m
//  FLEncrypt
//
//  Created by LinXiaoBin on 2018/8/20.
//

#import "TMBase64.h"
#import "GTMBase64.h"

@implementation TMBase64

+ (NSString *)encodeString:(NSString *)input
{
    NSData * data = [input dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    data = [GTMBase64 encodeData:data];
    NSString * base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return base64String;
}

+ (NSString *)decode2String:(NSString *)input
{
    NSData * data = [input dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    data = [GTMBase64 decodeData:data];
    NSString * base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return base64String;
}

+ (NSString *)encodeBytes:(void *)pData len:(NSUInteger)length
{
    NSData * data = [GTMBase64 encodeBytes:pData length:length];
    NSString * base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return base64String;
}

+ (const void *)decode2Bytes:(NSString *)input
{
    NSData * data = [GTMBase64 decodeBytes:[input UTF8String] length:[input length]];
    return data.bytes;
}

+ (NSString *)encodeData:(NSData *)data
{
    return [GTMBase64 stringByEncodingData:data];
}

+ (NSData *)decode2Data:(NSString *)string
{
    return [GTMBase64 decodeString:string];
}

@end
