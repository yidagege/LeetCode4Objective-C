//
//  TreeNode.m
//  GLeetCode
//
//  Created by 张毅 on 2018/10/1.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "TreeNode.h"
#import "Stack.h"
@implementation TreeNode

+ (instancetype)val:(int)val
{
    TreeNode * node = [TreeNode new];
    node.val = val;
    return node;
}

/**
 传入数组,可快速生成树
 
 @param array [1,2,3]
 
 @return
 1
 / \
 2 3
 */
/*
 思路:
 数组下标的范围是0到n-1,而在树中编号是从1开始的，下标的范围是1到n;
 
 　　根据二叉树的性质（将一个完全二叉树按照从上到下，从左到右进行编号，其编号为i的节点，如果满足2*i<=n,则说明编号为i的节点有左孩子，否则没有，如果满足2*i+1<=n,则说明编号为i的节点有右孩子，否则没有）可知
 
 2*i<=n
 
 2*i+1<=n
 
 该性质是对树的编号（1~n）成立的，而数组的下标是从0到n-1，将对应下标都减1可知，对于数组0~n-1来说，
 
 2*i-1<=n-1
 
 2*i<=n-1是成立的。
 
 　　进一步来看一下得到的两个新规律是否能直接用，对于2*i-1<=n-1 来说，当i=0时 ，2*i-1=-1，而2*i-1对应的是什么呢？是编号i的节点的左孩子的编号，显然没有编号为-1的节点，那我们试一试将2*i-1+1呢，当i=0时 ，2*i-1=0，编号为0的节点对应的左孩子显然不能是本身，于是在此基础上再加一，得到结论：
 
 2*i-1+2=2*i+1<=n-1
 
 2*i+2=2*i+2<=n-1
 */

+ (instancetype)createNodeTree:(NSArray *)array
{
    if (array.count<=0) {
        return nil;
    }
    int i;
    int n = (int)array.count;
    NSMutableArray * treesM = [NSMutableArray array];
    for (i = 0; i<n; i++) {
        int val = [array[i] intValue];
        TreeNode * p = [TreeNode val:val];
        [treesM addObject:p];
    }
    int m = n/2-1;
    for (i=0; i<=m; i++) {//原来的父亲节点范围为1~n/2,现在0~n/2-1,所以注意n/2要取到等
        if (2*i+1<=n-1) {
            TreeNode * p = treesM[i];
            TreeNode *temp = treesM[2*i+1]; //把第2*i+1个结点的地址赋给左孩子
            if (temp.val != -1) {
                p.left = temp;
            }
            
        }
        if (2*i+2<=n-1){
            TreeNode * p = treesM[i];
            TreeNode *temp = treesM[2*i+2]; //把第2*i+2个结点的地址赋给右孩子
            if (temp.val != -1) {
                p.right = temp;
            }
        }
    }
    return treesM.firstObject;
}


/**
 前序遍历的递推公式：
 preOrder(r) = print r->preOrder(r->left)->preOrder(r->right)
 
 中序遍历的递推公式：
 inOrder(r) = inOrder(r->left)->print r->inOrder(r->right)
 
 后序遍历的递推公式：
 postOrder(r) = postOrder(r->left)->postOrder(r->right)->print r
 */

/**
 前序遍历
 递归
 */
+ (void)preOrderTraverse:(TreeNode *)node
{
    if (!node) {
        return;
    }
    int val = node.val;
    [TreeNode preOrderTraverse:node.left];
    [TreeNode preOrderTraverse:node.right];
    NSLog(@"preOrder:%d",val);
}

/**
 前序遍历
 非递归
 依据前序遍历的顺序，优先訪问根结点。然后在訪问左子树和右子树。所以。对于随意结点node。第一部分即直接訪问之，之后在推断左子树是否为空，不为空时即反复上面的步骤，直到其为空。若为空。则须要訪问右子树。注意。在訪问过左孩子之后。须要反过来訪问其右孩子。所以，须要栈这样的数据结构的支持。对于随意一个结点node，详细过程例如以下：
 
 a)訪问之，并把结点node入栈。当前结点置为左孩子；
 
 b)推断结点node是否为空，若为空。则取出栈顶结点并出栈，将右孩子置为当前结点；否则反复a)步直到当前结点为空或者栈为空（能够发现栈中的结点就是为了訪问右孩子才存储的）

 */
+ (void)preOrder:(TreeNode *)node
{
    Stack * stack = [Stack new];
    TreeNode *p = node;
    while (p || !stack.isEmpty) {
        if (p) {
            NSLog(@"preOrder:%d",p.val);
            [stack push:p];
            p = p.left;
        } else {
            TreeNode *node = stack.pop;
            p = node.right;
        }
    }
}

+ (void)inOrder:(TreeNode *)node
{
    if (!node) {
        return;
    }
    
    [TreeNode inOrder:node.left];
    int val = node.val;
    NSLog(@"inOrder: %d",val);
    [TreeNode inOrder:node.right];
  
}

+ (void)postOrder:(TreeNode *)node
{
    if (node) {
        return;
    }
    [TreeNode postOrder:node.left];
    [TreeNode postOrder:node.right];
    int val = node.val;
    NSLog(@"postOrder: %d",val);
}

@end
