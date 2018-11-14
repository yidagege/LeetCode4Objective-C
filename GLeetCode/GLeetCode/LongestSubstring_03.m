//
//  LongestSubstring_03.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/14.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "LongestSubstring_03.h"

@implementation LongestSubstring_03

/**
 给定一个字符串，找出不含有重复字符的最长子串的长度。
 
 示例 1:
 
 输入: "abcabcbb"
 输出: 3
 解释: 无重复字符的最长子串是 "abc"，其长度为 3。
 示例 2:
 
 输入: "bbbbb"
 输出: 1
 解释: 无重复字符的最长子串是 "b"，其长度为 1。
 示例 3:
 
 输入: "pwwkew"
 输出: 3
 解释: 无重复字符的最长子串是 "wke"，其长度为 3。
 请注意，答案必须是一个子串，"pwke" 是一个子序列 而不是子串。
 */
+ (NSUInteger)lengthOfLongestSubstring:(NSString *)string
{
    NSUInteger length = string.length;
    if (length<=1) return length;
    int retval = 0, left = 0, right = 0;
    /// Dictionary作为滑动窗口,记录出现的字符串次数
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    while (right < length) {
        NSString * temp = [string substringWithRange:NSMakeRange(right, 1)];
        if (dict[temp]) {
            NSInteger tempValue = [dict[temp] integerValue];
            dict[temp] = @(tempValue + 1);
            while ([dict[temp] integerValue] > 1) {
                NSString *preTemp = [string substringWithRange:NSMakeRange(left, 1)];
                NSInteger preValue = [dict[preTemp] integerValue];
                dict[preTemp] = @(preValue - 1);
                left ++;
            }
        } else {
            dict[temp] = @(1);
        }
        retval = MAX(retval, right-left+1);
        right ++;
    }
    return retval;
}


- (void)kmpNexts:(NSString*)pattern
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
}
@end
