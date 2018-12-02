//
//  CodeArray.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/26.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "CodeArray.h"
#import "SortArray.h"
@implementation CodeArray

+ (void)arrayTestEntrance
{
    NSArray * nums = [[self class] addNumbers:@[@-1, @0, @1, @2, @-1, @-4]];
    NSLog(@"addNumber--%@",nums);
//    @[@3,@4,@5,@1,@2,@6] @[@3,@1,@6,@3,@12,@0,@5,@15]
    int val = [[self class] sortArrayTopK:2 array:@[@3,@4,@5,@1,@2,@6]];
    NSLog(@"sortArrayTopK --%d",val);
}


/**
1, 三数之和
 给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。
 
 注意：答案中不可以包含重复的三元组。
 
 例如, 给定数组 nums = [-1, 0, 1, 2, -1, -4]，
 
 满足要求的三元组集合为：
 [
 [-1, 0, 1],
 [-1, -1, 2]
 ]
 */


/**
1.将数组排序
2.定义三个指针，i，j，k。遍历i，
 那么这个问题就可以转化为在i之后的数组中寻找nums[j]+nums[k]=-nums[i]这个问题，
 也就将三数之和问题转变为二数之和---（可以使用双指针）
 https://www.jianshu.com/p/69b0a1170f96
 */
+(NSArray * )addNumbers:(NSArray*)nums
{
    ///1,排序
    NSMutableArray * numsM = nums.mutableCopy;
    [SortArray sortInsert:numsM];
    nums = numsM.copy;
    NSMutableArray * retval = [NSMutableArray array];
    int i=0,j=0,k=0;
    for (i=0; i<nums.count; i++) {
        // 1.排序 对于MutNums[i]来说，我们只需要负数和0，因为三个数之和为0，一定是有一个数为负数的，当然除去三个数都为0的情况。所以，我们取非正数。
        if ([nums[i] intValue] > 0) {
            break;
        }
        // 如果两个数字相同，我们直接跳到下一个循环。
        if (i > 0 && [nums[i] intValue] == [nums[i-1] intValue]) {
            continue;
        }
        int target = 0-[nums[i] intValue];
        j = i+1; k = (int)nums.count-1;
        while (j<k) {
            int temp1 = [nums[j] intValue];
            int temp2 = [nums[k] intValue];
            if (temp1+temp2 == target) {
                [retval addObject:@[nums[i],nums[j],nums[k]]];
                while (j<k && [nums[j] intValue] == [nums[j+1] intValue]) {
                    j++;
                }
                while (j<k && [nums[k] intValue] == [nums[k-1] intValue]) {
                    k--;
                }
                j++;
                k--;
            } else if(temp1+temp2 < target) {
                j++;
            } else if (temp1+temp2 > target) {
                k--;
            }
           
        }
    }
  return retval.copy;
}

/**
 2,岛屿的最大面积
 给定一个包含了一些 0 和 1的非空二维数组 grid , 一个 岛屿 是由四个方向 (水平或垂直) 的 1 (代表土地) 构成的组合。你可以假设二维矩阵的四个边缘都被水包围着。
 
 找到给定的二维数组中最大的岛屿面积。(如果没有岛屿，则返回面积为0。)
 
 示例 1:
 
 [[0,0,1,0,0,0,0,1,0,0,0,0,0],
 [0,0,0,0,0,0,0,1,1,1,0,0,0],
 [0,1,1,0,1,0,0,0,0,0,0,0,0],
 [0,1,0,0,1,1,0,0,1,0,1,0,0],
 [0,1,0,0,1,1,0,0,1,1,1,0,0],
 [0,0,0,0,0,0,0,0,0,0,1,0,0],
 [0,0,0,0,0,0,0,1,1,1,0,0,0],
 [0,0,0,0,0,0,0,1,1,0,0,0,0]]
 对于上面这个给定矩阵应返回 6。注意答案不应该是11，因为岛屿只能包含水平或垂直的四个方向的‘1’。
 */

/**
 3,搜索旋转排序数组
 假设按照升序排序的数组在预先未知的某个点上进行了旋转。
 
 ( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。
 
 搜索一个给定的目标值，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。
 
 你可以假设数组中不存在重复的元素。
 
 你的算法时间复杂度必须是 O(log n) 级别。
 
 示例 1:
 
 输入: nums = [4,5,6,7,0,1,2], target = 0
 输出: 4
 示例 2:
 
 输入: nums = [4,5,6,7,0,1,2], target = 3
 输出: -1
 */

/**
 4,最长连续递增序列
 给定一个未经排序的整数数组，找到最长且连续的的递增序列。
 
 示例 1:
 
 输入: [1,3,5,4,7]
 输出: 3
 解释: 最长连续递增序列是 [1,3,5], 长度为3。
 尽管 [1,3,5,7] 也是升序的子序列, 但它不是连续的，因为5和7在原数组里被4隔开。
 示例 2:
 
 输入: [2,2,2,2,2]
 输出: 1
 解释: 最长连续递增序列是 [2], 长度为1。
 注意：数组长度不会超过10000。
 */

