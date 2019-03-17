//
//  LargestTimeFromDigits_949.m
//  GLeetCode
//
//  Created by 张毅 on 2019/3/10.
//  Copyright © 2019年 GIKI. All rights reserved.
//

#import "LargestTimeFromDigits_949.h"

@implementation LargestTimeFromDigits_949

//0-2,0-9(0-3),0-5,0-9
+ (NSString *)largestTimeFromDigits:(NSArray *)nums{
    if (!nums && nums.count != 4) {
        return @"";
    }
    NSMutableArray *originNums = nil;

    NSString *time = @"";
    for (NSInteger i = 0; i < nums.count; i ++) {
        
        for (NSInteger k = 0; k < nums.count && k != i; k ++) {
            if ([nums[i] integerValue] * 10 + [nums[k] integerValue] <= 23) {
                originNums = [NSMutableArray arrayWithArray:nums];
                [originNums removeObject:nums[i]];
                [originNums removeObject:nums[k]];
                if ([[originNums firstObject] integerValue] * 10 + [[originNums lastObject] integerValue] <= 59) {
                    NSInteger tmp = [nums[i] integerValue] * 1000 + [nums[k] integerValue] * 100 + [[originNums firstObject] integerValue] * 10 + [[originNums lastObject] integerValue];
                    if (tmp > [time integerValue]) {
                        time = [NSString stringWithFormat:@"%zd",tmp];
                    }
                }
                if ([[originNums lastObject] integerValue] * 10 + [[originNums firstObject] integerValue] <= 59) {
                    NSInteger tmp = [nums[i] integerValue] * 1000 + [nums[k] integerValue] * 100 + [[originNums lastObject] integerValue] * 10 + [[originNums firstObject] integerValue];
                    if (tmp > [time integerValue]) {
                        time = [NSString stringWithFormat:@"%zd",tmp];
                    }
                }
            }
            
        }
    }
    if (time.length == 4) {
        NSMutableString *kt = [NSMutableString stringWithString:time];
        [kt insertString:@":" atIndex:2];
        return kt;
    }
    
    return time;
}




@end
