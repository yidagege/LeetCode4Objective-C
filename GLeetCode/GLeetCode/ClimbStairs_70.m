//
//  ClimbStairs_70.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/19.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "ClimbStairs_70.h"

@implementation ClimbStairs_70
/**
 输入： 2
 1.  1 阶 + 1 阶
 2.  2 阶

 n = 1;
 f(n) = 1;
 n = 2;
 f(n) = 2;
 n>2
 f(n) = f(n-2)+f(n-1)
 */
+ (int)climbStairs:(int)n
{
    if (n==1) {
        return 1;
    }
    if (n==2) {
        return 2;
    }
    int n1 = [ClimbStairs_70 climbStairs:n-1];
    int n2 = [ClimbStairs_70 climbStairs:n-2];
    return n1+n2;
}

+ (int)kclimb:(int)n{
    if (n == 1) {
        return 1;
    }
    if (n == 2) {
        return 2;
    }
    int n1 = [self kclimb:n-1];
    int n2 = [self kclimb:n-2];
    return n1+n2;
}

@end
