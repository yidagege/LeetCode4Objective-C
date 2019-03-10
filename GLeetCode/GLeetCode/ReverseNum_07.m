//
//  ReverseNum_02.m
//  GLeetCode
//
//  Created by 张毅 on 2018/10/1.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "ReverseNum_07.h"

@implementation ReverseNum_07

+ (int)reverseNum:(int)x
{
    int retval = 0;
    while (x != 0) {
        int reverse = retval *10 + x%10;
        if (reverse/10 != retval) {
            /// over limt
            return 0;
        }
        retval = reverse;
        x/=10;
    }
    return retval;
}



@end
