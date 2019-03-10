//
//  PlusOne_66.m
//  GLeetCode
//
//  Created by 张毅 on 2018/10/1.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "PlusOne_66.h"

@implementation PlusOne_66
/**
 考虑进位.
 */
+ (NSArray*)plusOne:(NSArray *)array
{
    NSMutableArray * arrayM = array.mutableCopy;
    for (int i = arrayM.count-1; i>=0; i--) {
        if ([arrayM[i] intValue] < 9) {
            arrayM[i] = @([arrayM[i] intValue]+1);
            return arrayM.copy;
        }
        arrayM[i] = @(0);
    }
    [arrayM insertObject:@1 atIndex:0];
    return  arrayM.copy;
}

@end
