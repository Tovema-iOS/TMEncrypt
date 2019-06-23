//
//  FLDES.h
//  FLEncrypt
//
//  Created by LinXiaoBin on 2018/8/20.
//

#import <Foundation/Foundation.h>

@interface TMDES : NSObject

+ (NSData *)tm_DESEncrypt:(NSData *)data key:(NSString *)key;

+ (NSData *)tm_DESDecrypt:(NSData *)data key:(NSString *)key;


/**
 *  @brief  文本数据进行DES加密，此函数不可用于过长文本
 *
 *  @param data 需要加密的数据
 *  @param key  密钥
 *
 *  @return 加密后的数据
 */
+ (NSData *)DESEncrypt:(NSData *)data key:(NSString *)key;

/**
 *  @brief  文本数据进行DES解密，此函数不可用于过长文本
 *
 *  @param data 需要解密的数据
 *  @param key  密钥
 *
 *  @return 解密后的数据
 */
+ (NSData *)DESDecrypt:(NSData *)data key:(NSString *)key;


/**
 *  @brief  文本数据进行3DES加密，此函数不可用于过长文本
 *
 *  @param data 需要加密的数据
 *  @param key  密钥
 *
 *  @return 加密后的数据
 */
+ (NSData *)threeDESEncrypt:(NSData *)data key:(NSString *)key;

/**
 *  @brief  文本数据进行3DES解密，此函数不可用于过长文本
 *
 *  @param data 需要解密的数据
 *  @param key  密钥
 *
 *  @return 解密后的数据
 */
+ (NSData *)threeDESDecrypt:(NSData *)data key:(NSString *)key;

@end
