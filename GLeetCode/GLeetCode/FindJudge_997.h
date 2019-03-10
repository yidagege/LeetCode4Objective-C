//
//  FindJudge_997.h
//  GLeetCode
//
//  Created by 张毅 on 2019/3/10.
//  Copyright © 2019年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/*
 997. 找到小镇的法官,https://leetcode-cn.com/problems/find-the-town-judge/
 在一个小镇里，按从 1 到 N 标记了 N 个人。传言称，这些人中有一个是小镇上的秘密法官。
 
 如果小镇的法官真的存在，那么：
 
 小镇的法官不相信任何人。
 每个人（除了小镇法官外）都信任小镇的法官。
 只有一个人同时满足属性 1 和属性 2 。
 给定数组 trust，该数组由信任对 trust[i] = [a, b] 组成，表示标记为 a 的人信任标记为 b 的人。
 
 如果小镇存在秘密法官并且可以确定他的身份，请返回该法官的标记。否则，返回 -1。
**/
@interface FindJudge_997 : NSObject

@end

NS_ASSUME_NONNULL_END
