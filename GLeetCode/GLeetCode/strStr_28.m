//
//  strStr_28.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/15.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "strStr_28.h"

@implementation strStr_28


/**
 经典kmp算法
 http://www.cnblogs.com/SYCstudio/p/7194315.html
 */
+ (int)str:(NSString*)haystack Str:(NSString*)needle
{
    // 计算nexts数组
    NSArray * nexts = [strStr_28 kmpNexts:needle];
    int retval = -1;
    unsigned long searchLength = [haystack length];
    unsigned long aLength = [needle length];
    int i = 0 ,j = 0;
    while (i<searchLength ) {
        
        if ([[haystack substringWithRange:NSMakeRange(i,1)] isEqualToString:[needle substringWithRange:NSMakeRange(j,1)]]) {
            ++i;
            ++j;
            if (j==aLength) {
                retval = i-aLength;
                break;
                j = [nexts[j-1] intValue] + 1;
            }
        }  else {
            if (j == 0) {
                i++;
            } else {
                j = [nexts[j-1] intValue]+1;
            }
        }
    }
    return retval;
}

+ (NSArray *)kmpNexts:(NSString*)pattern
{
    NSUInteger length = [pattern length];
    NSMutableArray * nexts = [NSMutableArray arrayWithCapacity:length];
    int t = 0;
    nexts[0] = @(-1);
    for (int i =1; i<length; i++) {
        NSNumber* next = nexts[i-1];
        t = [next intValue];
        if (length > t+1) {
            while ([pattern characterAtIndex:t+1] != [pattern characterAtIndex:i] && t >0) {
                NSNumber* next2 = [nexts objectAtIndex:t];
                t = [next2 intValue];
            }
            if ([pattern characterAtIndex:t+1] == [pattern characterAtIndex:i]) {
                [nexts insertObject:@(t+1) atIndex:i];
            } else {
                [nexts insertObject:@(-1) atIndex:i];
            }
        }
    }
    return nexts.copy;
}

+ (NSArray * )nexts:(NSString * )pattern
{
    NSUInteger length = pattern.length;
    NSMutableArray * nexts = [NSMutableArray new];
    nexts[0] = @(-1);
    int t = 0;
    for (int i =1; i<length; i++) {
        t = [nexts[i-1] intValue];
        if (length > t+1) {
            while ([pattern characterAtIndex:t+1] != [pattern characterAtIndex:i] && t>0) {
                t = [nexts[t] intValue];
            }
            if ([pattern characterAtIndex:t+1] == [pattern characterAtIndex:i]) {
                nexts[i] = @(t+1);
            } else {
                nexts[i] = @(-1);
            }
        }
    }
    return nexts.copy;
}
@end
