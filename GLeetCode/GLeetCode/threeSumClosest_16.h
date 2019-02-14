//
//  threeSumClosest_16.h
//  GLeetCode
//
//  Created by zhangyi35 on 2019/2/14.
//  Copyright © 2019年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 https://leetcode-cn.com/problems/3sum-closest/
16.最接近的三数之和
 给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。
 
 例如，给定数组 nums = [-1，2，1，-4], 和 target = 1.
 
 与 target 最接近的三个数的和为 2. (-1 + 2 + 1 = 2).
 */

NS_ASSUME_NONNULL_BEGIN

@interface threeSumClosest_16 : NSObject

+ (NSInteger)threeSumClosest:(NSArray *)nums target:(NSInteger)target;

@end

NS_ASSUME_NONNULL_END
