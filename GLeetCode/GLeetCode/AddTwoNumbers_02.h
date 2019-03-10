//
//  AddTwoNumbers_02.h
//  GLeetCode
//
//  Created by 张毅 on 2018/11/1.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListNode.h"
NS_ASSUME_NONNULL_BEGIN

@interface AddTwoNumbers_02 : NSObject
/**
 给定两个非空链表来表示两个非负整数。位数按照逆序方式存储，它们的每个节点只存储单个数字。将两数相加返回一个新的链表。
 2.两数相加，https://leetcode-cn.com/problems/add-two-numbers/
 你可以假设除了数字 0 之外，这两个数字都不会以零开头。
 
 示例：
 
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807

 */
+ (ListNode *)addTwoNums:(ListNode *)l1 and:(ListNode *)l2;
@end

NS_ASSUME_NONNULL_END
