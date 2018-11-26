//
//  ListNode.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/13.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "ListNode.h"

@implementation ListNode

+ (instancetype)val:(int)val
{
    ListNode * node = [ListNode new];
    node.val = val;
    return node;
}

+ (instancetype)nexts:(NSArray *)array
{
    ListNode * node = [ListNode new];
    ListNode * tempNode = node;
    for (int i = 0 ; i<array.count; i++) {
        NSNumber * obj = array[i];
        if (i == 0) {
            tempNode.val = [obj intValue];
        } else {
            ListNode  *nodeT = [ListNode val:obj.intValue];
            while (tempNode.next) {
                tempNode = tempNode.next;
            }
            tempNode.next = nodeT;
        }
    }

    return node;
}

- (BOOL)isEqual:(ListNode *)object
{
    ListNode * l1 = self;
    ListNode * l2 = object;
    while(l1 && l2 && l1.val==l2.val){
        l1 = l1.next;
        l2 = l2.next;
    }
    if ((l1.val == l2.val) && !l1.next &&!l2.next) {
        return YES;
    }
    return NO;
}
@end
