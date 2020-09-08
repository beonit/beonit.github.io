---
layout: default
title: Copy List with Random Pointer
parent: Leetcode
grand_parent: Problem Solving
date: 2020-02-20
---

# Copy List with Random Pointer

[leetcode/copy-list-with-random-pointer](https://www.leetcode.com/problems/copy-list-with-random-pointer/)

## Code

- O(N) : 24 ms, faster than 98.97% of Python3 online submissions

```python
# Definition for a Node.
class Node:
    def __init__(self, x: int, next: 'Node' = None, random: 'Node' = None):
        self.val = int(x)
        self.next = next
        self.random = random

class Solution:
    def copyRandomList(self, head: 'Node') -> 'Node':
        newHead = Node(0)

        srcNode = head
        copyNode = newHead
        while srcNode:
            copyNext = Node(srcNode.val, None, srcNode.random)
            srcNode.copy = copyNext
            copyNode.next = copyNext
            copyNode = copyNext
            srcNode = srcNode.next
        
        copyNode = newHead
        while copyNode:
            if copyNode.random:
                copyNode.random = copyNode.random.copy
            copyNode = copyNode.next
        
        return newHead.next
```