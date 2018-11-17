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
  https://blog.csdn.net/abnerwang2014/article/details/36027747
 */
+ (int)maxSubArray3:(NSArray *)array
{
    int len = (int)array.count;
    int left = 0;
    int right = len -1;
    return [MaxSubArray_53 maxSubDivide:array left:left right:right];
}

+ (int)maxSubDivide:(NSArray*)array left:(int)left right:(int)right
{
    if (left == right) {
        return [array[left] intValue];
    }
    ///分界点
    int center = (left + right )/2;
    ///递归左序列最大子序列和
    int maxLeftNum = [MaxSubArray_53 maxSubDivide:array left:left right:center];
    ///递归右序列最大子序列和
    int maxRightNum = [MaxSubArray_53 maxSubDivide:array left:center+1 right:right];
    
    ///计算横跨左半部分和右半部分的最大子序列和
    
    ///one setp
    ///首先是左半部分子序列中包含最后一个元素的最大子序列和
    int leftMax = [array[center] intValue], leftSum = [array[center] intValue];
    for (int i = center - 1; i >= left; --i) {
        leftSum += [array[i] intValue];
        if (leftSum > leftMax)
            leftMax = leftSum;
    }
    /// 接着是右半部分子序列中包含第一个元素的最大子序列和
    int rightMax = [array[center + 1] intValue], rightSum = [array[center + 1] intValue];
    for (int i = center + 2; i <= right; ++i) {
        rightSum += [array[i] intValue];
        if (rightSum > rightMax)
            rightMax = rightSum;
    }
    
   // 返回左、右半部分子序列的最大子序列和以及横跨左、右半部分的最大子序列和中的最大者
    return MAX(leftMax+rightMax, MAX(maxLeftNum, maxRightNum));
}
@end
