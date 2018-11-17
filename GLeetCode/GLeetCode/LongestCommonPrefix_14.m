//
//  LongestCommonPrefix_14.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/17.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "LongestCommonPrefix_14.h"

@implementation LongestCommonPrefix_14
/**
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
+ (NSString*)longestCommonPrefix:(NSArray *)strs
{
    if (strs.count <=0) {
        return @"";
    }
    NSMutableString * retval = [NSMutableString string];
    NSString* fs = strs[0];
    for (int i = 0 ; i<fs.length; i++) {
        NSString * fv = [fs substringWithRange:NSMakeRange(i, 1)];
        for (int j = 1; j<strs.count; j++) {
            NSString* temp = strs[j];
            if (i>temp.length || ![fv isEqualToString:[temp substringWithRange:NSMakeRange(i, 1)]]) {
                return retval.copy;
            }
        }
        [retval appendString:fv];
    }
    return retval;
}
@end
