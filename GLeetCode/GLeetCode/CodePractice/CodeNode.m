//
//  CodeNode.m
//  GLeetCode
//
//  Created by 张毅 on 2018/10/1.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "CodeNode.h"
#import "ListNode.h"

@implementation CodeNode


+ (void)nodeTestEntrance
{
    ListNode * node01 = [ListNode nexts:@[@1,@2,@3,@4,@5]];
    ListNode * node02 = [ListNode nexts:@[@1,@2,@3,@4,@5]];
    ListNode * testNode = [ListNode nexts:@[@5,@4,@3,@2,@1]];
    ListNode * node1 = [[self class] reverseRecursive:node01];
    ListNode * node2 = [[self class] reverseEnums:node02];
    if ([node1 isEqual:node2] && [node1 isEqual:testNode] && [node2 isEqual:testNode]) {
        NSLog(@"reverseEnums");
    }
}
/**
 1,合并两个有序链表
 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 
 示例：
 
 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4

 */

+ (ListNode*) mergeTwoLists:(ListNode*)l1 and:(ListNode*)l2
{
    ListNode * head = [ListNode val:0];
    ListNode * retval = head;
    while (l1!=nil ||  l2 != nil) {
        if (l1.val < l2.val) {
            head.next = l1;
            l1 = l1.next;
        } else {
            head.next = l2;
            l2 = l2.next;
        }
        head = head.next;
    }
    if (l1!=nil) {
        head.next = l1;
    }
    if (l2!=nil) {
        head.next = l2;
    }
    
    return retval.next;
}

/**
 2,反转链表
 反转一个单链表。
 
 示例:
 
 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
 进阶:
 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？
 */

+ (ListNode*)reverseEnums:(ListNode *)node
{
    ListNode *pre = nil;
    ListNode *next = nil;
    while (node != nil) {
        next = node.next;
        node.next = pre;
        pre = node;
        node = next;
    }
    return pre;
    
    ListNode *new = nil;
    ListNode *knext = nil;
    while (node) {
        knext = node.next;
        node.next = new;
        new = node;
        node = knext;
    }
    return new;
}

+ (ListNode*)reverseRecursive:(ListNode *)node
{
    if (!node || !node.next) {
        return node;
    }
    ListNode * temp = [[self class] reverseRecursive:node.next];
    node.next.next = node;
    node.next = nil;
    return temp;
}

/**
 3,两数相加
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
 
 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
 
 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 
 示例：
 
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 */

/**
 4,排序链表
 在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序。
 
 示例 1:
 
 输入: 4->2->1->3
 输出: 1->2->3->4
 示例 2:
 
 输入: -1->5->3->4->0
 输出: -1->0->3->4->5
 */

/**
 5,环形链表 II
 给定一个链表，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。
 
 说明：不允许修改给定的链表。
 
 进阶：
 你是否可以不用额外空间解决此题？
 */

/**
 6,相交链表
 编写一个程序，找到两个单链表相交的起始节点。
 
 
 
 例如，下面的两个链表：
 
 A:          a1 → a2
                    ↘
                    c1 → c2 → c3
                    ↗
 B:     b1 → b2 → b3
 在节点 c1 开始相交。
 
 
 
 注意：
 
 如果两个链表没有交点，返回 null.
 在返回结果后，两个链表仍须保持原有的结构。
 可假定整个链表结构中没有循环。
 程序尽量满足 O(n) 时间复杂度，且仅用 O(1) 内存。
 
 */

/**
 7,  合并K个排序链表
 合并 k 个排序链表，返回合并后的排序链表。请分析和描述算法的复杂度。
 
 示例:
 
 输入:
 [
 1->4->5,
 1->3->4,
 2->6
 ]
 输出: 1->1->2->3->4->4->5->6
 */

/**
 8,二叉树的最近公共祖先
 给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。
 
 百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”
 
 例如，给定如下二叉树:  root = [3,5,1,6,2,0,8,null,null,7,4]
 
 _______3______
 /              \
 ___5__          ___1__
 /      \        /      \
 6      _2       0       8
 /  \
 7   4
 示例 1:
 
 输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 输出: 3
 解释: 节点 5 和节点 1 的最近公共祖先是节点 3。
 示例 2:
 
 输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
 输出: 5
 解释: 节点 5 和节点 4 的最近公共祖先是节点 5。因为根据定义最近公共祖先节点可以为节点本身。
 说明:
 
 所有节点的值都是唯一的。
 p、q 为不同节点且均存在于给定的二叉树中。
 */

/**
 9,二叉树的锯齿形层次遍历
 给定一个二叉树，返回其节点值的锯齿形层次遍历。（即先从左往右，再从右往左进行下一层遍历，以此类推，层与层之间交替进行）。
 
 例如：
 给定二叉树 [3,9,20,null,null,15,7],
 
 3
 / \
 9  20
 /  \
 15   7
 返回锯齿形层次遍历如下：
 
 [
 [3],
 [20,9],
 [15,7]
 ]
 */
@end
