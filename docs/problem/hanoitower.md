---
layout: default
title: Hanoitower
parent: Problem
order: 1
---

# Hanoi tower

recursion 을 이해하는 첫번째 문제

## Binary search

```python
def hanoi(n, x, y, z):
    if n < 1:
        return
    hanoi(n - 1, x, z, y)
    print(n, x, "->", y)
    hanoi(n - 1, z, y, x)

hanoi(3, "A", "C", "B")
```

```bash
1 A -> C
2 A -> B
1 C -> B
3 A -> C
1 B -> A
2 B -> C
1 A -> C
```
