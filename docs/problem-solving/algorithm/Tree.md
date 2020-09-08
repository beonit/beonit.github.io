---
layout: default
title: Tree
parent: Algorithm
grand_parent: Problem Solving
date: 2020-02-07 23:00
---

{{page.date}}

# Binary Search Tree

insert, search 는 어렵지 않다. 하지만 Delete 는 단순하지 않다.

## Inorder traversal

1. Iterative

- [leetcode - 94. Binary Tree Inorder Traversal](https://leetcode.com/problems/binary-tree-inorder-traversal/)
  - 난이도가 medium 인건 이유가 있다.

```python
def inorderTraversal(self, root):
    stack = []
    result = []
    node = root
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

2. Recursive

```python
def inorderTraversal(self, root: TreeNode):
    left = self.inorderTraversal(root.left) if root.left else []
    right = self.inorderTraversal(root.right) if root.right else []
    return left + [root.val] + right
```
3. Morris - 

