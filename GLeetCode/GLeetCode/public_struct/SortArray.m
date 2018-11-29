//
//  SortArray.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/27.
//  Copyright © 2018 GIKI. All rights reserved.
//

#import "SortArray.h"

@implementation SortArray

/**
 冒泡排序

 @param array <#array description#>
 */
+ (void)sortBubbling:(NSMutableArray *)array
{
    for (int i =0; i<array.count; i++) {
        for (int j =0 ; j<array.count-i; j++) {
            if ([array[j] intValue]> [array[j+1] intValue]) {
                id temp = array[j];
                array[j] = array[j+1];
                array[j+1] = temp;
            }
        }
    }
}

/**
 冒泡排序优化写法
 没有数据交换时,提前退出循环.
 @param array <#array description#>
 */
+ (void)sortBubblingBetter:(NSMutableArray *)array
{
    for (int i =0; i<array.count; i++) {
        /// 设置提前结束冒泡循环的标志位
        BOOL flag = NO;
        for (int j =0 ; j<array.count-i; j++) {
            if ([array[j] intValue]> [array[j+1] intValue]) {
                id temp = array[j];
                array[j] = array[j+1];
                array[j+1] = temp;
                flag = YES; /// 有数据交换
            }
        }
        if (!flag) { /// 没有数据交换提前退出
            break;
        }
    }
}


/**
 插入排序
 时间复杂度 O(n^2)，最好情况下是 O(n)，空间复杂度是 O(1)，交换次数
 @param array <#array description#>
 */
+ (void)sortInsert:(NSMutableArray *)array
{
    for (int i =1 ; i<array.count; i++) {
        int val = [array[i] intValue];
        int j = i-1;
        for (; j>=0; j--) {
            if ([array[j] intValue] > val) {
                array[j+1] = array[j];
            } else {
                break;
            }
        }
        array[j+1] = @(val);
    }
}

/**
 选择排序
 每一趟从待排序的记录中选出最小的元素，顺序放在已排好序的序列最后，直到全部记录排序完毕。
 @param array <#array description#>
 */
+ (void)sortSelection:(NSMutableArray*)array
{
    for (int i = 0; i<array.count; i++) {
        int k = i;
        for (int j =i+1; j<array.count; j++) {
            if ([array[k] intValue] > [array[j] intValue]) {
                k = j;
            }
        }
        if (k != i) {
            id temp = array[i];
            array[i] = array[k];
            array[k] = temp;
        }
    }
}

/**
 快速排序
 分治思想,先分区,在处理子问题
 O(nlogn) 最坏: O(n2)
 处理过程从上自下,先分区,在处理子问题. 原地排序
 递推公式：
 quick_sort(p…r) = quick_sort(p…q-1) + quick_sort(q+1, r)
 终止条件：
 p >= r
 @param array <#array description#>
 */
+ (void)sortFast:(NSMutableArray *)array
{
    if (array.count <= 1) {
        return;
    }
    [[self class] sortFast:array begin:0 end:(int)array.count-1];
}

+ (void)sortFast:(NSMutableArray *)array begin:(int)begin end:(int)end
{
    if (begin >= end) {
        return;
    }
    int k = [[self class] partitionFast:array begin:begin end:end];
    [[self class] sortFast:array begin:begin end:k];
    [[self class] sortFast:array begin:k+1 end:end];
}

/**
 快排原地分区函数
 partition(A, p, r) {
 pivot := A[r]
 i := p
 for j := p to r-1 do {
 if A[j] < pivot {
 swap A[i] with A[j]
 i := i+1
 }
 }
 swap A[i] with A[r]
 return i
 
 */
+ (int)partitionFast:(NSMutableArray *)array begin:(int)begin end:(int)end
{
     /*
    int pivot = [array[end] intValue];
    int i = begin;
    for (int j =begin; j<end; j++) {
        if ([array[j] intValue]<pivot) {
            array[i] = array[j];
            i++;
        }
    }
    array[i] = array[end];
    return i;
        */
    int i = begin,j=end;
    int temp = [array[begin] intValue];
    while (i<j) {
        while (i<j && temp<=[array[j] intValue]) {
            j--;
        }
        array[i] = array[j];
        
        while (i<j && temp>=[array[i] intValue]) {
            i++;
        }
        array[j] = array[i];
    }
    array[i] = @(temp);
    return i;

}

