//
//  Palindrome_09.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/15.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "Palindrome_09.h"

@implementation Palindrome_09

+ (BOOL)isPalindrome:(int)x
{
    /// 负数,最后一位为0
    if (x < 0 || (x!=0 && x%10 == 0)) {
        return NO;
    }
    int reverse = 0;
    while (x>reverse) {
        reverse = reverse*10 + x%10;
        x /= 10;
    }
    return x == reverse || x == reverse/10;
}

@end
