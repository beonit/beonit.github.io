---
layout: default
title: Binary Tree Inorder Traversal
parent: Leetcode
date: 2020-03-14
---

# Binary Tree Inorder Traversal

[leetcode/binary-tree-inorder-traversal](https://www.leetcode.com/problems/binary-tree-inorder-traversal/)

## Code

- O(N) : 28m Your runtime beats 64.49 % of python3 submissions.

```python
class Solution:
    def inorderTraversal(self, root: TreeNode):
        stack = []
        result = []
        node = None
        while True:
            if node:
                stack.append(node)
                node = node.left
            elif stack:
                node = stack.pop()
                result.append(node.val)
                node = node.right
            else:
                break
        return result
```