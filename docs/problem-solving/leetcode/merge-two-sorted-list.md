---
layout: default
title: Merge Two Sorted Lists
parent: Leetcode
grand_parent: Problem Solving
date: 2020-02-16
---

# Merge Two Sorted Lists

[leetcode/merge-two-sorted-list](https://www.leetcode.com/problems/merge-two-sorted-list/)

## Code

- O(N+M) : 32 ms, faster than 85.10% of Python3

```python
class ListNode:
    def __init__(self, x, next = None):
        self.val = x
        self.next = next

class Solution:
    def mergeTwoLists(self, l1, l2):
        head = ListNode(0)
        node = head
        while l1 or l2:
            if l1 and (not(l2) or l1.val < l2.val):
                node.next = l1
                node = l1
                l1 = l1.next
            else:
                node.next = l2
                node = l2
                l2 = l2.next
        return head.next

def printList(head):
    while head != None:
        print(" ", head.val)
        head = head.next

l3 = ListNode(4)
l2 = ListNode(2, l3)
h1 = ListNode(1, l2)

l3 = ListNode(4)
l2 = ListNode(3, l3)
h2 = ListNode(1, l2)

soltuion = Solution()
h3 = soltuion.mergeTwoLists(h1, h2)

printList(h3)
```