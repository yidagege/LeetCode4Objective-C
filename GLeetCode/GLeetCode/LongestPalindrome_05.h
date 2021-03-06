//
//  LongestPalindrome_05.h
//  GLeetCode
//
//  Created by 张毅 on 2018/11/1.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LongestPalindrome_05 : NSObject
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
+ (NSString *)longestPalindrome:(NSString *)string;
+ (NSString *)longestPalindrome2:(NSString *)string;
+ (NSString *)longestPalindrome3:(NSString *)s;
@end

NS_ASSUME_NONNULL_END
