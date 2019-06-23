//
//  FLDES.m
//  FLEncrypt
//
//  Created by LinXiaoBin on 2018/8/20.
//

#import "TMDES.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation TMDES

+ (NSData *)tm_DESEncrypt:(NSData *)data key:(NSString *)key {
    NSData *desData = [self DESEncrypt:data key:key];
    unsigned char *bytes = (unsigned char *)desData.bytes;
    NSMutableString *desString = [NSMutableString string];
    for (NSUInteger i=0; i<desData.length; i++) {
        [desString appendFormat:@"%02X", bytes[i]];
    }
    
    NSData *resultData = [desString dataUsingEncoding:NSUTF8StringEncoding];
    return resultData;
}

//十六进制字符串转换为字节流
void HexStrToByte(const char* source, unsigned char* dest, NSUInteger sourceLen)
{
    short i;
    unsigned char highByte, lowByte;
    
    for (i = 0; i < sourceLen; i += 2)
    {
        highByte = toupper(source[i]);
        lowByte  = toupper(source[i + 1]);
        
        if (highByte > 0x39)
        highByte -= 0x37;
        else
        highByte -= 0x30;
        
        if (lowByte > 0x39)
        lowByte -= 0x37;
        else
        lowByte -= 0x30;
        
        dest[i >> 1] = (highByte << 4) | lowByte;
    }
    return ;
}

+ (NSData *)tm_DESDecrypt:(NSData *)data key:(NSString *)key {
    NSString *desString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    if (desString) {
        unsigned int length = (unsigned int)desString.length >> 1;
        const char *chars = [desString UTF8String];
        unsigned char *buffer = malloc(length);
        HexStrToByte(chars, buffer, desString.length);
        NSData *desData = [NSData dataWithBytesNoCopy:buffer length:length];
        NSData *resultData = [self DESDecrypt:desData key:key];
        return resultData;
    }
    
    return nil;
}


+ (NSData *)DESEncrypt:(NSData *)data key:(NSString *)key
{
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCBlockSizeDES;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String], kCCBlockSizeDES,
                                          [[key dataUsingEncoding:NSUTF8StringEncoding] bytes],
                                          [data bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    
    free(buffer);
    return nil;
}

+ (NSData *)DESDecrypt:(NSData *)data key:(NSString *)key
{
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCBlockSizeDES;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String], kCCBlockSizeDES,
                                          [[key dataUsingEncoding:NSUTF8StringEncoding] bytes],
                                          [data bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesDecrypted);
    
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    
    free(buffer);
    return nil;
}

+ (NSData *)threeDESEncrypt:(NSData *)data key:(NSString *)key
{
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCBlockSize3DES;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithm3DES,
                                          kCCOptionECBMode | kCCOptionPKCS7Padding,
                                          [key UTF8String],
                                          kCCKeySize3DES,
                                          NULL,
                                          [data bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    
    free(buffer);
    return nil;
}

+ (NSData *)threeDESDecrypt:(NSData *)data key:(NSString *)key
{
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCBlockSize3DES;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithm3DES,
                                          kCCOptionECBMode | kCCOptionPKCS7Padding,
                                          [key UTF8String],
                                          kCCKeySize3DES,
                                          NULL,
                                          [data bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    
    free(buffer);
    return nil;
}

@end
