---
layout: default
title: Merge Intervals
parent: Leetcode
grand_parent: Problem Solving
date: 2020-09-17
---

# Merge Intervals

[leetcode/merge-intervals](https://leetcode.com/problems/merge-intervals/)

## Code

- O(N^2) : 60m

```python
class Solution:
    def merge(self, intervals):
        if not intervals:
            return []
        intervals.sort(key = lambda item: item[0])
        merge = []
        for inter in intervals:
            if merge and merge[-1][0] <= inter[0] <= merge[-1][1]:
                merge[-1][1] = max(inter[1], merge[-1][1])
            else:
                merge.append(inter)
        return merge
```