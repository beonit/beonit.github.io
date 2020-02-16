---
layout: default
title: Leetcode
nav_order: 6
has_children: true
permalink: /docs/leetcode
---

# Leetcode

문제풀이 연습

## Python 유용한 라이브러리

- ```sys.maxsize```

- defaultdict
```python
from collections import defaultdict
shown = defaultdict(int)
shown = defaultdict(list)
shown = defaultdict(dict)
```

- heapq
```python
import heapq
heapq.heapify(heap)
heapq.heappush(heap, v)
heapq.heappush(heap, (obj.key, obj.key2, obj))
heapq.heappop(heap)
```