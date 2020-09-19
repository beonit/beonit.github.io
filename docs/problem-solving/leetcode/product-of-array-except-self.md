---
layout: default
title: Product of Array Except Self
parent: Leetcode
grand_parent: Problem Solving
date: 2020-09-19
---

## Product of Array Except Self

[leetcode/product-of-array-except-self](https://leetcode.com/problems/product-of-array-except-self)

## Code

- O(N) : 144 ms, faster than 35.64% of Python3 online submissions for Product of Array Except Self.

```python
class Solution:
    def productExceptSelf(self, nums):
        size = len(nums)
        left = [1] * size
        right = [1] * size
        left[0] = nums[0]
        right[-1] = nums[-1]
        for i in range(1, size):
            left[i] = left[i - 1] * nums[i]
        for i in range(1, size):
            right[size - 1 - i] = right[size - 1 - i + 1] * nums[size - 1 - i]
        result = [0] * size
        for i in range(0, size):
            if i == 0:
                result[i] = right[i + 1]
            elif i == size - 1:
                result[i] = left[i - 1]
            else:
                result[i] = left[i - 1] * right[i + 1]
        return result
```
