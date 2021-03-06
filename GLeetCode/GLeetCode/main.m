//
//  main.m
//  GLeetCode
//
//  Created by 张毅 on 2018/11/1.
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
#import "LongestCommonPrefix_14.h"
#import "MergeTwoLists_21.h"
#import "RemoveDuplicates_26.h"
#import "SearchInsert_35.h"
#import "MaxSubArray_53.h"
#import "LengthOfLastWord_58.h"
#import "PlusOne_66.h"
#import "AddBinary_67.h"
#import "MySqrt_69.h"
#import "ClimbStairs_70.h"
#import "DeleteDuplicates_83.h"
#import "MergeTwoArray_88.h"
#import "TreeNode.h"
#import "IsSameTree_100.h"
#import "MaxDepth_104.h"
#import "LevelOrderBottom_107.h"
#import "SortedArrayToBST_108.h"
#import "IsBalanced_110.h"
#import "MinDepth_111.h"
#import "CodeString.h"
#import "CodeArray.h"
#import "CodeNode.h"
#import "ZChange_06.h"
#import "StringToNum_08.h"
#import "MaxArea_11.h"
#import "IntToRoman_12.h"
#import "RomanToInt_13.h"
#import "ThreeSum_15.h"
#import "threeSumClosest_16.h"

#import "LargestTimeFromDigits_949.h"

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
    } else {
        assert(false);
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
    } else {
        assert(false);
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
    } else {
        assert(false);
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
    NSArray * B =@[@3,@4,@9];
    float lo = [FindMedianSortedArrays_04 findMedianSortedArrays:A and:B];
    float temp = [FindMedianSortedArrays_04 findTopK:4 sortedArrays:A and:B];
    if (lo == 5) {
        NSLog(@"04-- FindMedianSortedArrays_04 success");
    } else {
        assert(false);
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
    NSString * string2 = [LongestPalindrome_05 longestPalindrome3:@"kksbababd"];
    NSLog(@"string");
}

/**
 06
 输入: "LEETCODEISHIRING" ,3
 输出: "LCIRETOESIIGEDHN"
 */
void zConvert(){
    NSString *origin = @"LEETCODEISHIRING";NSInteger numRows = 3;
    NSString * string2 = [ZChange_06 zConvert:numRows origin:origin];
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
    } else {
        assert(false);
    }
}

/**
 08
 输入: -123
 */
void StringToNum(){
    NSString *str = @"-2147483648";//@"-91283472332";//@"4193 with words";
    int val = [StringToNum_08 StringToNum:str];
    NSLog(@"StringToNum success");
}

/**
 09
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
    BOOL tf = [Palindrome_09 isPalindrome:1210121];
    if (tf) {
        NSLog(@"Palindrome_09 success");
    } else {
        assert(false);
    }
}

/**
 11
 输入: [1,8,6,2,5,4,8,3,7]
 输出: 49
 */
void MaxArea(){
    NSArray *data = @[@1,@8,@6,@2,@5,@4,@8,@3,@7];
    NSInteger val = [MaxArea_11 MaxArea:data];
    NSLog(@"MaxArea_11 success");
}

/**
 12
 输入: 129
 输出:CXXIX
 */
void IntToRoman(){
    NSInteger val = 12190;
    NSString *rel = [IntToRoman_12 IntToRoman:val];
    NSLog(@"IntToRoman_12 success");
}

/**
 13
 输入: CXXIX
 输出:129
 */
void RomanToInt(){
    NSString* val = @"CXXIX";
    NSInteger rel = [RomanToInt_13 RomanToInt:val];
    NSLog(@"RomanToInt_13 success");
}

/**
 14
 输入: ["flower","flow","flight"]
 输出: "fl"
 示例 2:
 
 输入: ["dog","racecar","car"]
 输出: ""
 解释: 输入不存在公共前缀。
 */
void LongestCommonPrefix() {
    NSString * str = [LongestCommonPrefix_14 longestCommonPrefix:@[@"flower",@"flow",@"flight"]];
    if ([str isEqualToString:@"fl"]) {
        NSLog(@"LongestCommonPrefix_14 success");
    } else {
        assert(false);
    }
}

/**
 15
 输入: @[@1,@2,@-1,@0,@-2]
 输出:
 */
void ThreeSum(){
    NSArray *sum = @[@1,@2,@-1,@0,@-2];
    NSMutableSet *re = [ThreeSum_15 ThreeSum:sum];
    NSLog(@"ThreeSum_15 success");
}

