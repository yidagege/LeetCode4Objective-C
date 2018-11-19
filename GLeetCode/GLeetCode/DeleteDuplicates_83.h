//
//  DeleteDuplicates_83.h
//  GLeetCode
//
//  Created by GIKI on 2018/11/19.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListNode.h"
NS_ASSUME_NONNULL_BEGIN

@interface DeleteDuplicates_83 : NSObject

/**
 给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。
 
 示例 1:
 
 输入: 1->1->2
 输出: 1->2
 示例 2:
 
 输入: 1->1->2->3->3
 输出: 1->2->3
 */
+ (ListNode*)deleteDuplicates:(ListNode*)head;
@end

NS_ASSUME_NONNULL_END
