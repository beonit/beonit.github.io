---
layout: default
title: Container With Most Water
parent: Leetcode
grand_parent: Problem Solving
date: 2020-09-19
---

## Container With Most Water

[leetcode/container-with-most-water](https://leetcode.com/problems/container-with-most-water/)

## Code

- O(N) : 136 ms, faster than 58.62% of Python3 online submissions for Container With Most Water.

```python
class Solution:
    def maxArea(self, height) -> int:
        left = 0
        right = len(height) - 1
        result = 0
        while left < right:
            area = (right - left) * min(height[left], height[right])
            result = max(result, area)
            if height[left] < height[right]:
                left += 1
            else:
                right -= 1
        return result
```
