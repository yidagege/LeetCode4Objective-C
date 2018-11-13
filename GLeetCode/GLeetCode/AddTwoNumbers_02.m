//
//  AddTwoNumbers_02.m
//  GLeetCode
//
//  Created by GIKI on 2018/11/13.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "AddTwoNumbers_02.h"

@implementation AddTwoNumbers_02

/**
 使用变量来跟踪进位，并从包含最低有效位的表头开始模拟逐位相加的过程。
 就像你在纸上计算两个数字的和那样，我们首先从最低有效位也就是列表 l1l1 和 l2l2 的表头开始相加。由于每位数字都应当处于 0 \ldots 90…9 的范围内，我们计算两个数字的和时可能会出现“溢出”。例如，5 + 7 = 125+7=12。在这种情况下，我们会将当前位的数值设置为 22，并将进位 carry = 1carry=1 带入下一次迭代。进位 carrycarry 必定是 00 或 11，这是因为两个数字相加（考虑到进位）可能出现的最大和为 9 + 9 + 1 = 199+9+1=19。
 
 伪代码如下：
 
 将当前结点初始化为返回列表的哑结点。
 将进位 carry 初始化为 0。
 将 p 和 q 分别初始化为列表 l1 和 l2 的头部。
 遍历列表 l1l1 和 l2l2 直至到达它们的尾端。
 将 xx 设为结点 pp 的值。如果 pp 已经到达 l1l1 的末尾，则将其值设置为 00。
 将 yy 设为结点 qq 的值。如果 qq 已经到达 l2l2 的末尾，则将其值设置为 00。
 设定 sum = x + y + carrysum=x+y+carry。
 更新进位的值，carry = sum / 10carry=sum/10。
 创建一个数值为 (sum \bmod 10)(summod10) 的新结点，并将其设置为当前结点的下一个结点，然后将当前结点前进到下一个结点。
 同时，将 pp 和 qq 前进到下一个结点。
 检查 carry = 1carry=1 是否成立，如果成立，则向返回列表追加一个含有数字 11 的新结点。
 返回哑结点的下一个结点。
 请注意，我们使用哑结点来简化代码。如果没有哑结点，则必须编写额外的条件语句来初始化表头的值。
 

 */
+ (ListNode *)addTwoNums:(ListNode *)l1 and:(ListNode *)l2
{
    int carry = 0;
    ListNode *dummyHead = [ListNode val:0];
    ListNode *p = l1, *q = l2, *retval = dummyHead;
    while (p!=nil || q!=nil) {
        int x = (p!=nil)?p.val:0;
        int y = (q!=nil)?q.val:0;
        int total = carry+x+y;
        carry = total/10;
        retval.next = [ListNode val:total%10];
        retval = retval.next;
        if (p!=nil) {
            p=p.next;
        }
        if (q!=nil) {
            q=q.next;
        }
    }
    if (carry>0) {
        retval.next = [ListNode val:carry];
    }
    return dummyHead.next;
}
@end
