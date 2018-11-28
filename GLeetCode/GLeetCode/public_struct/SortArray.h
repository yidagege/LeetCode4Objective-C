//
//  SortArray.h
//  GLeetCode
//
//  Created by GIKI on 2018/11/27.
//  Copyright © 2018 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SortArray : NSObject
//插入排序
//时间复杂度 O(n^2)，最好情况下是 O(n)，空间复杂度是 O(1)，交换次数
+ (void)sortingForInsertWithArray:(NSMutableArray *)array;
/// 选择排序
+ (void)sortingForSelectWithArray:(NSMutableArray *)array;
@end

NS_ASSUME_NONNULL_END
