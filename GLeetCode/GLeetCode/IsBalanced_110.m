//
//  IsBalanced_110.m
//  GLeetCode
//
//  Created by 张毅 on 2018/10/1.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "IsBalanced_110.h"

@implementation IsBalanced_110
+ (BOOL)isBalanced:(TreeNode*)treeNode
{
    if(treeNode==NULL)
    {
        return true ;
    }
    int depth=0;
    return [self _isBl:treeNode dep:&depth];
    return _isBalanced(treeNode,&depth);
    
}

//递归
BOOL _isBalanced(TreeNode* root,int* pdepth)
{
    if(root==NULL)
    {
        *pdepth=0;
        return true;
    }
    int leftdepth = 0;
    int rightdepth = 0;
    
    if( _isBalanced(root.left,&leftdepth)
       && _isBalanced(root.right,&rightdepth)
       && abs(leftdepth-rightdepth)<2)
    {
        *pdepth = (leftdepth > rightdepth) ? leftdepth+1 : rightdepth+1;
        return true;
    }
    else
    {
        return false;
    }
}

+ (BOOL)_isBl:(TreeNode *)node dep:(int *)depth{
    if (node == nil) {
        *depth = 0;
        return YES;
    }
    int leftdepth = 0;
    int rightdepth = 0;
    if ([self _isBl:node.left dep:&leftdepth] && [self _isBl:node.right dep:&rightdepth] && abs(leftdepth-rightdepth)<2) {
        *depth = (leftdepth > rightdepth) ? leftdepth + 1 : rightdepth + 1;
        return YES;
    }else{
        return NO;
    }
}



@end
