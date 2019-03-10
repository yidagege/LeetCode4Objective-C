//
//  LevelOrderBottom_107.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/22.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "LevelOrderBottom_107.h"
#import "Queue.h"
@implementation LevelOrderBottom_107
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

/**
 与树的前中后序遍历的DFS思想不同，层次遍历用到的是BFS思想。一般DFS用递归去实现（也可以用栈实现），BFS需要用队列去实现。
 
 层次遍历的步骤是：
 
 1.对于不为空的结点，先把该结点加入到队列中
 
 2.从队中拿出结点，如果该结点的左右结点不为空，就分别把左右结点加入到队列中
 
 3.重复以上操作直到队列为空
 
 
 */
+(NSArray *)levelOrderBottom:(TreeNode *)node
{
    
    NSMutableArray * retval;
    if (!node) {
        return retval;
    }
    Queue * queue = [Queue new];
    [queue push:node];
    while (!queue.isEmpty) {
        TreeNode * temp = queue.pop;
        NSLog(@"%d",temp.val);
        if (temp.left) {
            [queue push:temp.left];
        }
        if (temp.right) {
            [queue push:temp.right];
        }
    }
    return nil;
}

+ (NSArray *)levelOrderTop:(TreeNode *)node
{
    NSMutableArray * retval = [NSMutableArray new];
    if (node) {
        NSMutableArray * temp = [NSMutableArray array];
        [temp addObject:@(node.val)];
        [retval addObject:temp];
        [LevelOrderBottom_107 traverse:retval treeNode:node.left level:1];
        [LevelOrderBottom_107 traverse:retval treeNode:node.right level:1];
    }
    return retval.copy;
}

+ (void)traverse:(NSMutableArray *)array treeNode:(TreeNode*)node level:(int)level
{
    NSMutableArray *temp = nil;
    if (node) {
        if (array.count == level) {
            temp = [NSMutableArray array];
            [array addObject:temp];
        } else {
            temp = array[level];
        }
        [temp addObject:@(node.val)];
        [LevelOrderBottom_107 traverse:array treeNode:node.left level:level+1];
        [LevelOrderBottom_107 traverse:array treeNode:node.right level:level+1];
    }
}

+ (NSArray *)levelOrder:(TreeNode *)node{
    NSMutableArray *ret = [NSMutableArray new];
    if (node) {
        NSMutableArray *tmp = [NSMutableArray new];
        [tmp addObject:@(node.val)];
        [ret addObject:tmp];
        [self ktraverse:ret treeNode:node.left level:1];
        [self ktraverse:ret treeNode:node.right level:1];
    }
    return ret.copy;
}

+ (void)ktraverse:(NSMutableArray *)array treeNode:(TreeNode *)node level:(int)level{
    NSMutableArray *tmp = nil;
    if (node) {
        if (level == array.count) {
            tmp = [NSMutableArray new];
            [array addObject:tmp];
        }else{
            tmp = array[level];
        }
        [tmp addObject:@(node.val)];
        [self ktraverse:array treeNode:node.left level:level+1];
        [self ktraverse:array treeNode:node.right level:level+1];
    }
}


@end
