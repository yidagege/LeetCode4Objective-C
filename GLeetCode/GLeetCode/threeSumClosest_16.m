//
//  threeSumClosest_16.m
//  GLeetCode
//
//  Created by zhangyi35 on 2019/2/14.
//  Copyright © 2019年 GIKI. All rights reserved.
//

#import "threeSumClosest_16.h"

@implementation threeSumClosest_16

+ (NSInteger)threeSumClosest:(NSArray *)nums target:(NSInteger)target{
    
    NSInteger len = nums.count;
    NSInteger a = 0;
    NSInteger b = 1;
    NSInteger c = 2;
    if (len < 3)
    {
        return 0;
    }
    NSInteger firstNum = [nums[a] intValue] + [nums[b] intValue] + [nums[c] intValue];
    NSInteger mintarget = labs(firstNum - target);
    for (NSInteger a = 0; a < len - 2; a++)
    {
        NSInteger b = a + 1;
        NSInteger c = len - 1;
        while (b < c)
        {
            NSInteger secondSum = [nums[a] intValue] + [nums[b] intValue] + [nums[c] intValue];
            NSInteger temp = labs(secondSum - target);
            if (temp < mintarget)
            {
                firstNum = secondSum;
                mintarget = temp;
            }
            if (secondSum > target)
            {
                c--;
            }
            else if (secondSum < target)
            {
                b++;
            }
            else
            {
                return target;
            }
        }
    }
    return firstNum;
}

@end
