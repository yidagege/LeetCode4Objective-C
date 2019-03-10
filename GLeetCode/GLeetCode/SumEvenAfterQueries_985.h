//
//  SumEvenAfterQueries_985.h
//  GLeetCode
//
//  Created by 张毅 on 2019/3/10.
//  Copyright © 2019年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**
 985. 查询后的偶数和.https://leetcode-cn.com/problems/sum-of-even-numbers-after-queries/
 给出一个整数数组 A 和一个查询数组 queries。
 
 对于第 i 次查询，有 val = queries[i][0], index = queries[i][1]，我们会把 val 加到 A[index] 上。然后，第 i 次查询的答案是 A 中偶数值的和。
 
 （此处给定的 index = queries[i][1] 是从 0 开始的索引，每次查询都会永久修改数组 A。）
 
 返回所有查询的答案。你的答案应当以数组 answer 给出，answer[i] 为第 i 次查询的答案。
 */
@interface SumEvenAfterQueries_985 : NSObject

@end

NS_ASSUME_NONNULL_END
