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
    while (![queue isEmpty]) {
//        NSMutableArray *
    }
    return nil;
}


/**
 queue<TreeNode*> que;
 que.push(root);
 vector<vector<int>> re;
 if(root==NULL) return re;
 
 while(!que.empty())
 {
 vector<int> a;
 queue<TreeNode*> next;
 while(!que.empty())
 {
 TreeNode* tre = que.front() ;
 a.push_back(tre->val);
 que.pop();
 if(tre->left) next.push(tre->left);
 if(tre->right) next.push(tre->right);
 
 }
 re.push_back(a);
 que=next;
 
 }
 return re;
 
 ---------------------
 作者：我是小x
 来源：CSDN
 原文：https://blog.csdn.net/qq_31442743/article/details/81118131
 版权声明：本文为博主原创文章，转载请附上博文链接！
 */
@end
