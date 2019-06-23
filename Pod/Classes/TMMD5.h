//
//  FLMD5.h
//  FLEncrypt
//
//  Created by LinXiaoBin on 2018/8/20.
//

#import <Foundation/Foundation.h>

@interface TMMD5 : NSObject

/**
 md5加密

 32bit小写
 */
+ (NSString *)md5String:(NSString *)str;

+ (NSString *)md5File:(NSString *)filePath;
+ (NSString *)md5Data:(NSData *)data;

@end
