//
//  FindMedianSortedArrays_04.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/14.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "FindMedianSortedArrays_04.h"

@implementation FindMedianSortedArrays_04
/**
 
 给定两个大小为 m 和 n 的有序数组 nums1 和 nums2 。
 请找出这两个有序数组的中位数。要求算法的时间复杂度为 O(log (m+n)) 。
 你可以假设 nums1 和 nums2 不同时为空。
 示例 1:
 nums1 = [1, 3]
 nums2 = [2]
 中位数是 2.0
 示例 2:
 nums1 = [1, 2]
 nums2 = [3, 4]
 中位数是 (2 + 3)/2 = 2.5
 */

/**
 Notes:https://blog.csdn.net/hk2291976/article/details/51107778
 超级经典的分治算法,如何在给定的2个数组里面找其中的中值.或者异型问题,如何在2个有序数组中查找Top K的值或求第K个元素的问题.
 "割":
 我们通过切一刀，能够把有序数组分成左右两个部分，切的那一刀就被称为割(Cut)，割的左右会有两个元素，分别是左边最大值和右边最小值。
 我们定义L = Max(LeftPart)，R = Min(RightPart)
 
 割可以割在两个数中间，也可以割在1个数上，如果割在一个数上，那么这个数即属于左边，也属于右边。（后面讲单数组中值问题的时候会说）
 比如说[2 3 5 7]这个序列，割就在3和5之间
 [2 3 / 5 7]
 中值就是（3+5）/2 = 4
 
 如果[2 3 4 5 6]这个序列，割在4上，我们可以把4分成2个
 [2 3 (4/4) 5 7]
 中值就是（4+4）/2 = 4
 这样可以保证不管中值是1个数还是2个数都能统一运算。
 
 "割和第k个元素":
 对于单数组，找其中的第k个元素特别好做，我们用割的思想就是：
 如果在k的位置割一下，然后A[k]就是L。换言之，就是如果左侧有k个元素，A[k]属于左边部分的最大值。（都是明显的事情，这个不用解释吧！）
 双数组
 我们设:
 Ci为第i个数组的割。
 Li为第i个数组割后的左元素.
 Ri为第i个数组割后的右元素。
 
 如何从双数组里取出第k个元素
 首先Li<=Ri是肯定的（因为数组有序，左边肯定小于右边）
 如果我们让L1<=R2 && L2<=R1
 那么左半边 全小于右半边，如果左边的元素个数相加刚好等于k，那么第k个元素就是Max(L1,L2)，参考上面常识1。
 如果 L1>R2，说明数组1的左边元素太大（多），我们把C1减小，把C2增大。L2>R1同理，把C1增大，C2减小。
 假设k=3
 对于
 [1 4 7 9][1 4 7 9]
 [2 3 5][2 3 5]
 
 设C1 = 2，那么C2 = k-C1 = 1
 [1 4/7 9][1 4/7 9]
 [2/3 5][2/3 5]
 
 这时候，L1(4)>R2(3)，说明C1要减小，C2要增大，C1 = 1，C2=k-C1 = 2
 [1/4 7 9][1/4 7 9]
 [2 3/5][2 3/5]
 
 这时候，满足了L1<=R2L1<=R2 && L2<=R1L2<=R1，第3个元素就是Max(1,3) = 3。
 
 如果对于上面的例子，把k改成4就恰好是中值。
 
 下面具体来看特殊情况的中值问题。
 
 双数组的奇偶
 中值的关键在于，如何处理奇偶性，单数组的情况，我们已经讨论过了，那双数组的奇偶问题怎么办，m+n为奇偶处理方案都不同，
 
 让数组恒为奇数
 有没有办法让两个数组长度相加一定为奇数或偶数呢？
 
 其实有的，虚拟加入‘#’(这个trick在manacher算法中也有应用)，让数组长度恒为奇数（2n+1恒为奇数）。
 Ps.注意是虚拟加，其实根本没这一步，因为通过下面的转换，我们可以保证虚拟加后每个元素跟原来的元素一一对应
 
 之前    len    之后    len
 [1 4 7 9]    4    [# 1 # 4 # 7 # 9 #]    9
 [2 3 5]    3    [# 2 # 3 # 5 #]    7
 
 映射关系
 这有什么好处呢，为什么这么加?因为这么加完之后，每个位置可以通过/2得到原来元素的位置。
 
 /    原位置    新位置    除2后
 0    1    0    1
 5    2    5    2
 在虚拟数组里表示“割”
 不仅如此，割更容易，如果割在‘#’上等于割在2个元素之间，割在数字上等于把数字划到2个部分。

 例：
 1. 割在4/7之间‘#’，C = 4，L=(4-1)/2=1 ，R=4/2=2
 刚好是4和7的原来位置！
 2. 割在3上，C = 3，L=(3-1)/2=1，R=3/2 =1，刚好都是3的位置！
 
 剩下的事情就好办了，把2个数组看做一个虚拟的数组A，目前有2m+2n+2个元素，割在m+n+1处，所以我们只需找到m+n+1位置的元素和m+n+2位置的元素就行了。
 左边：A[m+n+1] = Max(L1+L2)
 右边：A[m+n+2] = Min(R1+R2)
 
 Mid = (A[m+n+1]+A[m+n+2])/2
 = (Max(L1+L2) + Min(R1+R2) )/2
 
 至于在两个数组里找割的方案，就是上面的方案。
 分治的思路
 有了上面的知识后，现在的问题就是如何利用分治的思想。
 
 怎么分？
 最快的分的方案是二分，有2个数组，我们对哪个做二分呢？
 根据之前的分析，我们知道了，只要C1或C2确定，另外一个也就确定了。这里，为了效率，我们肯定是选长度较短的做二分，假设为C1。
 
 怎么治？
 也比较简单，我们之前分析了：就是比较L1,L2和R1,R2。
 - L1>R2，把C1减小，C2增大。—> C1向左二分
 - L2>R1，把C1增大，C2减小。—> C1向右二分
 
 越界问题
 如果C1或C2已经到头了怎么办？
 这种情况出现在：如果有个数组完全小于或大于中值。可能有4种情况：
 - C1 = 0 —— 数组1整体都比中值大，L1 >R2，中值在2中
 - C2 = 0 —— 数组1整体都比中值小，L1

 */
