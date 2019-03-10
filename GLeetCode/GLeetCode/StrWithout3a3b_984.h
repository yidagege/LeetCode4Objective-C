//
//  StrWithout3a3b_984.h
//  GLeetCode
//
//  Created by 张毅 on 2019/3/10.
//  Copyright © 2019年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**
 984. 不含 AAA 或 BBB 的字符串.https://leetcode-cn.com/problems/string-without-aaa-or-bbb/
 给定两个整数 A 和 B，返回任意字符串 S，要求满足：
 
 S 的长度为 A + B，且正好包含 A 个 'a' 字母与 B 个 'b' 字母；
 子串 'aaa' 没有出现在 S 中；
 子串 'bbb' 没有出现在 S 中。
 
 
 示例 1：
 
 输入：A = 1, B = 2
 输出："abb"
 解释："abb", "bab" 和 "bba" 都是正确答案。
 示例 2：
 
 输入：A = 4, B = 1
 输出："aabaa"
*/
@interface StrWithout3a3b_984 : NSObject

@end

NS_ASSUME_NONNULL_END
