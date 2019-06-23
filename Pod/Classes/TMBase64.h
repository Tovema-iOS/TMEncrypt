//
//  FLBase64.h
//  FLEncrypt
//
//  Created by LinXiaoBin on 2018/8/20.
//

#import <Foundation/Foundation.h>

@interface TMBase64 : NSObject

+ (NSString *)encodeString:(NSString *)input;
+ (NSString *)decode2String:(NSString *)input;

+ (NSString *)encodeBytes:(void *)date len:(NSUInteger)length;
+ (const void *)decode2Bytes:(NSString *)input;

+ (NSString *)encodeData:(NSData *)data;
+ (NSData *)decode2Data:(NSString *)string;

@end
