---
layout: default
title: Two sum
parent: Leetcode
date: 2020-02-15 00:00
---

# Two sum

[leetcode/two-sum](https://www.leetcode.com/problems/two-sum/)

## code

- O(N^2) : 60m

```python
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        indecies = {}
        for i, v in enumerate(nums):
            remain = target - v
            if remain in indecies:
                j = indecies[remain]
                return [i, j]
            indecies[v] = i
```

- 개선된 버전 O(NlogN) : 48ms

```python
class Solution:
    def twoSum(self, nums, target):
        numDict = {num: idx for idx, num in enumerate(nums)}
        for idx, num in enumerate(nums):
            if target - num in numDict:
                idx2 = numDict[target - num]
                if idx != idx2:
                    return [idx, idx2]
        return []
```
