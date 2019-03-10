//
//  SortedArrayToBST_108.m
//  GLeetCode
//
//  Created by 张毅 on 2018/10/1.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "SortedArrayToBST_108.h"

@implementation SortedArrayToBST_108

/**
 题目
 将一个按照升序排列的有序数组，转换为一棵高度平衡二叉搜索树。
 
 本题中，一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1。
 
 示例:
 
 给定有序数组: [-10,-3,0,5,9],
 
 一个可能的答案是：[0,-3,9,-10,null,5]，它可以表示下面这个高度平衡二叉搜索树：
 
 0
 / \
 -3   9
 /   /
 -10  5
 */

/**
 二叉搜索树:
 是一种满足左<根<右的特性,二叉搜索树的中序遍历得到的是一个有序数组.
 
 这个题给定的是个有序数组,so,反过来二叉搜索树的根节点应该是数组的中间点.从中间分开为左右两个数组,在分别找出其中间点的左右两个子节点.
 二分查找.
 */

+ (TreeNode *)sortedArrayToBST:(NSArray *)nums
{
    return [[self class] sortedMidArrayToBST:nums left:0 right:nums.count-1];;
}

+ (TreeNode *)sortedMidArrayToBST:(NSArray *)nums left:(int)left right:(int)right
{
    if (left > right) {
        return nil;
    }
    int mid = (left + right)/2;
    TreeNode * node = [TreeNode val:[nums[mid] intValue]];
    node.left = [[self class] sortedMidArrayToBST:nums left:left right:mid-1];
    node.right = [[self class] sortedMidArrayToBST:nums left:mid+1 right:right];
    return node;
}

+ (TreeNode *)ksortedArrToBst:(NSArray *)nums{
    int left = 0;
    int right = nums.count - 1;
    return [self ksortedMidToBST:nums left:left right:right];
}

+ (TreeNode *)ksortedMidToBST:(NSArray *)array left:(int)left right:(int)right{
    if (left>right) {
        return nil;
    }
    int mid = (left + right)/2;
    TreeNode *node = [TreeNode val:[array[mid] intValue]];
    node.left = [self ksortedMidToBST:array left:left right:mid-1];
    node.right = [self ksortedMidToBST:array left:mid+1 right:right];
    return node;
}

@end
