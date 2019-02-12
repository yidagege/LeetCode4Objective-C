//
//  StringToNum_08.m
//  GLeetCode
//
//  Created by zhangyi35 on 2019/2/11.
//  Copyright © 2019年 GIKI. All rights reserved.
//

#import "StringToNum_08.h"

@implementation StringToNum_08

+ (int)StringToNum:(NSString *)str{
    if (!str.length) return 0;
    int sign = 1, base = 0, i = 0;
    NSInteger n = str.length;
    while (i < n && [[self getCharactor:str index:i] isEqualToString:@" "]) ++i;
    if ([[self getCharactor:str index:i] isEqualToString:@"+"] || [[self getCharactor:str index:i] isEqualToString:@"-"]) {
        sign = ([[self getCharactor:str index:i++] isEqualToString:@"+"]) ? 1 : -1;

    }
    while (i < n && [[self getCharactor:str index:i] characterAtIndex:0] >= [@"0" characterAtIndex:0] && [[self getCharactor:str index:i] characterAtIndex:0] <= [@"9" characterAtIndex:0]) {
        if (base > INT_MAX / 10 || (base == INT_MAX / 10 && [[self getCharactor:str index:i] characterAtIndex:0] - [@"0" characterAtIndex:0] > 7)) {
            return (sign == 1) ? INT_MAX : INT_MIN;
        }
        base = 10 * base + [[self getCharactor:str index:i++] intValue];
    }
    return base * sign;
}

+ (NSString *)getCharactor:(NSString *)origin index:(NSInteger)index{
    if (!origin || index >= origin.length) {
        return nil;
    }
    NSRange range = NSMakeRange(index, 1);
    NSString *sub = [origin substringWithRange:range];
    return sub;
}

@end
