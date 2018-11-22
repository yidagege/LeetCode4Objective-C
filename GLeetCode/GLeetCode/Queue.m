//
//  Queue.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/23.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "Queue.h"

@interface Queue ()
{
    NSMutableArray* _queue;
}
@end
@implementation Queue

- (instancetype)init
{
    self = [super init];
    if (self) {
        _queue = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)push:(id)object
{
    [_queue addObject:object];
}

- (id)pop
{
    if ([self isEmpty]) {
        return nil;
    }
    
    id value = _queue.firstObject;
    [_queue removeObjectAtIndex:0];
    return value;
}

- (BOOL)isEmpty
{
    return _queue.count == 0;
}

- (void)clean
{
    [_queue removeAllObjects];
}
@end
