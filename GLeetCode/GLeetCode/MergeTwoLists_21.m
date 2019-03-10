//
//  MergeTwoLists_21.m
//  GLeetCode
//
//  Created by 张毅 on 2018/10/1.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "MergeTwoLists_21.h"

@implementation MergeTwoLists_21

/**
 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 
 示例：
 
 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 */

+ (ListNode*) mergeTwoLists:(ListNode*)l1 and:(ListNode*)l2
{
    ListNode * head = [ListNode val:0];
    ListNode *retval = head;
    while (l1!=nil && l2!=nil) {
        if (l1.val < l2.val) {
            head.next = l1;
            l1 = l1.next;
        } else {
            head.next = l2;
            l2 = l2.next;
        }
        head = head.next;
    }
    if (l1 != nil)  head.next = l1;
    if (l2 != nil)  head.next = l2;
    return retval.next;
}

/**
 递归调用
 */
+ (ListNode*) mergeTwoLists2:(ListNode*)l1 and:(ListNode*)l2
{
    if (l1 == nil) return l2;
    if (l2 == nil) return l1;
    if (l1.val < l2.val) {
        l1.next = [MergeTwoLists_21 mergeTwoLists:l1.next and:l2];
        return l1;
    } else {
        l2.next = [MergeTwoLists_21 mergeTwoLists:l1 and:l2.next];
        return l2;
    }
}

@end
