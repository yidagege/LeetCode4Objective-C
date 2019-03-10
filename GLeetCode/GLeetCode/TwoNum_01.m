//
//  TwoNum_01.m
//  GLeetCode
//
//  Created by 张毅 on 2018/11/1.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "TwoNum_01.h"

@implementation TwoNum_01

/**
1.两数之和，https://leetcode-cn.com/problems/two-sum/
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
    for (int i = 0; i < nums.count; i++) {
        NSInteger value = [nums[i] intValue];
        if (map[@(target-value)]) {
            return @[map[@(target-value)],@(i)];
        }else{
            map[@(value)] = @(i);
        }
    }
    return nil;
}



@end
