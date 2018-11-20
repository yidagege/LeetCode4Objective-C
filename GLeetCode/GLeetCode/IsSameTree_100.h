//
//  IsSameTree_100.h
//  GLeetCode
//
//  Created by GIKI on 2018/11/20.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TreeNode.h"
NS_ASSUME_NONNULL_BEGIN

@interface IsSameTree_100 : NSObject

/**
 给定两个二叉树，编写一个函数来检验它们是否相同。
 
 如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。
 
 示例 1:
 
 输入:       1         1
 / \       / \
 2   3     2   3
 
 [1,2,3],   [1,2,3]
 
 输出: true
 示例 2:
 
 输入:      1          1
 /           \
 2             2
 
 [1,2],     [1,null,2]
 
 输出: false
 */

+ (BOOL)isSameTree:(TreeNode*)p and:(TreeNode*)q;

@end

NS_ASSUME_NONNULL_END
