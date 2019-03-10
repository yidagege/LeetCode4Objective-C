//
//  MySqrt_69.h
//  GLeetCode
//
//  Created by 张毅 on 2018/10/1.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MySqrt_69 : NSObject

/**
 实现 int sqrt(int x) 函数。
 
 计算并返回 x 的平方根，其中 x 是非负整数。
 
 由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。
 
 示例 1:
 
 输入: 4
 输出: 2
 示例 2:
 
 输入: 8
 输出: 2
 说明: 8 的平方根是 2.82842...,
 由于返回类型是整数，小数部分将被舍去。
 */
+(int)mySqrt:(int)x;
@end

NS_ASSUME_NONNULL_END
