//
//  SortArray.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/27.
//  Copyright © 2018 GIKI. All rights reserved.
//

#import "SortArray.h"

@implementation SortArray
//插入排序
//时间复杂度 O(n^2)，最好情况下是 O(n)，空间复杂度是 O(1)，交换次数
-(void)sortingForInsertWithArray:(NSMutableArray *)array
{
    for (int i = 1; i<=array.count-1; i++) {
        if (array[i-1] > array[i]) {
            int j = i-1;
            id temp = array[i];
            while (j>=0&&temp<array[j]) {
                array[j+1] = array[j];
                j--;
            }
            array[j+1] = temp;
        }
    }
}

//希尔排序
//例如希尔增量时间复杂度为O(n²)，而Hibbard增量的希尔排序的时间复杂度为O(  )，希尔排序时间复杂度的下界是n*log2n。
-(void)sortingForShellWithArray:(NSMutableArray *)array{
    int dk = (int)(array.count-1)/2;
    while (dk>=1) {
        [self shellSortingWithArray:array startIndex:dk];
        dk = dk/2;
    }
}
-(void)shellSortingWithArray:(NSMutableArray *)array startIndex:(int)dk{
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
//选择排序
-(void)sortingForSelectWithArray:(NSMutableArray *)array{
    int i,j,k;
    for (i = 0; i<=array.count-1; i++) {
        k = i;
        for (j = i+1; j<=array.count-1; j++) {
            if (array[k] >array[j] ) {
                k = j;
            }
        }
        if (k!=i) {
            id temp = array[i];
            array[i]= array[k];
            array[k]= temp;
        }
    }
}
//堆排序
//时间复杂度 O(nlog2(n))
-(void)sortingForHeapWithArray:(NSMutableArray *)array{
    [self heapSort:array len:array.count];
}
- (void)heapSort:(NSMutableArray *)heapList len:(NSInteger)len{
    //建立堆，从最底层的父节点开始
    NSLog(@"%@", heapList);
    for(NSInteger i = (heapList.count/2 -1); i>=0; i--)
        [self adjustHeap:heapList location:i len:heapList.count];
    
    for(NSInteger i = heapList.count -1; i >= 0; i--){
        //R[N] move EndLocation
        NSInteger maxEle = ((NSString *)heapList[0]).integerValue;
        heapList[0] = heapList[i];
        heapList[i] = @(maxEle).stringValue;
        
        [self adjustHeap:heapList location:0 len:i];
    }
}

- (void)adjustHeap:(NSMutableArray *)heapList location:(NSInteger)p len:(NSInteger)len{
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
//冒泡排序
//感觉跟选择排序类似，但是每次除了最大值沉底之外，中间值也有变换。
-(void)sortingForBubblingWithArray:(NSMutableArray *)array{
    
    for (int i=0; i<=array.count-1; i++) {
        for (int j=0; j<array.count-1-i; j++) {
            if (array[j] > array[j+1] ) {
                id string = array[j];
                array[j]= array[j+1];
                array[j+1] = string;
            }
        }
    }
}
//冒泡排序优化写法，记录位置，最好情况O(n),而且后边有序的可以快速定位
-(void)sortingForBubblingBetterWithArray:(NSMutableArray *)array{
    NSInteger end = array.count;
    while (end > 1) {
        int newEnd = 0;
        for (int j=0; j < end - 1; j++) {
            if (array[j] > array[j+1] ) {
                id string = array[j];
                array[j]= array[j+1];
                array[j+1] = string;
                newEnd = j + 1;
            }
        }
        end = newEnd;
    }
}
-(void)sortingForFastWithArray:(NSMutableArray *)array {
    [self sortingForFastWithArray:array strartIndex:0 endIndex:array.count-1];
}
//快速排序
//时间复杂度 最好O(nlogn)，最坏O(n²)
-(void)sortingForFastWithArray:(NSMutableArray *)array strartIndex:(NSInteger)strartIndex endIndex:(NSInteger)endIndex{
    
    if (strartIndex>endIndex) {
        return;
    }
    NSInteger i = strartIndex, j = endIndex;
    id  key = array[strartIndex];
    
    while (i<j) {
        
        while (i<j && key<=array[j]) {
            j--;
        }
        array[i] = array[j];
        
        while (i<j && key>=array[i]) {
            i++;
        }
        array[j] = array[i];
    }
    array[i] = key;
    [self sortingForFastWithArray:array strartIndex:strartIndex endIndex:i-1];
    [self sortingForFastWithArray:array strartIndex:i+1 endIndex:endIndex];
}
-(void)sortingForMergeWithArray:(NSMutableArray *)array {
    [self sortingForMergeWithArray:array standbyArray:[NSMutableArray arrayWithCapacity:array.count] startIndex:0 endIndex:array.count - 1];
}
//归并排序
-(void)sortingForMergeWithArray:(NSMutableArray *)array standbyArray:(NSMutableArray *)newArray startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex{
    
    NSInteger middle;
    if (startIndex<endIndex) {
        
        middle = (startIndex +endIndex)/2;
        [self sortingForMergeWithArray:array standbyArray:newArray startIndex:startIndex endIndex:middle];
        [self sortingForMergeWithArray:array standbyArray:newArray startIndex:middle+1 endIndex:endIndex];
        
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
