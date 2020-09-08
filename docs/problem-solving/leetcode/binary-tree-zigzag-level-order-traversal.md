---
layout: default
title: Binary Tree Zigzag Level Order Traversal
parent: Leetcode
grand_parent: Problem Solving
date: 2020-02-20
---

# Binary Tree Zigzag Level Order Traversal

[leetcode/binary-tree-zigzag-level-order-traversal](https://www.leetcode.com/problems/binary-tree-zigzag-level-order-traversal/)

## Code

- O(N) : 28 ms, faster than 82.86% of Python3 online submissions

```python
class Solution:
    def zigzagLevelOrder(self, root: TreeNode) -> List[List[int]]:
        if not root:
            return []
        depth = 0
        queue = [root]
        answer = []
        reverse = False
        while queue:
            if reverse:
                answer.append([n.val for n in queue[::-1]])
            else:
                answer.append([n.val for n in queue])
            nextQueue = []
            for node in queue:
                if node.left:
                    nextQueue.append(node.left)
                if node.right:
                    nextQueue.append(node.right)
            queue = nextQueue
            reverse = False if reverse else True
        return answer
```