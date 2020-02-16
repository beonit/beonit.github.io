---
layout: default
title: Best Time to Buy and Sell Stock
parent: Leetcode
date: 2020-02-15 00:00
---

# Best Time to Buy and Sell Stock

[leetcode/best-time-to-buy-and-sell-stock](https://www.leetcode.com/problems/best-time-to-buy-and-sell-stock/)

## Code

- O(N) : 60 ms, faster than 83.76% of Python3 

```python
class Solution:
    def maxProfit(self, prices):
        min = 2147483647
        maxProfit = 0
        for price in prices:
            if min > price:
                min = price
            maxProfit = max(price - min, maxProfit)
        return maxProfit

answer = Solution().maxProfit([7,1,5,3,6,4])
print(answer)
answer = Solution().maxProfit([7,6,4,3,1])
print(answer)
answer = Solution().maxProfit([])
print(answer)
```