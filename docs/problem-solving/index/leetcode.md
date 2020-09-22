---
layout: default
title: Leetcode
nav_order: 6
has_children: true
parent: Problem Solving
---

# Leetcode

문제풀이 연습

## print with format

- 3.6 부터 가능

```python
print(f"P : {p}")
print(f"I have {card.price}")
```

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

- deque

```python
from collections import deque
queue = deque("0")
queue.append("1")
queue.popleft() # 1
```

## Python 연산자의 시간 복잡도

- [Complexity of Python Operations](https://www.ics.uci.edu/~pattis/ICS-33/lectures/complexitypython.txt)
  - 대체로 널리 알려진 시간 복잡도를 그대로 따르고 있다.