//
//  IsSameTree_100.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/20.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "IsSameTree_100.h"

@implementation IsSameTree_100

+ (BOOL)isSameTree:(TreeNode*)p and:(TreeNode*)q
{
    if (!p && !q) {
        return YES;
    }
    if (!p && q) {
        return NO;
    }
    if (p && !q) {
        return NO;
    }
    if (p.val != q.val) {
        return NO;
    }
    return  [IsSameTree_100 isSameTree:p.left and:q.left] &&  [IsSameTree_100 isSameTree:p.right and:q.right];
}
@end
