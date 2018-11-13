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

+ (instancetype)nexts:(NSArray *)array;

- (BOOL)isEqual:(id)object;
@end

NS_ASSUME_NONNULL_END
