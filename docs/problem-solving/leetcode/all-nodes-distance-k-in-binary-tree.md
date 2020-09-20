---
layout: default
title: All Nodes Distance K in Binary Tree
parent: Leetcode
grand_parent: Problem Solving
date: 2020-09-20
---

## All Nodes Distance K in Binary Tree

[leetcode/all-nodes-distance-k-in-binary-tree](https://www.leetcode.com/problems/all-nodes-distance-k-in-binary-tree/)

## Code

- O(N) : 44 ms, faster than 38.62% of Python3 online submissions for All Nodes Distance K in Binary Tree.

```python
import collections

class Solution:
    def distanceK(self, root: TreeNode, target: TreeNode, K: int):
        def markparent():
            queue = collections.deque([(root, None)])
            while queue:
                node, parent = queue.popleft()
                node.parent = parent
                if node.left:
                    queue.append((node.left, node))
                if node.right:
                    queue.append((node.right, node))
        markparent()
        queue = collections.deque([(target, 0)])
        seen = set()
        result = []
        while queue:
            node, dist = queue.popleft()
            if dist == K:
                result.append(node.val)
            seen.add(node.val)
            for neighbor in [node.parent, node.left, node.right]:
                if neighbor and neighbor.val not in seen:
                    queue.append((neighbor, dist + 1))
        return result
```