/**
 5,数组中的第K个最大元素
 在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
 
 示例 1:
 
 输入: [3,2,1,5,6,4] 和 k = 2
 输出: 5
 示例 2:
 
 输入: [3,2,3,1,2,4,5,5,6] 和 k = 4
 输出: 4
 说明:
 
 你可以假设 k 总是有效的，且 1 ≤ k ≤ 数组的长度。
 */

/**
利用快排思想寻找第k大的数
 */
+ (int)sortArrayTopK:(int)k array:(NSArray*)array
{
//    NSMutableArray * arrayM = array.mutableCopy;
////     [SortArray sortFast:arrayM];
////    [SortArray sortMerge:arrayM];
//    [SortArray sortCounting:arrayM];
////    [SortArray sortInsert:arrayM];
////    [SortArray sortingForMergeWithArray:arrayM];
//    array = arrayM.copy;
//
//    return [array[array.count-k] intValue];
    
    return  [[self class] sortQuick:array.mutableCopy low:0 high:(int)array.count-1 k:k];
}

static int count = 1;
+ (int)sortQuick:(NSMutableArray *)array low:(int)low high:(int)high k:(int)k
{
    if (low>high) {
        return -1;
    }
    int index = [[self class] partitionFast:array begin:low end:high];
    count=index-low+1;// 比基点大 的 点个数
    if (count > k) {
        return [[self class] sortQuick:array low:low high:index-1 k:k];
    } else if (count < k) {
        return [[self class] sortQuick:array low:index+1 high:high k:k];
    } else {
        return [array[index] intValue];
    }
    
}


/**
快排核心算法 先移动末指针 在移动首指针 直到 i>j
int i=low,j=high,temp=a[low];
if(low < high)
{
    while(i<j)
    {
        while(i<j && temp>=a[j])
            j--;
        if(i<j)// 双重验证
        {
            a[i]=a[j];
            i++;
        }
        while(i<j && temp<=a[i])
            i++;
        if(i<j)
        {
            a[j]=a[i];
            j--;
        }
    }
    a[i]=temp;
}
return i;
 */
+ (int)partitionFast:(NSMutableArray *)array begin:(int)begin end:(int)end
{
    int i = begin,j=end;
    int temp = [array[begin] intValue];
    while (i<j) {
        while (i<j && temp>=[array[j] intValue]) {
            j--;
        }
        array[i] = array[j];
        while (i<j && temp<=[array[i] intValue]) {
            i++;
        }
        array[j] = array[i];
    }
    array[i] = @(temp);
    return i;
}

/**
 6,最长连续序列
 给定一个未排序的整数数组，找出最长连续序列的长度。
 
 要求算法的时间复杂度为 O(n)。
 
 示例:
 
 输入: [100, 4, 200, 1, 3, 2]
 输出: 4
 解释: 最长连续序列是 [1, 2, 3, 4]。它的长度为 4。
 */

/**
 7,第k个排列
 给出集合 [1,2,3,…,n]，其所有元素共有 n! 种排列。
 
 按大小顺序列出所有排列情况，并一一标记，当 n = 3 时, 所有排列如下：
 
 "123"
 "132"
 "213"
 "231"
 "312"
 "321"
 给定 n 和 k，返回第 k 个排列。
 
 说明：
 
 给定 n 的范围是 [1, 9]。
 给定 k 的范围是[1,  n!]。
 示例 1:
 
 输入: n = 3, k = 3
 输出: "213"
 示例 2:
 
 输入: n = 4, k = 9
 输出: "2314"
 */

/**
 8,朋友圈
 班上有 N 名学生。其中有些人是朋友，有些则不是。他们的友谊具有是传递性。如果已知 A 是 B 的朋友，B 是 C 的朋友，那么我们可以认为 A 也是 C 的朋友。所谓的朋友圈，是指所有朋友的集合。
 
 给定一个 N * N 的矩阵 M，表示班级中学生之间的朋友关系。如果M[i][j] = 1，表示已知第 i 个和 j 个学生互为朋友关系，否则为不知道。你必须输出所有学生中的已知的朋友圈总数。
 
 示例 1:
 
 输入:
 [[1,1,0],
 [1,1,0],
 [0,0,1]]
 输出: 2
 说明：已知学生0和学生1互为朋友，他们在一个朋友圈。
 第2个学生自己在一个朋友圈。所以返回2。

 */

/**
 9,合并区间
 给出一个区间的集合，请合并所有重叠的区间。
 
 示例 1:
 
 输入: [[1,3],[2,6],[8,10],[15,18]]
 输出: [[1,6],[8,10],[15,18]]
 解释: 区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
 示例 2:
 
 输入: [[1,4],[4,5]]
 输出: [[1,5]]
 解释: 区间 [1,4] 和 [4,5] 可被视为重叠区间。
 */

/**
 10,接雨水
 给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
 
 rainwatertrap.png
 
 上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。 感谢 Marcos 贡献此图。
 
 示例:
 
 输入: [0,1,0,2,1,0,1,3,2,1,2,1]
 输出: 6
 */

@end
