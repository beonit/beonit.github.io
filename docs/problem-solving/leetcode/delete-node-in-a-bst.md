---
layout: default
title: Delete Node in a BST
parent: Leetcode
grand_parent: Problem Solving
date: 2020-04-15
---

# Delete Node in a BST

[leetcode/delete-node-in-a-bst](https://www.leetcode.com/problems/delete-node-in-a-bst/)

## Code

- Runtime: 80 ms, faster than 38.76% of Python3

```python
class Solution:
    def deleteNode(self, root: TreeNode, key: int) -> TreeNode:
        if root == None:
            return None
        if root.val > key:
            root.left = self.deleteNode(root.left, key)
        elif root.val < key:
            root.right = self.deleteNode(root.right, key)
        else:
            if root.left == None and root.right == None:
                return None
            elif root.left == None:
                return root.right
            elif root.right == None:
                return root.left
            minNode = root.right
            while minNode.left:
                minNode = minNode.left
            root.val = minNode.val
            root.right = self.deleteNode(root.right, minNode.val)
        return root
```