/**
 16
 输入: @[@1,@2,@-1,@0,@-2],target0
 输出:
 */
void threeSumClosest(){
    NSArray *sum = @[@1,@2,@-1,@0,@-2];
    NSInteger tar = 2;
    NSInteger re = [threeSumClosest_16 threeSumClosest:sum target:tar];
    NSLog(@"threeSumClosest success");

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
    if (loc == 2) {
        NSLog(@"strStr_28 success");
    } else {
        assert(false);
    }
}


/**
 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 */
void MergeTwoLists(){
//    MergeTwoLists_21
    NSArray * input = @[@1,@4,@5];
    NSArray * input2 = @[@2,@3,@9];
    NSArray * ountput = @[@1,@2,@3,@4,@5,@9];
    ListNode * node = [ListNode nexts:input];
    ListNode * node2 = [ListNode nexts:input2];
    ListNode * node3 = [ListNode nexts:ountput];
    ListNode * nodeO = [MergeTwoLists_21 mergeTwoLists:node and:node2];
    if ([node3 isEqual:nodeO]) {
        NSLog(@"MergeTwoLists_21 success");
    } else {
        assert(false);
    }
}

void RemoveDuplicates(){
    NSArray * array = @[@0,@0,@1,@1,@2,@2,@3,@3,@4,@4];
    NSMutableArray * arrayM = array.mutableCopy;
    int count = [RemoveDuplicates_26 removeDuplicates:arrayM];
    if(count == 5) {
        NSLog(@"RemoveDuplicates_26 success");
    } else {
        assert(false);
    }
}

/**
 输入: [1,3,5,6], 5
 输出: 2
 */
void SearchInsert(){
    
    int loc = [SearchInsert_35 searchInsert:@[@1,@3,@5,@6] target:5];
    if(loc == 2){
        NSLog(@"SearchInsert_35 success");
    } else {
        assert(false);
    }
}

/**
 输入: [-2,1,-3,4,-1,2,1,-5,4],
 输出: 6
 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
 */
void MaxSubArray(){
    int retval = [MaxSubArray_53 maxSubArray:@[@-2,@1,@-3,@4,@-1,@2,@1,@-5,@4]];
    if (retval == 6) {
        NSLog(@"MaxSubArray_53 success");
    } else {
        assert(false);
    }
}

void LengthOfLastWord(){
    int length = [LengthOfLastWord_58 lengthOfLastWord:@"hello world"];
    if (length == 5) {
        NSLog(@"LengthOfLastWord_58 success");
    } else {
        assert(false);
    }
}

void PlusOne(){
    NSArray * arr = [PlusOne_66 plusOne:@[@9,@9,@9]];
    if ([arr isEqual:@[@1,@0,@0,@0]]) {
        NSLog(@"PlusOne success");
    } else {
        assert(false);
    }
}

/**
 示例 1:
 
 输入: a = "11", b = "1"
 输出: "100"
 示例 2:
 
 输入: a = "1010", b = "1011"
 输出: "10101"

 */
void AddBinary(){
    NSString * retval = [AddBinary_67 addBinary:@"10101" and:@"1"];
    if ([retval isEqualToString:@"10101"]) {
        NSLog(@"AddBinary_67 success");
    } else {
//        assert(false);
    }
}

void MySqrt(){
    int sq = [MySqrt_69 mySqrt:8];
    if (sq == 2) {
        NSLog(@"mySqrt success");
    } else {
        assert(false);
    }
}

void ClimbStairs(){
    int n = [ClimbStairs_70 climbStairs:4];
    if (n == 5) {
        NSLog(@"ClimbStairs_70 success");
    } else {
        assert(false);
    }
}

void DeleteDuplicates() {
    ListNode * input = [ListNode nexts:@[@1,@1,@2,@3,@3]];
    ListNode * test = [ListNode nexts:@[@1,@2,@3]];
    ListNode * output = [DeleteDuplicates_83 deleteDuplicates:input];
    if ([test isEqual:output]) {
        NSLog(@"DeleteDuplicates_83 success");
    } else {
        assert(false);
    }
}

/**
 输入:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3
 
 输出: [1,2,2,3,5,6]
 */
