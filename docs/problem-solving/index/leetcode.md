---
layout: default
title: Leetcode
nav_order: 6
has_children: true
parent: Problem Solving
---

# Leetcode

## Grammar

- [Complexity of Python Operations](https://www.ics.uci.edu/~pattis/ICS-33/lectures/complexitypython.txt)
  - 대체로 널리 알려진 시간 복잡도를 그대로 따르고 있다.

- Print variables

  ```python
  print(f"P : {p}")
  print(f"I have {card.price}")
  ```

- [`nonlocal`](https://www.w3schools.com/python/ref_keyword_nonlocal.asp)
- [`sys.maxsize`](https://docs.python.org/3/library/sys.html#sys.maxsize)

## Internal functions

- `max`, `sum`, `map`
- `reversed`, `sorted`

## Libraries

- heapq

  ```python
  import heapq
  heapq.heapify(heap)
  heapq.heappush(heap, v) # Min heap
  heapq.heappush(heap, -v) # Max heap
  heapq.heappush(heap, (v1, v2, v3))
  heapq.heappop(heap)
  ```

- re

  ```python
  import re
  re.split("[!?',;. ]", paragraph.lower())
  re.sub("[!?',;. ]+", " ", paragraph.lower())
  re.replace(' ', '', paragraph)
  ```

- random

  ```python
  import random
  random.randrange(a, b) # a <= N < b
  random.randint(a, b) # a <= N <= b
  ```

- string
  ```python
  chr(65) # 'A'
  ord('B') - ord('A') # 1
  "Hello".split() # ["Hello"]
  "Hello World".split() # ["Hello", "World"]
  list("Hello") # ['H', 'e', 'l', 'l', 'o']
  "Hello".replace("o", "a") # "Hella"
  ```

## Collections

- defaultdict

  ```python
  from collections import defaultdict
  shown = defaultdict(int)
  shown = defaultdict(list)
  shown = defaultdict(dict)
  ```

- Counter

  ```python
  from collections import Counter
  counter = Counter(paragraph)
  items = list(counter.items())
  items.sort(key = lambda x: (x[1], x[1]))
  ```

- [deque](https://docs.python.org/2.5/lib/deque-objects.html)

  ```python
  from collections import deque
  queue = deque("0")
  queue.append("1")
  queue.appendleft("2")
  queue.popleft()
  queue.pop()
  len(queue)
  ```
