//
//  DeleteDuplicates_83.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/19.
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
@end
