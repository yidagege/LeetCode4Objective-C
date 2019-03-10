//
//  Stack.h
//  GLeetCode
//
//  Created by 张毅 on 2018/10/1.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Stack : NSObject

- (id)initWithCapacity:(NSUInteger)count;
- (BOOL)isEmpty;
- (id)top;
- (NSUInteger)size;
- (BOOL)push:(id)obj;
- (id)pop;

@end

NS_ASSUME_NONNULL_END
