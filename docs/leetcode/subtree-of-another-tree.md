---
layout: default
title: Subtree of Another Tree
parent: Leetcode
date: 2020-02-22
---

# Subtree of Another Tree

[leetcode/subtree-of-another-tree](https://www.leetcode.com/problems/subtree-of-another-tree/)

## Code

- 292 ms, faster than 18.86% of Python3 online submissions
- 생각보다 수행 속도가 느리다.
- 시간 복잡도 계산이 어렵다. 최악의 경우 모든 노드가 같고 마지막 child node 한개만 다른 경우다. s 의 모든 노드는 t 의 모든 node 와 비교된다. 따라서 s * t 의 시간 복잡도가 필요하다.
- node 의 저장되는 값이 단순하고 제한적 이라면 preorder 로 순회하고 sub string 을 찾는 방법으로 처리할 수 있다. m + n 시간에 해결할 수있다.
- 다만, 트리가 커지면 이 문제는 굉장히 복잡해 진다.

```python
class Solution:
    def treeEquals(self, s, t):
        if (s is None) != (t is None):
            return False
        if (s is None) and (t is None):
            return True
        if s.val == t.val and self.treeEquals(s.left, t.left) and self.treeEquals(s.right, t.right):
            return True
        else:
            return False

    def isSubtree(self, s: TreeNode, t: TreeNode) -> bool:
        if (s is None) != (t is None):
            return False
        if (s is None) and (t is None):
            return True
        if self.treeEquals(s, t) or self.isSubtree(s.left, t) or self.isSubtree(s.right, t):
            return True
        else:
            return False
```