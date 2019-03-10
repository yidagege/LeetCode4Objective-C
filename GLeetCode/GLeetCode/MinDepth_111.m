//
//  MinDepth_111.m
//  GLeetCode
//
//  Created by 张毅 on 2018/10/1.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "MinDepth_111.h"

@implementation MinDepth_111

+ (int)minDepth:(TreeNode*)treeNode
{
    int depth = 0;
    if (treeNode) {
        int minLeft = [[self class] minDepth:treeNode.left];
        int minRight = [[self class] minDepth:treeNode.right];
        return 1+ MIN(minLeft, minRight);
    }
    return depth;
}

+ (int)kminD:(TreeNode *)treeNode{
    int dep = 0;
    if (treeNode) {
        int minleft = [self kminD:treeNode.left];
        int minright = [self kminD:treeNode.right];
        return 1+ MIN(minleft, minright);
    }
    return dep;
}


@end
