//
//  LongestSubstring_03.h
//  GLeetCode
//
//  Created by GIKI on 2018/11/14.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LongestSubstring_03 : NSObject

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
+ (NSUInteger)lengthOfLongestSubstring:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
