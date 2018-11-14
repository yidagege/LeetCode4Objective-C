//
//  LongestPalindrome_05.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/14.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "LongestPalindrome_05.h"

@implementation LongestPalindrome_05
/**
 给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为1000。
 
 示例 1：
 
 输入: "babad"
 输出: "bab"
 注意: "aba"也是一个有效答案。
 示例 2：
 
 输入: "cbbd"
 输出: "bb"
 */

/**
 Notes:https://blog.csdn.net/hk2291976/article/details/51107886
 */
+ (NSString *)longestPalindrome:(NSString *)string
{
    NSArray * nexts = [LongestPalindrome_05 kmpNexts:string];
    return @"string";
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
@end
