//
//  CodeString.m
//  GLeetCode
//
//  Created by 张毅 on 2018/10/1.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "CodeString.h"
#import "Stack.h"
@implementation CodeString

+ (void)stringTestEntrance
{
    int len = [[self class] longsetSubstring:@"bbsadgbbbbbbb"];
    NSLog(@"len");
    
    NSString * total =  [[self class] multiply:@"24" and:@"23"];
    NSLog(@"multiply-%@",total);
    
    NSString * reverse = [[self class] strReverse:@"i am a student"];
    NSLog(@"strReverse-%@",reverse);
    NSArray * array = [[self class] restoreIpAddresses:@"25525511135"];
    NSLog(@"restoreIP-%@",array);
    /**
     path = "/home/", => "/home"
     path = "/a/./b/../../c/", => "/c"
     
     边界情况:
     
     你是否考虑了 路径 = "/../" 的情况？
     在这种情况下，你需返回 "/" 。
     此外，路径中也可能包含多个斜杠 '/' ，如 "/home//foo/" 。
     在这种情况下，你可忽略多余的斜杠，返回 "/home/foo" 。
     */
    NSString * path = [[self class] simplifyPath:@"/home//foo/"];
    NSLog(@"simplifyPath--%@",path);
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
 
 bool checkInclusion(string s1, string s2) {
 int len1=s1.length(),len2=s2.length();
 if(len1>len2) return false;
 vector<int> S(26);
 vector<int> V(26);
 for(int i=0;i<len1;i++){
 S[s1[i]-97]++;
 V[s2[i]-97]++;
 }
 for(int i=0;i<len2-len1+1;i++){
 if(S==V) return true;
 if(i<len2-len1){
 V[s2[i]-97]--;
 V[s2[i+len1]-97]++;
 }
 }
 return false;
 }
https://leetcode-cn.com/problems/permutation-in-string/
 */

+ (BOOL)checkInclusion:(NSString*)s1 and:(NSString*)s2
{
    int len1 = (int)s1.length;
    int len2 = (int)s2.length;
    if (len1 > len2) {
        return false;
    }
    NSMutableArray * arr1 = [NSMutableArray arrayWithCapacity:26];
    NSMutableArray * arr2 = [NSMutableArray arrayWithCapacity:26];
    for (int i=0; i<len1; i++) {
        NSInteger val = [s1 characterAtIndex:i];
        
    }
    return false;
}

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
 https://blog.csdn.net/u011446177/article/details/52894191
 https://blog.csdn.net/jeffleo/article/details/53446095
 */

/**
  a*b={a1*10^(n1/2)+a0}*{b1*10^(n2/2)+b0}
 */
+ (NSString *)multiply:(NSString*)num1 and:(NSString *)num2
{
    NSString * retval = @"";
    if (num1.length == 1 || num2.length ==1) {
        long temp1 = [num1 longLongValue];
        long temp2 = [num2 longLongValue];
        long val = temp1*temp2;
        retval = [NSString stringWithFormat:@"%ld",val];
        return retval;
    }
    /// a1 a0 b1 b0
    int a0len = (int)num1.length/2;
    int a1len = (int)num1.length - a0len;
    NSString * a0 = [num1 substringWithRange:NSMakeRange(0, a0len)];
    NSString *a1 = [num1 substringWithRange:NSMakeRange(a0len,a1len)];
    
    int b0len = (int)num2.length/2;
    int b1len = (int)num2.length - b0len;
    NSString * b0 = [num2 substringWithRange:NSMakeRange(0, b0len)];
    NSString *b1 = [num2 substringWithRange:NSMakeRange(b0len,b1len)];
    // 计算多项式的中的乘法
    // * a*b=
    // * (a1*b1)* 10^[(n1+n2)/2 ]
    // * +(a1*b0)*10^(n1/2)
    // * +(a0*b1)*10^(n2/2)
    // * +(a0*b0)
    //2.计算展开式中的乘法
    NSString * a1b1 = [[self class] multiply:a1 and:b1];
    NSString * a1b0 = [[self class] multiply:a1 and:b0];
    NSString * a0b1 = [[self class] multiply:a0 and:b1];
    NSString * a0b0 = [[self class] multiply:a0 and:b0];
     //3.模拟移位

    NSMutableString* retvala1b1 = [a1b1 mutableCopy];
    for (int i=0; i<a0len + b0len; i++) {
        [retvala1b1 appendString:@"0"];
    }
    NSMutableString* retvala1b0 = [a1b0 mutableCopy];
    for (int i = 0; i<a0len; i++) {
        [retvala1b0 appendString:@"0"];
    }
    NSMutableString* retvala0b1 = [a0b1 mutableCopy];
    for (int i = 0; i<b0len; i++) {
        [retvala0b1 appendString:@"0"];
    }
    long a1b1Val =  [retvala1b1 longLongValue];
    long a1b0Val = [retvala1b0 longLongValue];
    long a0b1Val = [retvala0b1 longLongValue];
    long a0b0Val = [a0b0 longLongValue];
    long total = a1b1Val + a1b0Val + a0b1Val + a0b0Val;
    return [NSString stringWithFormat:@"%ld",total];
}
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

+ (NSString * )strReverse:(NSString *)string
{
    if (string.length <= 2) {
        return string;
    }
    int left = 0,right=0;
    Stack *stack = [Stack new];
    while (right<string.length) {
        NSString * temp = [string substringWithRange:NSMakeRange(right, 1)];
        if ([temp isEqualToString:@" "]) {
             NSString * temp2 = [string substringWithRange:NSMakeRange(left, right-left)];
            [stack push:temp2];
            left = right+1 ;
        } else if (right==string.length-1) {
            NSString * temp2 = [string substringWithRange:NSMakeRange(left, right-left+1)];
            [stack push:temp2];
        }
        right ++;
    }
    NSMutableString * retval = @"".mutableCopy;
    while (!stack.isEmpty) {
        [retval appendString:[stack pop]];
        [retval appendString:@" "];
    }
    return retval.copy;
}

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
 重复连续出现的'/'，只按1个处理，即跳过重复连续出现的'/'；
 如果路径名是"."，则不处理；
 如果路径名是".."，则需要弹栈，如果栈为空，则不做处理；
 如果路径名为其他字符串，入栈。
 最后，再逐个取出栈中元素（即已保存的路径名），用'/'分隔并连接起来，不过要注意顺序呦。
*/
+ (NSString*)simplifyPath:(NSString *)path
{
    Stack * stack = [Stack new];
    NSArray * array = [path componentsSeparatedByString:@"/"];
    if (array.count <=0 ) {
        return @"/";
    }
    NSArray * rules = @[@".",@" ",@"",@".."];
    for (int i =0; i<array.count; i++) {
        NSString * temp = array[i];
        if (![rules containsObject:temp]) {
            [stack push:temp];
        }
        if ([temp isEqualToString:@".."] && !stack.isEmpty) {
            [stack pop];
        }
    }
    NSMutableString * retval = @"".mutableCopy;
    while (![stack isEmpty]) {
        [retval appendString:@"/"];
        NSString * temp = stack.pop;
        [retval appendString:temp];
    }
    return retval.length>0 ? retval : @"/";
}

/**
 6,复原IP地址
 给定一个只包含数字的字符串，复原它并返回所有可能的 IP 地址格式。
 
 示例:
 
 输入: "25525511135"
 输出: ["255.255.11.135", "255.255.111.35"]
 
 链接：https://www.nowcoder.com/questionTerminal/ce73540d47374dbe85b3125f57727e1e
 */

void DFS(NSMutableArray * array,NSString *t,NSString *s,int count) {
    NSLog(@"t--%@,s--%@,count--%d",t,s,count);
    if (count == 3 && isValid(s)) {
        [array addObject:[NSString stringWithFormat:@"%@%@",t,s]];
        return;
    }
    for (int i =1; i<4&&i<s.length; i++) {
        NSString *temp = [s substringWithRange:NSMakeRange(0, i)];
        if (isValid(temp)) {
            DFS(array, [NSString stringWithFormat:@"%@%@.",t,temp], [s substringFromIndex:i], count+1);
        }
    }
}

BOOL isValid(NSString * s)
{
    if ([s isEqualToString:@" "]) {
        return NO;
    }
    int num = [s intValue];
    return num>=0 && num<=255;
}

+ (NSArray *)restoreIpAddresses:(NSString*)string
{

    NSMutableArray * array = [NSMutableArray array];
    NSString *t = @"";
    DFS(array, t, string, 0);
    return array.copy;
}
@end
