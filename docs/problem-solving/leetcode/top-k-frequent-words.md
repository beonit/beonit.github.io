---
layout: default
title: Top K Frequent Words
parent: Leetcode
grand_parent: Problem Solving
date: 2020-02-20
published: false
---

# Top K Frequent Words

[leetcode/top-k-frequent-words](https://www.leetcode.com/problems/top-k-frequent-words/)

## Code

- O(NLogN) : 정렬 하는 시간이 많이 걸린다.

```python
from collections import defaultdict

class Solution:
    def topKFrequent(self, words: List[str], k: int) -> List[str]:
        counter = defaultdict(int)
        for word in words:
            counter[word] += 1
        freqList = sorted(counter.items(), key = lambda it: (-it[1], it[0]))
        return [k for k, v in freqList[:k]]
```

- O(NLogK) : 속도는 비슷하지만 heap 을 사용하여 추출 과정의 시간이 짧다.

```python
class Solution:
    def topKFrequent(self, words: List[str], k: int) -> List[str]:
        words = collections.Counter(words)
        heap = [(-fre, word) for word, fre in words.items()]
        return [word for _, word in heapq.nsmallest(k, heap)]
```



