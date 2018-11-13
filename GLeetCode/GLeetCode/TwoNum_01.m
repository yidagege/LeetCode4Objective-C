//
//  TwoNum_01.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/13.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "TwoNum_01.h"

@implementation TwoNum_01

/**
 给定一个整数数组和一个目标值，找出数组中和为目标值的两个数。
 
 你可以假设每个输入只对应一种答案，且同样的元素不能被重复利用。
 
 示例:
 
 给定 nums = [2, 7, 11, 15], target = 9
 
 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]

 */


/**
 方案q1,双层循环匹配,时间O(n^2),不实现了.
 方案2,计算差值.时间O(n)/空间O(n)
 */
+ (NSArray *)twoNums:(NSArray *)nums target:(NSInteger)target
{
    NSMutableDictionary * map = [NSMutableDictionary dictionaryWithCapacity:nums.count];
    for (int i=0; i<nums.count; i++) {
        NSInteger diff = [nums[i] integerValue];
        if (map[@(diff)]) {
            return @[map[@(diff)],@(i)];
        } else {
            NSInteger diff_value = target - diff;
            map[@(diff_value)] = @(i);
        }
    }
    return nil;
}
@end
