---
layout: default
title: Recursion
parent: Problem
nav_order: 1
date: 2020-02-06 11:00
---

{{page.date}}


# Recursion

완전 탐색에 흔히 사용되는 알고리즘. bound condition 을 잘못 주면 에러가 나기 십상이다.

## Hanoi tower

recursion 을 이해하는 첫번째 문제. x, z, y 의 위치가 좀 혼란 스럽다.

### Code

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

## Fibonachi
### Recursion
### Memozation
### Dynamic programming