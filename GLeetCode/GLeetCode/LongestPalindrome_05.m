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
+ (NSString *)longestPalindrome2:(NSString *)string
{
    int length = (int)string.length;
    if (length==0) {
        return nil;
    }
    if (length==1) {
        return string;
    }
    NSString *retval = nil;
    int Max = 1;
    int dp[length][length];
    for (int i = 0; i<length; i++) {
        dp[i][i] = 1;
        retval = [string substringWithRange:NSMakeRange(i, 1)];
    }
    for (int i = 0; i<length-1; i++) {
        NSString * temp = [string substringWithRange:NSMakeRange(i, 1)];
        NSString * temp1 = [string substringWithRange:NSMakeRange(i+1, 1)];
        if ([temp isEqualToString:temp1]) {
            dp[i][i+1] = 1;
            Max = 2;
            retval = [string substringWithRange:NSMakeRange(i, i+1)];
        }
    }
        //然后进行动态规划判断普通情况dp[i][j]从i到j的值
        //必须从长度开始判断，长度从3开始处理
        for (int l = 3; l<=length; l++) {
            for (int i=0; l+i-1<length; i++) {
                int j = i + l - 1;
                NSString *temp = [string substringWithRange:NSMakeRange(i, 1)];
                NSString *temp1 = [string substringWithRange:NSMakeRange(j, 1)];
                if ([temp1 isEqualToString:temp]) {
                    dp[i][j] = dp[i+1][j-1];
                    if (dp[i][j] == 1 && l>Max) {
                        Max = l;
                        retval = [string substringWithRange:NSMakeRange(i, j+1)];
                    }
                } else {
                    dp[i][j] = 0;
                }
            }
        }
    return retval;
}

static int left, right,length;
+ (NSString *)longestPalindrome: (NSString *)s {
    left = right = length = 0;
    if (s.length == 0) return s;
    for (int i = 0; i < s.length; i++) {
        //Need to check odd length and even length palindrome string
        [LongestPalindrome_05 palindromeHelper:s left:i right:i];
        [LongestPalindrome_05 palindromeHelper:s left:i right:i + 1];
    }
    return [s substringWithRange:NSMakeRange(left, right - left + 1)];
}

+ (void)palindromeHelper: (NSString *)s left: (int)l right: (int)r {
    while (l >= 0 && r < s.length && [s characterAtIndex:l] == [s characterAtIndex:r]) {
        l--;
        r++;
    }
    if (r - l - 1 > length) {
        left = l;
        right = r;
        length = r - l - 1;
    }
}


- (NSString *)longestPalindrome: (NSString *)s {
    if (s.length == 0) return s;
    for (int i = 0; i < s.length; i++) {
        //Need to check odd length and even length palindrome string
        [self palindromeHelper:s left:i right:i];
        [self palindromeHelper:s left:i right:i + 1];
    }
    return [s substringWithRange:NSMakeRange(self.left, self.right - self.left + 1)];
}

- (void)palindromeHelper: (NSString *)s left: (NSInteger)l right: (NSInteger)r {
    while (l >= 0 && r < s.length && [s characterAtIndex:l] == [s characterAtIndex:r]) {
        l--;
        r++;
    }
    if (r - l - 1 > self.len) {
        self.left = l;
        self.right = r;
        self.len = r - l - 1;
    }
}
@end
