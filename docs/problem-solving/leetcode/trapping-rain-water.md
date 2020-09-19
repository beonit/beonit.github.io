---
layout: default
title: Trapping Rain Water
parent: Leetcode
grand_parent: Problem Solving
date: 2020-09-16
---

## Trapping Rain Water

[leetcode/trapping-rain-water](https://www.leetcode.com/problems/trapping-rain-water/)

## Code

- O(N) : 60 ms, faster than 48.07% of Python3 online submissions for Trapping Rain Water.

```python


class Solution:
    def trap(self, height) -> int:
        size = len(height)
        if size == 0:
            return 0
        # left
        left = [0] * size
        leftmax = height[0]
        for i in range(size):
            if leftmax > height[i]:
                left[i] = leftmax - height[i]
            else:
                leftmax = height[i]
        # right
        right = [0] * size
        rightmax = height[-1]
        for i in range(size):
            if rightmax > height[size - 1 - i]:
                right[size - 1 - i] = rightmax - height[size - 1 - i]
            else:
                rightmax = height[size - 1 - i]
        # result
        result = 0
        for i in range(size):
            result += min(right[i], left[i])
        return result
```
