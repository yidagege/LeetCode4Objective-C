//
//  TreeNode.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/20.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "TreeNode.h"

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
            TreeNode *temp = treesM[2*i+2]; //把第2*i+1个结点的地址赋给右孩子
            if (temp.val != -1) {
                p.right = temp;
            }
        }
    }
    return treesM.firstObject;
}
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
@end
