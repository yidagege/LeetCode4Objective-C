//
//  LevelOrderBottom_107.h
//  GLeetCode
//
//  Created by GIKI on 2018/11/22.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TreeNode.h"
NS_ASSUME_NONNULL_BEGIN

@interface LevelOrderBottom_107 : NSObject

/**
 给定一个二叉树，返回其节点值自底向上的层次遍历。 （即按从叶子节点所在层到根节点所在的层，逐层从左向右遍历）
 
 例如：
 给定二叉树 [3,9,20,null,null,15,7],
 
 3
 / \
 9  20
 /  \
 15   7
 返回其自底向上的层次遍历为：
 
 [
 [15,7],
 [9,20],
 [3]
 ]
 */
+(NSArray *)levelOrderBottom:(TreeNode *)node;

/**
 返回自上朝下的广度优先遍历
 */
+ (NSArray *)levelOrderTop:(TreeNode *)node;
@end

NS_ASSUME_NONNULL_END
