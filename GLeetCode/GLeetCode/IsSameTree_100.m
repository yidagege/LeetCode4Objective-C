//
//  IsSameTree_100.m
//  GLeetCode
//
//  Created by 张毅 on 2018/10/1.
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

+ (BOOL)isTheSame:(TreeNode *)p and:(TreeNode *)q{
    if (!p && !q) {
        return YES;
    }
    if (!p && q) {
        return NO;
    }
    if (p&&!q) {
        return NO;
    }
    if (p.val != q.val) {
        return NO;
    }
    return [self isTheSame:p.left and:q.left] && [self isTheSame:p.right and:q.right];
}

@end
