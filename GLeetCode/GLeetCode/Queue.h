//
//  Queue.h
//  GLeetCode
//
//  Created by GIKI on 2018/11/23.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Queue : NSObject
- (void)push:(id)object;
- (id)pop;
- (BOOL)isEmpty;
- (void)clean;
@end

NS_ASSUME_NONNULL_END
