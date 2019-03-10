//
//  MergeTwoArray_88.m
//  GLeetCode
//
//  Created by 张毅 on 2018/10/1.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "MergeTwoArray_88.h"

@implementation MergeTwoArray_88
/**
 给定两个有序整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，使得 num1 成为一个有序数组。
 
 说明:
 
 初始化 nums1 和 nums2 的元素数量分别为 m 和 n。
 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
 */
+ (void)mergeTwoArray:(NSMutableArray*)arr1 and:(NSArray*)arr2
{    
    NSMutableArray* res = [[NSMutableArray alloc]initWithCapacity:(arr1.count + arr2.count)];
    // i 标识 arr1数组, j 标识 arr2数组 , k标识res数组
    int i = 0, j = 0, k = 0;
    while (i < arr1.count && j < arr2.count) { //数组长度作为条件
        if ([arr1[i] integerValue] > [arr2[j] integerValue])
        {
            res[k++] = arr2[j++];
        }
        else {
            res[k++] = arr1[i++];
        }
    }
    while(i < arr1.count)
    {
        res[k++] = arr1[i++];
    }
    while(j < arr2.count)
    {
        res[k++] = arr2[j++];
    }
    NSLog(@"%@",res);
    [arr1 removeAllObjects];
    for (NSNumber *num in res) {
        [arr1 addObject:num];
    }

}




@end
