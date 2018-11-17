//
//  LongestCommonPrefix_14.h
//  GLeetCode
//
//  Created by GIKI on 2018/11/17.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LongestCommonPrefix_14 : NSObject

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
+ (NSString*)longestCommonPrefix:(NSArray *)strs;
@end

NS_ASSUME_NONNULL_END