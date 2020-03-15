---
layout: default
title: Recover Binary Search Tree
parent: Leetcode
date: 2020-03-15
---

# Recover Binary Search Tree

[leetcode/recover-binary-search-tree](https://www.leetcode.com/problems/recover-binary-search-tree/)

## Code

- medium 난이도 문제 두개가 섞여 있다.
- O(N) : 88 ms, faster than 14.90% of Python3 online submissions for Recover Binary Search Tree.
  1. iterative 하게 inorder traversal 해서 배열을 만든다.
  2. swap 된 값의 index 를 찾아서 뒤집는다.
  3. iterative inorder traversal 을 하며 값을 설정한다.
- 두번의 inorder traversal 과 한번의 swap 된 값을 찾는 시간이 걸린다.
- 순서가 바뀐 값을 찾는 알고리즘이 신박하다.

```python
class Solution:
    def recoverTree(self, root: TreeNode):
        if not root:
            return
        values = self.inorderTraversal(root)
        idx1, idx2 = self.findSwaped(values)
        values[idx1], values[idx2] = values[idx2], values[idx1]
        self.setValues(values, root)
        return self.inorderTraversal(root)        

    def findSwaped(self, values):
        y = x = -1
        for i in range(0, len(values) - 1):
            if values[i] > values[i + 1]:
                y = i + 1
                if x == -1:
                    x = i
                else:
                    break
        return y, x
    
    def inorderTraversal(self, root: TreeNode):
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
    
    def setValues(self, values, root):
        stack = []
        valueIdx = 0
        node = root
        while True:
            if node:
                stack.append(node)
                node = node.left
            elif stack:
                node = stack.pop()
                node.val = values[valueIdx]
                valueIdx += 1
                node = node.right
            else:
                break
        return
```