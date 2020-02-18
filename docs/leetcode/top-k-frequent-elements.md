---
layout: default
title: Top K Frequent Elements
parent: Leetcode
date: 2020-02-18
---

# Top K Frequent Elements

[leetcode/top-k-frequent-elements](https://www.leetcode.com/problems/top-k-frequent-elements/)

## Code

- O(N^2) : 108 ms, faster than 58.14% of Python3 online submissions

```python
from collections import defaultdict

class Solution:
    def topKFrequent(self, nums, k):
        occurDict = defaultdict(int)
        for num in nums:
            occurDict[num] += 1
        occurList = [(freq, num) for num, freq in occurDict.items()]
        occurList.sort(reverse=True)
        return [num for freq, num in occurList][:k]

ans = Solution().topKFrequent([1,1,1,2,2,3], 2)
print(ans)
```