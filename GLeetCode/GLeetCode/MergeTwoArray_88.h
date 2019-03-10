//
//  MergeTwoArray_88.h
//  GLeetCode
//
//  Created by 张毅 on 2018/10/1.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MergeTwoArray_88 : NSObject

/**
 给定两个有序整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，使得 num1 成为一个有序数组。
 
 说明:
 
 初始化 nums1 和 nums2 的元素数量分别为 m 和 n。
 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
 */

+ (void)mergeTwoArray:(NSMutableArray*)arr1 and:(NSArray*)arr2;
@end

NS_ASSUME_NONNULL_END