void MergeTwoArray(){
    NSMutableArray *array1 = @[@1,@2,@3].mutableCopy; //,@0,@0,@0
    NSArray * array2 = @[@2,@5,@6];
    [MergeTwoArray_88 mergeTwoArray:array1 and:array2];
    if ([array1.copy isEqualTo:@[@1,@2,@2,@3,@5,@6]]) {
        NSLog(@"MergeTwoArray_88 successs");
    } else {
//        assert(false);
    }
}

void IsSameTree(){
    NSArray * array = @[@1,@2,@3,@4,@5];
    TreeNode * node = [TreeNode createNodeTree:array];
    TreeNode * node1 = [TreeNode createNodeTree:array];
    BOOL tf = [IsSameTree_100 isSameTree:node and:node1];
    if (tf) {
        NSLog(@"IsSameTree_100 success");
    } else {
        assert(false);
    }
}

/**
 示例：
 给定二叉树 [3,9,20,null,null,15,7]，
 
 3
 / \
 9  20
 /  \
 15   7
 返回它的最大深度 3 。
 */
void maxDepth(){
    NSArray * tree = @[@3,@9,@20,@-1,@-1,@15,@7];
    
    int depth = [MaxDepth_104 maxDepth:[TreeNode createNodeTree:tree]];
    if (depth != 3) {
        assert(false);
    }
}


/**
 给定二叉树 [3,9,20,-1,-1,15,7],
 
 3
 / \
 9  20
 /  \
 15   7
 返回其自底向上的层次遍历为：
 
 [
 [15,7],
 [9,20],
 [3]
 ]
 */
void LevelOrderBottom() {
    TreeNode * node = [TreeNode createNodeTree:@[@3,@9,@20,@-1,@-1,@15,@7]];
    NSArray * arrayBottom = [LevelOrderBottom_107 levelOrderBottom:node];
    NSLog(@"%@",arrayBottom);
    NSArray * arrayTop = [LevelOrderBottom_107 levelOrderTop:node];
    NSLog(@"%@",arrayTop);
}

void SortedArrayToBST(){
    TreeNode * temp = [SortedArrayToBST_108 sortedArrayToBST:@[@-10,@-3,@0,@5,@9]];
    [TreeNode inOrder:temp];
//    [TreeNode preOrder:temp];
//    [TreeNode postOrder:temp];
    NSLog(@"SortedArrayToBST success");
}

/*
 110
 **/
void isBalanced_110(){
    TreeNode * node = [TreeNode createNodeTree:@[@3,@9,@20,@-1,@-1,@15,@7]];
    BOOL isB = [IsBalanced_110 isBalanced:node];
}
/**
111
*/
void MinDepth() {
    TreeNode * node = [TreeNode createNodeTree:@[@3,@9,@20,@-1,@-1,@15,@7]];
    int depth = [MinDepth_111 minDepth:node];
    if (depth == 2) {
        NSLog(@"MinDepth_111 success");
    }
}


/*
949
*/
void LargestTimeFromDigits949() {
    NSArray *arr = @[@"5",@"8",@"3",@"1"];
    NSString *ttt = [LargestTimeFromDigits_949 largestTimeFromDigits:arr];
    NSLog(@"LargestTimeFromDigits_949 success");
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TwoNums();
        addTwoNums();
        LongestSubstring();
        FindMedianSortedArrays();
        LongestPalindrome();
        zConvert();
        ReverseNum();
        StringToNum();
        Palindrome();
        MaxArea();
        IntToRoman();
        RomanToInt();
        strStr();
        LongestCommonPrefix();
        ThreeSum();
        threeSumClosest();
        MergeTwoLists();
        RemoveDuplicates();
        SearchInsert();
        CFTimeInterval startTime = [[NSDate date] timeIntervalSince1970];
        MaxSubArray();
        CFTimeInterval endTime = [[NSDate date] timeIntervalSince1970];
        CFTimeInterval consumingTime = endTime - startTime;
        NSLog(@"耗时：%@", @(consumingTime*1000));
        LengthOfLastWord();
        PlusOne();
        AddBinary();
        MySqrt();
        ClimbStairs();
        DeleteDuplicates();
        MergeTwoArray();
        IsSameTree();
        maxDepth();
        LevelOrderBottom();
        SortedArrayToBST();
        MinDepth();
        isBalanced_110();
        
        LargestTimeFromDigits949();
        [CodeString stringTestEntrance];
        NSInteger count = [CodeString cubeStep:3 and:3];
        [CodeArray arrayTestEntrance];
        [CodeNode nodeTestEntrance];
    }
    return 0;
}
