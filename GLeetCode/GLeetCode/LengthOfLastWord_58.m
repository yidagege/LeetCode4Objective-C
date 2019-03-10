//
//  LengthOfLastWord_58.m
//  GLeetCode
//
//  Created by 张毅 on 2018/10/1.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "LengthOfLastWord_58.h"

@implementation LengthOfLastWord_58
/**
 给定一个仅包含大小写字母和空格 ' ' 的字符串，返回其最后一个单词的长度。
 
 如果不存在最后一个单词，请返回 0 。
 
 说明：一个单词是指由字母组成，但不包含任何空格的字符串。
 
 示例:
 
 输入: "Hello World"
 输出: 5
 */
+ (int)lengthOfLastWord:(NSString *)string
{
    int retval = 0;
    int count = 0;
    for (int i =0; i<string.length; i++) {
        NSString * temp = [string substringWithRange:NSMakeRange(i, 1)];
        if ([temp isEqualToString:@" "]) {
            retval = count;
            count = 0;
        } else {
            count ++;
        }
        if (i == string.length-1) {
            retval = count;
        }
    }
    return retval;
}
@end
