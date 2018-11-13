//
//  main.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/13.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TwoNum_01.h"
#import "ReverseNum_07.h"
#import "AddTwoNumbers_02.h"
#pragma mark - Test
/**
 给定 nums = [2, 7, 11, 15], target = 9
 
 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 */
void TwoNums() {
    NSArray * nums = @[@(2),@(7),@(11),@(15)];
    NSInteger target = 9;
    NSArray * testValue = [TwoNum_01 twoNums:nums target:target];
    if (testValue && [testValue isEqualToArray:@[@(0),@(1)]]) {
        NSLog(@"01--TwoNums_01 success");
    }
}

/**
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 */
void addTwoNums(){
    ListNode * l1 = [ListNode nexts:@[@(2),@(4),@(3)]];
    ListNode * l2 = [ListNode nexts:@[@(5),@(6),@(4)]];
    ListNode * test = [ListNode nexts:@[@(7),@(0),@(8)]];
    ListNode * retval = [AddTwoNumbers_02 addTwoNums:l1 and:l2];
    if ([test isEqual:retval]) {
        NSLog(@"02--addTwoNums_02 success");
    }
}

/**
 输入: 123
 输出: 321
 */
void ReverseNum(){
    int retval = [ReverseNum_07 reverseNum:-123];
    if (retval == -321) {
        NSLog(@"ReverseNum_07 success");
    }
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TwoNums();
        addTwoNums();
        ReverseNum();
    }
    return 0;
}
