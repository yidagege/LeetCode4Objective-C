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
+ (instancetype)nexts:(NSArray *)array
{
    NSMutableArray * nodes = [NSMutableArray array];
    for (int i =1; i<array.count; i++) {
        int val = [array[i] intValue];
        TreeNode * node = [TreeNode val:val];
        [nodes addObject:node];
    }
    for (int i =0; i<array.count/2 -1; i++) {
        if (2*i+1<nodes.count) {
            // left
            
        }
    }
    return nil;
}
@end
