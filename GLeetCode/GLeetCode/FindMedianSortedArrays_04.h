//
//  FindMedianSortedArrays_04.h
//  GLeetCode
//
//  Created by 张毅 on 2018/11/1.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FindMedianSortedArrays_04 : NSObject
/**
 给定两个大小为 m 和 n 的有序数组 nums1 和 nums2 。
 请找出这两个有序数组的中位数。要求算法的时间复杂度为 O(log (m+n)) 。
 你可以假设 nums1 和 nums2 不同时为空。
 示例 1:
 nums1 = [1, 3]
 nums2 = [2]
 中位数是 2.0
 示例 2:
 nums1 = [1, 2]
 nums2 = [3, 4]
 中位数是 (2 + 3)/2 = 2.5
 */

+ (float)findMedianSortedArrays:(NSArray *)arrA and:(NSArray *)arrB;


/**
 分治算法变形题.
 如何在2个有序数组数组中查找Top K的值（Top K的问题可以转换成求第k个元素的问题）
 */

+ (float)findTopK:(NSUInteger)topK sortedArrays:(NSArray *)arrA and:(NSArray *)arrB;


@end

NS_ASSUME_NONNULL_END
