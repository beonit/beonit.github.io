---
layout: default
title: K Closest Points to Origin
parent: Leetcode
grand_parent: Problem Solving
date: 2020-02-18
---

# K Closest Points to Origin

[leetcode/k-closest-points-to-origin](https://www.leetcode.com/problems/k-closest-points-to-origin/)

## Code

- O(NlogN) : 644 ms, faster than 98.60% of Python3 online submissions 

```python
class Solution:
    def kClosest(self, points: List[List[int]], K: int) -> List[List[int]]:
        return sorted(points, key = lambda x: x[0]*x[0] + x[1]*x[1])[:K]
```