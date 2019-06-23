//
//  FLMD5.m
//  FLEncrypt
//
//  Created by LinXiaoBin on 2018/8/20.
//

#import "TMMD5.h"
#import <commoncrypto/CommonDigest.h>

@implementation TMMD5

+ (NSString *)md5String:(NSString*)input
{
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

+ (NSString *)md5File:(NSString *)filePath {
    if (filePath == nil) {
        return nil;
    }
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        return nil;
    }
    
    //生成文件的MD5   校验的是压缩包的MD5  判断下载是否正确
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    if( handle == nil ) {
        return nil;
    }
    
    CC_MD5_CTX md5;
    CC_MD5_Init(&md5);
    BOOL done = NO;
    while(!done)
    {
        NSData* fileData = [handle readDataOfLength: 1024];
        CC_MD5_Update(&md5, [fileData bytes], (CC_LONG)[fileData length]);
        if( [fileData length] == 0 ) done = YES;
    }
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &md5);
    NSString *fileMD5 = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                         digest[0], digest[1],
                         digest[2], digest[3],
                         digest[4], digest[5],
                         digest[6], digest[7],
                         digest[8], digest[9],
                         digest[10], digest[11],
                         digest[12], digest[13],
                         digest[14], digest[15]];
    
    [handle closeFile];
    
    return fileMD5;
}

+ (NSString *)md5Data:(NSData *)data {
    if (data == nil) {
        return nil;
    }
    
    CC_MD5_CTX md5;
    CC_MD5_Init(&md5);
    
    CC_MD5_Update(&md5, [data bytes], (CC_LONG)[data length]);
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &md5);
    NSString *fileMD5 = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                         digest[0], digest[1],
                         digest[2], digest[3],
                         digest[4], digest[5],
                         digest[6], digest[7],
                         digest[8], digest[9],
                         digest[10], digest[11],
                         digest[12], digest[13],
                         digest[14], digest[15]];
    
    return fileMD5;
}

@end
