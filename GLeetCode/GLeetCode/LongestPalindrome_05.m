//
//  LongestPalindrome_05.m
//  GLeetCode
//
//  Created by 张毅 on 2018/10/1.
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
 
 https://blog.csdn.net/qq_32354501/article/details/80084325
 https://www.cnblogs.com/grandyang/p/4475985.html
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

+ (NSString *)longestPalindrome: (NSString *)s {//时间复杂度n*n
    if (s.length == 0) return s;
    NSInteger len = s.length;
    NSInteger maxlen = 1;
    NSInteger start = 0;
    if (len % 2 == 1) {
        for(int i = 0; i < len; i++)//求长度为奇数的回文串
        {
            int j = i - 1, k = i + 1;
            while(j >= 0 && k < len && [s characterAtIndex:j] == [s characterAtIndex:k])
            {
                if(k - j + 1 > maxlen)
                {
                    maxlen = k - j + 1;
                    start = j;
                }
                j--;
                k++;
            }
        }
    }else{
        for(int i = 0; i < len; i++)//求长度为偶数的回文串
        {
            int j = i, k = i + 1;
            while(j >= 0 && k < len && [s characterAtIndex:j] == [s characterAtIndex:k])
            {
                if(k - j + 1 > maxlen)
                {
                    maxlen = k - j + 1;
                    start = j;
                }
                j--;
                k++;
            }
        }
    }
    return [s substringWithRange:NSMakeRange(start, maxlen)];
}

//@"$#1#2#2#1#2#2#",Manacher's Algorithm 马拉车算法
+ (NSString *)longestPalindrome3:(NSString *)s{
    NSMutableString *str = [[NSMutableString alloc]initWithString:@"$#"];
    for (int i = 0; i < s.length; i++) {
        [str appendString:[NSString stringWithFormat:@"%@%@",[s substringWithRange:NSMakeRange(i, 1)],@"#"]];
    }

    NSMutableArray *p = [NSMutableArray new];
    for (NSInteger i = 0; i < str.length; i ++) {
        [p addObject:@(1)];
    }
    NSInteger mx = 0, kid = 0, resLen = 0, resCenter = 0;
    for (int i = 1; i < str.length; ++i) {
        NSInteger kk = (2 * kid - i >= 0 && 2 * kid - i < p.count) ? [p[2 * kid - i] integerValue] : 0;
        p[i] = mx > i ? @(MIN(kk, mx - i)) : @(1);
        
        while (i - [p[i] integerValue] >= 0 && i + [p[i] integerValue] < p.count && [[str substringWithRange:NSMakeRange(i + [p[i] integerValue], 1)] isEqualToString:[str substringWithRange:NSMakeRange(i - [p[i] integerValue], 1)]]) {
            p[i] = @([p[i] integerValue] + 1);
        }
        if (mx < i + [p[i] integerValue]) {
            mx = i + [p[i] integerValue];
            kid = i;
        }
        if (resLen < [p[i] integerValue]) {
            resLen = [p[i] integerValue];
            resCenter = i;
        }
    }
    return [s substringWithRange:NSMakeRange((resCenter - resLen) / 2, resLen - 1)];
}


@end
