//
//  CodeString.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/26.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "CodeString.h"

@implementation CodeString

+ (void)stringTestEntrance
{
    int len = [[self class] longsetSubstring:@"bbsadgbbbbbbb"];
    NSLog(@"len");
}

/**
 1,无重复字符的最长子串
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 
 示例 1:
 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:

 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:
 
 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
 请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 */
+ (int)longsetSubstring:(NSString*)string
{
    int retval = 0;
    if (string.length<=1) {
        return (int)string.length;
    }
    NSMutableDictionary * map = [NSMutableDictionary dictionary];
    int left=0,right=0;
    for (right = 0; right<string.length; right++) {
        NSString * temp = [string substringWithRange:NSMakeRange(right, 1)];
        if (map[temp]) {
            map[temp] = @([map[temp] intValue]+1);
            while ([map[temp] intValue] > 1)  {
                NSString * next = [string substringWithRange:NSMakeRange(left, 1)];
                map[next] = @([map[next] intValue]-1);
                left++;
            }
        } else {
            map[temp] = @1;
        }
        retval = MAX(retval, right-left+1);
    }
    return retval;
}


/**
 2,最长公共前缀
 编写一个函数来查找字符串数组中的最长公共前缀。
 
 如果不存在公共前缀，返回空字符串 ""。
 
 示例 1:
 
 输入: ["flower","flow","flight"]
 输出: "fl"
 示例 2:
 
 输入: ["dog","racecar","car"]
 输出: ""
 解释: 输入不存在公共前缀。
 说明:
 
 所有输入只包含小写字母 a-z 。
 */

+ (NSString *)longsetPrefix:(NSArray *)array
{
    NSString * first = array[0];
    NSMutableString * retval = [NSMutableString string];
    for (int i=0; i<first.length; i++) {
        NSString *temp = [first substringWithRange:NSMakeRange(i, 1)];
        for (int j =1; j<array.count; j++) {
            NSString *prefixString = array[j];
            if (prefixString.length<=i || ![temp isEqualToString:[prefixString substringWithRange:NSMakeRange(i, 1)]]) {
                return retval.copy;
            }
        }
        [retval appendString:temp];
    }
    return retval.copy;
}

/**
 3,字符串的排列
 给定两个字符串 s1 和 s2，写一个函数来判断 s2 是否包含 s1 的排列。
 
 换句话说，第一个字符串的排列之一是第二个字符串的子串。
 
 示例1:
 
 输入: s1 = "ab" s2 = "eidbaooo"
 输出: True
 解释: s2 包含 s1 的排列之一 ("ba").
 
 
 示例2:
 
 输入: s1= "ab" s2 = "eidboaoo"
 输出: False
 
 
 注意：
 
 输入的字符串只包含小写字母
 两个字符串的长度都在 [1, 10,000] 之间
 */

/**
 4,字符串相乘
 给定两个以字符串形式表示的非负整数 num1 和 num2，返回 num1 和 num2 的乘积，它们的乘积也表示为字符串形式。
 
 示例 1:
 
 输入: num1 = "2", num2 = "3"
 输出: "6"
 示例 2:
 
 输入: num1 = "123", num2 = "456"
 输出: "56088"
 说明：
 
 num1 和 num2 的长度小于110。
 num1 和 num2 只包含数字 0-9。
 num1 和 num2 均不以零开头，除非是数字 0 本身。
 不能使用任何标准库的大数类型（比如 BigInteger）或直接将输入转换为整数来处理。
 */

/**
 4,翻转字符串里的单词
 给定一个字符串，逐个翻转字符串中的每个单词。
 
 示例:
 
 输入: "the sky is blue",
 输出: "blue is sky the".
 说明:
 
 无空格字符构成一个单词。
 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。
 进阶: 请选用C语言的用户尝试使用 O(1) 空间复杂度的原地解法。
 */

/**
 5,简化路径
 给定一个文档 (Unix-style) 的完全路径，请进行路径简化。
 
 例如，
 path = "/home/", => "/home"
 path = "/a/./b/../../c/", => "/c"
 
 边界情况:
 
 你是否考虑了 路径 = "/../" 的情况？
 在这种情况下，你需返回 "/" 。
 此外，路径中也可能包含多个斜杠 '/' ，如 "/home//foo/" 。
 在这种情况下，你可忽略多余的斜杠，返回 "/home/foo" 。
 */

/**
 6,复原IP地址
 给定一个只包含数字的字符串，复原它并返回所有可能的 IP 地址格式。
 
 示例:
 
 输入: "25525511135"
 输出: ["255.255.11.135", "255.255.111.35"]
 */
@end
