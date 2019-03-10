//
//  TwoNum_01.h
//  GLeetCode
//
//  Created by 张毅 on 2018/11/1.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TwoNum_01 : NSObject
/**
 给定一个整数数组和一个目标值，找出数组中和为目标值的两个数。
 
 你可以假设每个输入只对应一种答案，且同样的元素不能被重复利用。
 
 示例:
 
 给定 nums = [2, 7, 11, 15], target = 9
 
 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 
 */
+ (NSArray *)twoNums:(NSArray *)nums target:(NSInteger)target;

@end

NS_ASSUME_NONNULL_END
