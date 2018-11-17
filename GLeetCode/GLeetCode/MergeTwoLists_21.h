//
//  MergeTwoLists_21.h
//  GLeetCode
//
//  Created by GIKI on 2018/11/17.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListNode.h"
NS_ASSUME_NONNULL_BEGIN

@interface MergeTwoLists_21 : NSObject
/**
 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 
 示例：
 
 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 */
+ (ListNode*) mergeTwoLists:(ListNode*)l1 and:(ListNode*)l2;

@end

NS_ASSUME_NONNULL_END
