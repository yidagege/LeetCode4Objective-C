//
//  ZChange_06.m
//  GLeetCode
//
//  Created by zhangyi35 on 2019/2/11.
//  Copyright © 2019年 GIKI. All rights reserved.
//

#import "ZChange_06.h"

@implementation ZChange_06
/**
 方法二：按行访问
 思路

 按照与逐行读取 Z 字形图案相同的顺序访问字符串。
 
 算法
 
 首先访问 行 0 中的所有字符，接着访问 行 1，然后 行 2，依此类推...
 
 对于所有整数 k，
 
 行0 中的字符位于索引 k(2⋅numRows−2) 处;
 行numRows−1 中的字符位于索引 k(2⋅numRows−2)+numRows−1 处;
 内部的行i 中的字符位于索引k(2⋅numRows−2)+i 以及(k+1)(2⋅numRows−2)−i 处;
 
 
 //////////////
 将一个给定字符串根据给定的行数，以从上往下、从左到右进行 Z 字形排列。
 
 比如输入字符串为 "LEETCODEISHIRING" 行数为 3 时，排列如下：
 
 L   C   I   R
 E T O E S I I G
 E   D   H   N
 之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："LCIRETOESIIGEDHN"。
 */

+ (NSString *)zConvert:(NSInteger)numRows origin:(NSString *)origin{
    if (numRows == 1) return origin;
    
    NSMutableString *ret = [NSMutableString new];
    NSInteger n = origin.length;
    NSInteger cycleLen = 2 * numRows - 2;
    
    for (int i = 0; i < numRows; i++) {
        for (int j = 0; j + i < n; j += cycleLen) {
            NSRange range = NSMakeRange(j+i, 1);
            NSString *sub = [origin substringWithRange:range];
            [ret appendString:sub];
            if (i != 0 && i != numRows - 1 && j + cycleLen - i < n){
                NSRange range = NSMakeRange(j + cycleLen - i, 1);
                NSString *sub = [origin substringWithRange:range];
                [ret appendString:sub];
            }
        }
    }
    return ret;
}

@end
