//
//  IntToRoman_12.m
//  GLeetCode
//
//  Created by zhangyi35 on 2019/2/11.
//  Copyright © 2019年 GIKI. All rights reserved.
//

#import "IntToRoman_12.h"

@implementation IntToRoman_12

+ (NSString *)IntToRoman:(NSInteger)num{
    NSArray *symbols = @[@"M",@"CM",@"D",@"CD",@"C",@"XC",@"L",@"XL",@"X",@"IX",@"V",@"IV",@"I"];
    NSArray *values =  @[@1000,@900,@500,@400,@100,@90,@50,@40,@10,@9,@5,@4,@1];
    NSMutableString *result = [NSMutableString new];
    
    for(int i=0; num!=0; i++){
        while(num >= [values[i] integerValue]){
            num -= [values[i] integerValue];
            [result appendString:symbols[i]];
        }
    }
    return result;
}




@end
