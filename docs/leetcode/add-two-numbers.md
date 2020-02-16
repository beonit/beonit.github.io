---
layout: default
title: Add Two Numbers
parent: Leetcode
date: 2020-02-15 00:00
---

# Add Two Numbers

[leetcode/add-two-numbers](https://leetcode.com/problems/add-two-numbers/)

## code

- O(max(n, m)) : 60m

```python
class Solution:
    def addTwoNumbers(self, l1: ListNode, l2: ListNode) -> ListNode:
        head = ListNode(0)
        node = head
        overflow = 0
        while l1 != None or l2 != None:
            if l1 is None:
                sum = l2.val + overflow
                l2 = l2.next
            elif l2 is None:
                sum = l1.val + overflow
                l1 = l1.next
            else:
                sum = l1.val + l2.val + overflow
                l1 = l1.next
                l2 = l2.next
            node.next = ListNode(sum % 10)
            overflow = sum // 10
            node = node.next
        if overflow > 0:
            node.next = ListNode(overflow)
        return head.next
```

```python
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

def valueToNode(num):
    head = ListNode(0)
    node = head
    while num > 0:
        node.next = ListNode(num % 10)
        node = node.next
        num //= 10
    return head.next

def printNode(n):
    while n != None:
        print(n.val, end = '')
        n = n.next
    print()

# Case 1
n1 = 342
n2 = 465
l1 = valueToNode(n1)
l2 = valueToNode(n2)
answer = Solution().addTwoNumbers(l1, l2)
printNode(answer)

# Case 2
n1 = 342
n2 = 10
l1 = valueToNode(n1)
l2 = valueToNode(n2)
answer = Solution().addTwoNumbers(l1, l2)
printNode(answer)

# Case 3
n1 = 342
n2 = 8
l1 = valueToNode(n1)
l2 = valueToNode(n2)
answer = Solution().addTwoNumbers(l1, l2)
printNode(answer)

# Case 4
n1 = 342
n2 = 0
l1 = valueToNode(n1)
l2 = valueToNode(n2)
answer = Solution().addTwoNumbers(l1, l2)
printNode(answer)

# Case 5
n1 = 342
n2 = 800
l1 = valueToNode(n1)
l2 = valueToNode(n2)
answer = Solution().addTwoNumbers(l1, l2)
printNode(answer)
```