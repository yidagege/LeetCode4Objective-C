//
//  LengthOfLastWord_58.h
//  GLeetCode
//
//  Created by GIKI on 2018/11/18.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LengthOfLastWord_58 : NSObject
/**
 给定一个仅包含大小写字母和空格 ' ' 的字符串，返回其最后一个单词的长度。
 
 如果不存在最后一个单词，请返回 0 。
 
 说明：一个单词是指由字母组成，但不包含任何空格的字符串。
 
 示例:
 
 输入: "Hello World"
 输出: 5
 */
+ (int)lengthOfLastWord:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
