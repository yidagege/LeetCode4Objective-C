//
//  MergeTwoArray_88.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/19.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "MergeTwoArray_88.h"

@implementation MergeTwoArray_88

+ (void)mergeTwoArray:(NSMutableArray*)arr1 and:(NSArray*)arr2
{
    int index1 = (int)arr1.count-1;
    int index2 = (int)arr2.count-1;
    int indexN = (int)arr1.count+(int)arr2.count-1;
    while (index1 > 0 && index2 > 0) {
        if (arr1[index1]>arr2[index2]) {
            [arr1 insertObject:arr1[index1] atIndex:indexN];
            indexN -- ;
            index1 --;
        } else {
            
            [arr1 insertObject:arr2[index2] atIndex:indexN];
            indexN -- ;
            index2 --;
//            arr1[indexN--] = arr2[index2--];
        }
    }
    while (index2 >= 0) {
        arr1[indexN--] = arr2[index2--];
    }
    
}
@end
