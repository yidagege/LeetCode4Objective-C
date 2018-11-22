//
//  MaxDepth_104.h
//  GLeetCode
//
//  Created by GIKI on 2018/11/22.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TreeNode.h"
NS_ASSUME_NONNULL_BEGIN

@interface MaxDepth_104 : NSObject

/**
 给定一个二叉树，找出其最大深度。
 
 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。
 
 说明: 叶子节点是指没有子节点的节点。
 
 示例：
 给定二叉树 [3,9,20,null,null,15,7]，
 
  3
 / \
 9  20
 /  \
 15   7
 返回它的最大深度 3 。
 
 */
+ (int)maxDepth:(TreeNode*)root;
@end

NS_ASSUME_NONNULL_END
