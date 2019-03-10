//
//  Queue.h
//  GLeetCode
//
//  Created by 张毅 on 2018/11/1.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Queue : NSObject
- (void)push:(id)object;
- (__kindof id)pop;
- (BOOL)isEmpty;
- (void)clean;
@end

NS_ASSUME_NONNULL_END