+ (float)findMedianSortedArrays:(NSArray *)arrA and:(NSArray *)arrB
{
    NSUInteger n = arrA.count;
    NSUInteger m = arrB.count;
    if (n>m) { ///保证数组a是最短的
        return [self findMedianSortedArrays:arrB and:arrA];
    }
    NSUInteger l1 = 0,l2 = 0,r1 = 0,r2 = 0,c1,c2,lo = 0, trick = 2*n;
    while (lo <= trick) {
        c1 = (lo+trick)/2;//C1是二分的结果
        c2 = m+n - c1;
        l1 = (c1 ==0) ? 0 : [arrA[(c1-1)/2] integerValue];
        r1 = (c1 == 2*n) ? NSUIntegerMax : [arrA[c1/2] integerValue];
        l2 = (c2 == 0) ? 0 : [arrB[(c2-1)/2] integerValue];
        r2 = (c2 == 2*m) ? NSUIntegerMax : [arrB[c2/2] integerValue];
        
        if (l1>r2) {
            trick = c1 - 1;
        } else if (l2 > r1) {
            lo = c1 + 1;
        } else {
            break;
        }
    }
    return (MAX(l1, l2)+MIN(r1, r2))/2.0;
}

+ (float)findTopK:(NSUInteger)topK sortedArrays:(NSArray *)arrA and:(NSArray *)arrB
{
    NSUInteger n = arrA.count;
    NSUInteger m = arrB.count;
    if (n>m) { ///保证数组a是最短的
        return [self findMedianSortedArrays:arrB and:arrA];
    }
    NSUInteger l1 = 0,l2 = 0,r1 = 0,r2 = 0,c1,c2,lo = 0, trick = n;
    
    while (lo <= trick) {
        c1 = topK/2;//C1是二分的结果
        c2 = topK - c1;
        l1 = (c1 ==0) ? 0 : [arrA[(c1-1)] integerValue];
        r1 = (c1 == n) ? NSUIntegerMax : [arrA[c1] integerValue];
        l2 = (c2 == 0) ? 0 : [arrB[(c2-1)] integerValue];
        r2 = (c2 ==m) ? NSUIntegerMax : [arrB[c2] integerValue];
        
        if (l1>r2) {
            trick = c1 - 1;
        } else if (l2 > r1) {
            lo = c1 + 1;
        } else {
            break;
        }
    }
    return (MAX(l1, l2));
}

@end
