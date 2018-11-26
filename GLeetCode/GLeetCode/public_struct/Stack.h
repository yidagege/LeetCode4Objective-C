//
//  Stack.h
//  GLeetCode
//
//  Created by GIKI on 2018/11/23.
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
