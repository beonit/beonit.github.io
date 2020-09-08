---
layout: default
title: Merge k Sorted Lists
parent: Leetcode
grand_parent: Problem Solving
date: 2020-02-16
---

# Merge k Sorted Lists

[leetcode/merge-k-sorted-lists](https://www.leetcode.com/problems/merge-k-sorted-lists/)

## Code

- O(NLogM) : 112m Your runtime beats 62.06 % of python3 submissions.

```python
import heapq

class ListNode:
    def __init__(self, x, next = None):
        self.val = x
        self.next = next

class Solution:
    def mergeKLists(self, lists):
        answer = ListNode(0)
        answerHead = answer
        
        heap = []
        for order, l in enumerate(lists):
            if l:
                heapq.heappush(heap, (l.val, order, l))
        
        while heap:
            val, order, node = heapq.heappop(heap)
            answer.next = ListNode(val)
            answer = answer.next
            if node.next:
                heapq.heappush(heap, (node.next.val, order, node.next))
        return answerHead.next
```