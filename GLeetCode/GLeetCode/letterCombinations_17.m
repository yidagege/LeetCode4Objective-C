//
//  letterCombinations_17.m
//  GLeetCode
//
//  Created by zhangyi35 on 2019/2/14.
//  Copyright © 2019年 GIKI. All rights reserved.
//

#import "letterCombinations_17.h"

@implementation letterCombinations_17

- (NSArray*)letterCombinations:(NSString *)num{
    NSMutableArray *arr = [NSMutableArray new];
    NSDictionary *charactorDic = @{@"2":@"abc",@"3":@"def",@"4":@"ghi",@"5":@"jkl",@"6":@"mno",@"7":@"pqrs",@"8":@"tuv",@"9":@"wxyz"};
//    [str characterAtIndex:(i-1)
    NSInteger len = num.length;
    for (NSInteger i = 0; i < len; i++) {
        NSString *tem = [NSString stringWithUTF8String:[num characterAtIndex:i]];
        NSString *string = [charactorDic objectForKey:tem];

        
    }
    
    return arr;
}

//def letterCombinations(self, digits):
//nums = {'2':'abc', '3':'def', '4':'ghi', '5':'jkl', '6':'mno', '7':'pqrs', '8':'tuv', '9':'wxyz'}
//result = []
//for i in range(len(digits)):
//if result == []:
//result.extend([x for x in nums[digits[i]]])
//tmp = result
//else:
//result = [[x+y for y in nums[digits[i]]] for x in tmp]
//result = reduce(operator.add, result)  #多维数组压成一维
//tmp = result
//return result

@end
