//
//  AddBinary_67.m
//  GLeetCode
//
//  Created by 张毅 on 2018/10/1.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "AddBinary_67.h"

@implementation AddBinary_67

/**
 倒叙取出一个字符，转为数字，若无法取出字符则按0处理
 然后定义进位carry，初始化为0
 将三者加起来，对2取余即为当前位的数字，对2取商即为当前进位的值，
 最后判断下carry，如果为1的话，要在结果最前面加上一个1
 */
+(NSString *)addBinary:(NSString *)str1 and:(NSString*)str2
{
    if (str1.length < str2.length) {
        return [AddBinary_67 addBinary:str2 and:str1];
    }
    int len = (int)str1.length;
    int carry = 0;//进位
    NSMutableString * retval = [NSMutableString new];
    for (int i = len-1 ; i >=0; i--) {
        int tempA = [[str1 substringWithRange:NSMakeRange(i, 1)] intValue];
//        int tempB = (i<str2.length)?[[str2 substringWithRange:NSMakeRange(i, 1)] intValue] : 0;
        int tempB = (len - (i+1) < str2.length) ? [[str2 substringWithRange:NSMakeRange(len - (i+1), 1)] intValue] : 0;

        int val = (tempA+tempB+carry)%2;
        carry = (tempA+tempB+carry)/2;
        [retval insertString:[NSString stringWithFormat:@"%d",val] atIndex:0];
    }
    if (carry == 1) {
        [retval insertString:@"1" atIndex:0];
    }
    return retval.copy;
}

+ (NSString *)kaddBinary:(NSString *)str1 and:(NSString *)str2{
    if (str1.length < str2.length) {
        return [self kaddBinary:str2 and:str1];
    }
    int len = str1.length;
    int carry = 0;//管理进位
    NSMutableString *retval = [NSMutableString new];
    for (int i = len-1; i>=0; i--) {
        int tempa = [[str1 substringWithRange:NSMakeRange(i, 1)] intValue];
        int tempb = (len - (i+1) < str2.length) ? [[str2 substringWithRange:NSMakeRange(len - (i+1), 1)] intValue] : 0;
        int val = (tempa + tempb +carry) % 2;//取余
        carry = (tempa + tempb + carry) / 2;//取倍数
        [retval insertString:[NSString stringWithFormat:@"%zd",val] atIndex:0];
    }
    if (carry == 1) {
        [retval insertString:@"1" atIndex:0];
    }
    
    return retval;
}

@end
