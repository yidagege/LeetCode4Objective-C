//
//  MySqrt_69.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/18.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "MySqrt_69.h"

@implementation MySqrt_69

/**
 二分查找
 */
+(int)mySqrt1:(int)x
{
    if (x<=1) {
        return x;
    }
    int left,right = x;
    while (left < right) {
        int mid = left + (right - left) / 2;
        if (x / mid >= mid) left = mid + 1;
        else right = mid;
    }
    return right - 1;
}

+(int)mySqrt2:(int)x{
    if (x<=1) {
        return x;
    }
    int left = 0,right = x;
    while (left < right) {
        int mid = left + (right - left)/2;
        if (x/mid >= mid) {
            left = mid + 1;
        }else{
            right = mid;
        }
    }
    return right - 1;
}

/**
 牛顿迭代法
 http://www.cnblogs.com/AnnieKim/archive/2013/04/18/3028607.html
 迭代公式
 xi+1=xi - (xi2 - n) / (2xi) = xi - xi / 2 + n / (2xi) = xi / 2 + n / 2xi = (xi + n/xi) / 2。
 */
+(int)mySqrt:(int)x
{
    if (x == 0) return 0;
    double last = 0;
    double res = 1;
    while (res != last)
        {
            last = res;
            res = (res + x / res) / 2;
        }
    return (int)res;
}


@end
