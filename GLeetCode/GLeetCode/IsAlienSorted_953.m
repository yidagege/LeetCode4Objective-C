//
//  IsAlienSorted_953.m
//  GLeetCode
//
//  Created by 张毅 on 2019/3/10.
//  Copyright © 2019年 GIKI. All rights reserved.
//

#import "IsAlienSorted_953.h"

@implementation IsAlienSorted_953


+ (BOOL)compareWord1AndWord2:(NSString *)word1 word2:(NSString *)word2 oder:(NSString *)order{
    NSInteger i = 0;
    while ([word1 substringWithRange:NSMakeRange(i, 1)] || [word2 substringWithRange:NSMakeRange(i, 1)] ) {
        if (![word1 substringWithRange:NSMakeRange(i, 1)] ) {  // 只剩word2，说明word1小，返回true
            return true;
        }
        if (![word2 substringWithRange:NSMakeRange(i, 1)] ) {  // 只剩word1，说明word2小，返回false
            return false;
        }
        // 两者都存在
        if ([order rangeOfString:[word1 substringWithRange:NSMakeRange(i, 1)]].location == [order rangeOfString:[word2 substringWithRange:NSMakeRange(i, 1)]].location) {  // 字符相等就跳到下一字符
            i++;
            continue;
        } else {
            return [order rangeOfString:[word1 substringWithRange:NSMakeRange(i, 1)]].location < [order rangeOfString:[word2 substringWithRange:NSMakeRange(i, 1)]].location;  // 当前字符大的单词顺序就靠后
        }
    }
    return true; // 当所有字符都相等时，返回true
}


@end
