//
//  AddBinary_67.h
//  GLeetCode
//
//  Created by 张毅 on 2018/10/1.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddBinary_67 : NSObject

/**
 给定两个二进制字符串，返回他们的和（用二进制表示）。
 
 输入为非空字符串且只包含数字 1 和 0。
 
 示例 1:
 
 输入: a = "11", b = "1"
 输出: "100"
 示例 2:
 
 输入: a = "1010", b = "1011"
 输出: "10101"

 */
+(NSString *)addBinary:(NSString *)str1 and:(NSString*)str2;
@end

NS_ASSUME_NONNULL_END
