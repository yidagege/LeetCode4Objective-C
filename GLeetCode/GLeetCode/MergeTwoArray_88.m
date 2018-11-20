//
//  MergeTwoArray_88.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/19.
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
    int index1 = (int)arr1.count-1;
    int temp = (int)arr1.count;
    int index2 = (int)arr2.count-1;
    int indexN = (int)arr1.count+(int)arr2.count-1;
    while (index1 >= 0 && index2 >= 0) {
        if ([arr1[index1] intValue]>[arr2[index2] intValue]) {
            if (arr1.count - index1 == 1 ) {
                [arr1 addObject:arr1[index1]];
            } else {
                id obj = arr1[index1] ;
                [arr1 removeObjectAtIndex:index1];
                [arr1 insertObject:obj atIndex:arr1.count-(arr1.count - temp)];
                
            }
            indexN -- ;
            index1 --;
        } else {
            if (arr1.count - index1 == 1 ) {
                [arr1 addObject:arr2[index2]];
            } else {
                [arr1 insertObject:arr2[index2] atIndex:arr1.count-(arr1.count - temp)];
            }
            
            indexN -- ;
            index2 --;
//            arr1[indexN--] = arr2[index2--];
        }
    }
    while (index2 >= 0) {
        
        if (arr1.count - index1 == 1 ) {
            [arr1 addObject:arr2[index2]];
        } else {
            [arr1 insertObject:arr2[index2] atIndex:indexN];
        }
        indexN -- ;
        index2 --;
    }

}
@end
