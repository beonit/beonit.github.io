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

- Counter

```python
from collections import defaultdict
counter = Counter(paragraph)
```

- re

```python
import re
re.split("[!?',;. ]", paragraph.lower())
re.sub("[!?',;. ]+", " ", paragraph.lower())
```

- random
```python
import random
random.randrange(a, b) # a <= N < b
random.randint(a, b) # a <= N <= b
```