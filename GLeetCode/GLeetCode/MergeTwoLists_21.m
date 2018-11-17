//
//  MergeTwoLists_21.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/17.
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

+ (ListNode*) mergeTwoLists1:(ListNode*)l1 and:(ListNode*)l2
{
    if (l1 == nil) return l2;
    if (l2 == nil) return l1;
    ListNode * head;
    if (l1.val < l2.val) {
        head = l1;
        head = [MergeTwoLists_21 mergeTwoLists:l1.next and:l2];
    } else {
        head = l2;
        head = [MergeTwoLists_21 mergeTwoLists:l1 and:l2.next];
    }
    return head;
}

@end
