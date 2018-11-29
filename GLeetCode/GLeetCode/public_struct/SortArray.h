//
//  SortArray.h
//  GLeetCode
//
//  Created by GIKI on 2018/11/27.
//  Copyright © 2018 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SortArray : NSObject
/**
 冒泡排序
 
 @param array <#array description#>
 */
+ (void)sortBubbling:(NSMutableArray *)array;

/**
 冒泡排序优化写法
 没有数据交换时,提前退出循环.
 @param array <#array description#>
 */
+ (void)sortBubblingBetter:(NSMutableArray *)array;

/**
 插入排序
 时间复杂度 O(n^2)，最好情况下是 O(n)，空间复杂度是 O(1)，交换次数
 @param array <#array description#>
 */
+ (void)sortInsert:(NSMutableArray *)array;

/**
 选择排序
 每一趟从待排序的记录中选出最小的元素，顺序放在已排好序的序列最后，直到全部记录排序完毕。
 @param array <#array description#>
 */
+ (void)sortSelection:(NSMutableArray*)array;

/**
 快速排序
 分治思想,先分区,在处理子问题
 O(nlogn) 最坏: O(n2)
 处理过程从上自下,先分区,在处理子问题. 原地排序
 递推公式：
 quick_sort(p…r) = quick_sort(p…q-1) + quick_sort(q+1, r)
 终止条件：
 p >= r
 @param array <#array description#>
 */
+ (void)sortFast:(NSMutableArray *)array;
@end

NS_ASSUME_NONNULL_END
