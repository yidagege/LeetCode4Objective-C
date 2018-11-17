//
//  RemoveDuplicates_26.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/17.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "RemoveDuplicates_26.h"

@implementation RemoveDuplicates_26

/**
 双指针法
 数组完成排序后，设置慢指针i,快指针j.
 nums[i] = nums[j] ++j跳过chongfu项.
 nums[i] != nums[j],把nums[j]赋值给nums[i+1],++i

 */
+(int)removeDuplicates:(NSMutableArray *)numsM
{
    if (numsM.count == 0) return 0;
    int i=0;
    for (int j = 0; j<numsM.count; j++) {
        int m = [numsM[i] intValue];
        int n = [numsM[j] intValue];
        if (m != n ) {
            i++;
            numsM[i] = numsM[j];
        }
    }
    [numsM removeObjectsInRange:NSMakeRange(i+1, numsM.count-i-1)];
    return i+1;
}

@end
