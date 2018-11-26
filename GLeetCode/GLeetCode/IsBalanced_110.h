//
//  IsBalanced_110.h
//  GLeetCode
//
//  Created by GIKI on 2018/11/26.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TreeNode.h"
NS_ASSUME_NONNULL_BEGIN

@interface IsBalanced_110 : NSObject
/**
 给定一个二叉树，判断它是否是高度平衡的二叉树。
 
 本题中，一棵高度平衡二叉树定义为：
 
 一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过1。
 
 示例 1:
 
 给定二叉树 [3,9,20,null,null,15,7]
 
 3
 / \
 9  20
 /  \
 15   7
 返回 true 。
 
 示例 2:
 
 给定二叉树 [1,2,2,3,3,null,null,4,4]
 
 1
 / \
 2   2
 / \
 3   3
 / \
 4   4
 返回 false 。
 */
+ (BOOL)isBalanced:(TreeNode*)treeNode;
@end

NS_ASSUME_NONNULL_END