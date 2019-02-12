//
//  RomanToInt_13.m
//  GLeetCode
//
//  Created by zhangyi35 on 2019/2/11.
//  Copyright © 2019年 GIKI. All rights reserved.
//

#import "RomanToInt_13.h"

@implementation RomanToInt_13

+ (NSInteger)RomanToInt:(NSString *)str
{
    NSInteger result = 0;
    if (str.length == 0) {
        return result;
    }
    result = romanCharToInt([str characterAtIndex:0]);
    for (int i=1; i<str.length; i++){
        int prev = romanCharToInt([str characterAtIndex:(i-1)]);
        int curr = romanCharToInt([str characterAtIndex:i]);
        if (prev < curr) {
            result = result - prev + (curr-prev);
        }else{
            result += curr;
        }
    }
    return result;
}


int romanCharToInt(char ch){
    int d = 0;
    switch(ch){
        case 'I':
            d = 1;
            break;
        case 'V':
            d = 5;
            break;
        case 'X':
            d = 10;
            break;
        case 'L':
            d = 50;
            break;
        case 'C':
            d = 100;
            break;
        case 'D':
            d = 500;
            break;
        case 'M':
            d = 1000;
            break;
    }
    return d;
}


@end
