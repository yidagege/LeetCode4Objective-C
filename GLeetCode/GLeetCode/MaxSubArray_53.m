//
//  MaxSubArray_53.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/17.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "MaxSubArray_53.h"

@implementation MaxSubArray_53

/**
 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
 示例:
 
 输入: [-2,1,-3,4,-1,2,1,-5,4],
 输出: 6
 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
 */


/**
 Solution1:
    动态规划 O(n)
    连续数组,状态 dp[i]
 状态转移方程:
    dp[i] = MAX(dp[i-1]+array[i],array[i])
 */
+ (int)maxSubArray1:(NSArray *)array
{
    int count = (int)array.count;
    if (count == 0) {
        return 0;
    }

    NSMutableArray * dp = [NSMutableArray new];
    dp[0] = array[0];
    int retval = [array[0] intValue];
    for (int i =1; i<count ; i++) {

        dp[i] = @(MAX([dp[i-1] intValue]+[array[i] intValue],[array[i] intValue]));
    }
    ///全局最优解.
    for (int i =0;i<count;i++) {
        retval = MAX([dp[i] intValue],retval);
    }
    return retval;
}

/**
 Solution2:
 1的优化版本
 缓存全局最优解.
 只需一遍遍历
 */
+ (int)maxSubArray:(NSArray *)array
{
    int count = (int)array.count;
    if (count == 0) {
        return 0;
    }
    
    NSMutableArray * dp = [NSMutableArray new];
    dp[0] = array[0];
    int retval = [array[0] intValue];
    int cache = [array[0] intValue];
    for (int i =1; i<count ; i++) {
        
        cache = MAX(cache+[array[i] intValue],[array[i] intValue]);
        retval = MAX(cache,retval);
    }
    return retval;
}

/**
 Solution3:
 分治算法

 */
+ (int)maxSubArray2:(NSArray *)array{
    
}
@end
