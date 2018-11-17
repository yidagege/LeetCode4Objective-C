//
//  SearchInsert_35.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/17.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "SearchInsert_35.h"

@implementation SearchInsert_35


/**
 二分查找
 */
+ (int)searchInsert:(NSArray*)array target:(int)target
{
    if (array.count <=0) return 0;
    if ([array[0] intValue] > target) return 0;
    if ([array.lastObject intValue] < target) return (int)array.count;
    
    int low=0,mid=0,high=(int)array.count-1;
    while (low<high) {
        mid = (low+high)*0.5;
        if ([array[mid] intValue] >target) {
            low -=1;
        } else if ([array[mid] intValue] < target) {
            high += 1;
        } else {
            return mid;
        }
    }
    
    if ([array[mid] intValue] < target) {
        mid ++;
    }
    return mid;
}

@end
