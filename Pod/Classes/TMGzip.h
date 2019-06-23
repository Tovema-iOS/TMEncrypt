//
//  FLGzip.h
//  FLEncrypt
//
//  Created by LinXiaoBin on 2018/8/20.
//

#import <Foundation/Foundation.h>

@interface TMGzip : NSObject

+ (NSData *)gzip:(NSData *)data;
+ (NSData *)unzip:(NSData *)data;

@end
