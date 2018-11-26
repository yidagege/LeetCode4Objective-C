//
//  ListNode.h
//  GLeetCode
//
//  Created by GIKI on 2018/11/13.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListNode : NSObject
@property (nonatomic, assign) int  val;
@property (nonatomic, strong) ListNode * next;

+ (instancetype)val:(int)val;

/**
 传入链表数组,可快速生成链表

 @param array <#array description#>
 @return <#return value description#>
 */
+ (instancetype)nexts:(NSArray *)array;

/**
 快速判断2个链表是否相等

 @param object <#object description#>
 @return <#return value description#>
 */
- (BOOL)isEqual:(id)object;
@end

NS_ASSUME_NONNULL_END
