//
//  MinDepth_111.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/26.
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
@end
