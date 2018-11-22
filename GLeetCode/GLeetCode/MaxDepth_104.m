//
//  MaxDepth_104.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/22.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "MaxDepth_104.h"

@implementation MaxDepth_104
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
 
 简单递归
 1+max(depth.left,depth.right)
 */

+ (int)maxDepth:(TreeNode*)root
{
    int depth = 0;
    if (root) {
        return 1 + MAX([MaxDepth_104 maxDepth:root.left], [MaxDepth_104 maxDepth:root.right]);
    }
    return depth;
}
@end
