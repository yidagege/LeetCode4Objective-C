//
//  ThreeSum_15.m
//  GLeetCode
//
//  Created by zhangyi35 on 2019/2/11.
//  Copyright © 2019年 GIKI. All rights reserved.
//

#import "ThreeSum_15.h"

@implementation ThreeSum_15

/**
 https://leetcode-cn.com/problems/3sum/
 
 给定一个包含 n 个整数的数组 nums 无序，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。
 
 注意：答案中不可以包含重复的三元组。
 
 例如, 给定数组 nums = [-1, 0, 1, 2, -1, -4]，
 
 满足要求的三元组集合为：
 [
 [-1, 0, 1],
 [-1, -1, 2]
 ]
 此题可以变化成a+b=-c，且c在数组内
 
 */

+ (NSMutableSet *)ThreeSum:(NSArray *)sum{
    if (sum.count < 3 || !sum) {
        return nil;
    }
    NSMutableSet *results = [NSMutableSet new];
    for (NSInteger i = 0; i<sum.count - 1; i++) {
        for (NSInteger j = i+1; j<sum.count; j++) {
            NSInteger vali = [sum[i] integerValue];
            NSInteger valj = [sum[j] integerValue];
            NSInteger temp = (vali + valj) * -1;
            if (temp != vali && temp != valj && [sum containsObject:@(temp)]) {
                NSSet *set = [NSSet setWithObjects:sum[i],sum[j],@(temp), nil];
                [results addObject:set];
            }
        }
    }
    return results;
}



@end
