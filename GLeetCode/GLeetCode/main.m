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
#import "LongestSubstring_03.h"
#import "FindMedianSortedArrays_04.h"
#import "LongestPalindrome_05.h"
#import "Palindrome_09.h"
#import "strStr_28.h"
#pragma mark - Test
/**
 01
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
 02
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
 03
 输入: "abcabcbb" / "pwwkew"
 输出: 3
 
 */
void LongestSubstring(){
    NSUInteger retval = [LongestSubstring_03 lengthOfLongestSubstring:@"pwwkew"];
    if (retval == 3) {
        NSLog(@"03--LongestSubstring_03 success");
    }
}

/**
 04
 nums1 = [1, 2]
 nums2 = [3, 4]
 
 中位数是 (2 + 3)/2 = 2.5
 */
void FindMedianSortedArrays(){
    NSArray * A = @[@2,@6,@23];
    NSArray * B =@[@3,@4,@(9)];
    float lo = [FindMedianSortedArrays_04 findMedianSortedArrays:A and:B];
    float temp = [FindMedianSortedArrays_04 findTopK:4 sortedArrays:A and:B];
    if (lo == 5) {
        NSLog(@"04-- FindMedianSortedArrays_04 success");
    }
}

/**
 05
 输入: "babad"
 输出: "bab"
 注意: "aba"也是一个有效答案。
 */
void LongestPalindrome(){
//    NSString * string = [LongestPalindrome_05 longestPalindrome:@"bababb"];
    LongestPalindrome_05 *object = [LongestPalindrome_05 new];
    NSString * string2 = [object longestPalindrome:@"aba"];
    NSLog(@"string");
}

/**
 07
 输入: 123
 输出: 321
 */
void ReverseNum(){
    int retval = [ReverseNum_07 reverseNum:-123];
    if (retval == -321) {
        NSLog(@"ReverseNum_07 success");
    }
}
/**
 输入: 121
 输出: true
 示例 2:
 
 输入: -121
 输出: false
 解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
 示例 3:
 
 输入: 10
 输出: false
 解释: 从右向左读, 为 01 。因此它不是一个回文数。
 */
void Palindrome(){
    BOOL tf = [Palindrome_09 isPalindrome:121121];
    if (tf) {
        NSLog(@"Palindrome_09 success");
    }
}

/**
 示例 1:
 输入: haystack = "hello", needle = "ll"
 输出: 2
 示例 2:
 输入: haystack = "aaaaa", needle = "bba"
 输出: -1
 */
void strStr(){
    int loc = [strStr_28 str:@"hello" Str:@"ll"];
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TwoNums();
        addTwoNums();
        LongestSubstring();
        FindMedianSortedArrays();
//        LongestPalindrome();
        ReverseNum();
        Palindrome();
        strStr();
    }
    return 0;
}
