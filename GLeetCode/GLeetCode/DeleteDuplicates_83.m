//
//  DeleteDuplicates_83.m
//  GLeetCode
//
//  Created by 张毅 on 2018/10/1.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "DeleteDuplicates_83.h"

@implementation DeleteDuplicates_83

+ (ListNode*)deleteDuplicates:(ListNode*)head
{
    ListNode * current = head;
    while (current && current.next) {
        if (current.next.val == current.val) {
            current.next = current.next.next;
        } else {
            current = current.next;
        }
    }
    return head;
}

+ (ListNode*)kdeleteDuplicates:(ListNode*)head{
    ListNode *current = head;
    while (current && current.next) {
        if (current.next.val == current.val) {
            current.next = current.next.next;
        }else{
            current = current.next;
        }
    }
    return head;
}


@end
