//
//  TreeNode.h
//  GLeetCode
//
//  Created by GIKI on 2018/11/20.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TreeNode : NSObject
@property (nonatomic, assign) int  val;
@property (nonatomic, strong) TreeNode * left;
@property (nonatomic, strong) TreeNode * right;

+ (instancetype)val:(int)val;

/**
 传入数组,可快速生成树
 
 @param array [1,2,3]

 @return
  1
 / \
 2 3
 @param array [1,2,3,4,-1,5,6]
 -1表示空节点
 @return
 1
 / \
 2 3
 /  / \
 4  5  6
 */
+ (instancetype)createNodeTree:(NSArray *)array;

+ (void)preOrder:(TreeNode *)node;
+ (void)inOrder:(TreeNode *)node;
+ (void)postOrder:(TreeNode *)node;

@end

NS_ASSUME_NONNULL_END