#pragma mark - old

//希尔排序
//例如希尔增量时间复杂度为O(n²)，而Hibbard增量的希尔排序的时间复杂度为O(  )，希尔排序时间复杂度的下界是n*log2n。
+(void)sortingForShellWithArray:(NSMutableArray *)array{
    int dk = (int)(array.count-1)/2;
    while (dk>=1) {
        [[self class] shellSortingWithArray:array startIndex:dk];
        dk = dk/2;
    }
}
+(void)shellSortingWithArray:(NSMutableArray *)array startIndex:(int)dk{
    for (int x = 0; x < dk; x++) {
        for (int i = x + dk; i<=array.count-1; i+=dk) {
            if (array[i]<array[i-dk]) {
                int j = i-dk;
                id temp = array[i];
                array[i] = array[i - dk];
                while (j>=0&&temp<array[j]) {
                    array[j+dk] = array[j];
                    j-=dk;
                }
                array[j+dk] = temp;
            }
        }
    }
}


//堆排序
//时间复杂度 O(nlog2(n))
+(void)sortingForHeapWithArray:(NSMutableArray *)array{
    [[self class]  heapSort:array len:array.count];
}

+ (void)heapSort:(NSMutableArray *)heapList len:(NSInteger)len{
    //建立堆，从最底层的父节点开始
    NSLog(@"%@", heapList);
    for(NSInteger i = (heapList.count/2 -1); i>=0; i--)
        [[self class]  adjustHeap:heapList location:i len:heapList.count];
    
    for(NSInteger i = heapList.count -1; i >= 0; i--){
        //R[N] move EndLocation
        NSInteger maxEle = ((NSString *)heapList[0]).integerValue;
        heapList[0] = heapList[i];
        heapList[i] = @(maxEle).stringValue;
        
        [[self class]  adjustHeap:heapList location:0 len:i];
    }
}

+ (void)adjustHeap:(NSMutableArray *)heapList location:(NSInteger)p len:(NSInteger)len{
    NSInteger curParent = ((NSString *)heapList[p]).integerValue;
    NSInteger child = 2*p + 1;
    while (child < len) {
        //left < right
        if (child+1 < len && ((NSString *)heapList[child]).integerValue < ((NSString *)heapList[child+1]).integerValue) {
            child ++;
        }
        if (curParent < ((NSString *)heapList[child]).integerValue) {
            heapList[p] = heapList[child];
            p = child;
            child = 2*p + 1;
        }
        else
            break;
    }
    heapList[p] = @(curParent).stringValue;
}


+ (void)sortingForMergeWithArray:(NSMutableArray *)array {
    [self sortingForMergeWithArray:array standbyArray:[NSMutableArray arrayWithCapacity:array.count] startIndex:0 endIndex:array.count - 1];
}

//归并排序
+ (void)sortingForMergeWithArray:(NSMutableArray *)array standbyArray:(NSMutableArray *)newArray startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex{
    
    NSInteger middle;
    if (startIndex<endIndex) {
        
        middle = (startIndex +endIndex)/2;
        [[self class]  sortingForMergeWithArray:array standbyArray:newArray startIndex:startIndex endIndex:middle];
        [[self class]  sortingForMergeWithArray:array standbyArray:newArray startIndex:middle+1 endIndex:endIndex];
        
        NSInteger i = startIndex,
        j = middle+1,
        k = startIndex;
        
        while (i!=middle+1 && j!=endIndex +1) {
            if (array[i]>=array[j]) {
                newArray[k++] = array[j++];
            }else{
                newArray[k++] = array[i++];
            }
        }
        while (i!=middle+1) {
            newArray[k++] = array[i++];
        }
        while (j!=endIndex+1) {
            newArray[k++] = array[j++];
        }
        for (i = startIndex; i<=endIndex; i++) {
            array[i] = newArray[i];
        }
    }
}
@end
