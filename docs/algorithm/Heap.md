---
layout: default
title: Heap
parent: Algorithm
date: 2020-02-01
---

{{page.date}}

# Heap

heap 의 사전적 의미는 더미 라는 뜻이다. 대충 쌓아 올린다는 뜻이다. 그런데 꺼내는건 쉽지 않다.
heap push 와 pop 을 간단하게 구현했다. 인터넷에 거창한 구현들이 많다. 다들 너무 거창하고 주석도 너무 자세하다.
min heap 의 간단한 구현체다. 이 구현은 0번 인덱스 까지 사용한다. 그래서 parent 를 계산하는 식이 조금 다를 수 있다.


```python
import random

def heapPush(arr, val):
    i = len(arr)
    arr.append(val)
    pi = ((i + 1) // 2) - 1
    while i > 0 and arr[i] < arr[pi]:
        arr[i], arr[pi] = arr[pi], arr[i]
        i = pi
        pi = ((i + 1) // 2) - 1

def heapPop(arr):
    minVal = arr[0]
    arr[0] = arr[-1]
    arr.pop()
    i = 0
    while (i * 2) + 1 < len(arr):
        left = (i * 2) + 1
        right = (i * 2) + 2
        if right < len(arr) and arr[left] > arr[right]:
            child = right
        else:
            child = left
        if arr[i] > arr[child]:
            arr[i], arr[child] = arr[child], arr[i]
            i = child
        else:
            break
    return minVal

for _ in range(1000):
    arr = [random.randint(0, 2000) for _ in range(1000)]
    heapArr = []
    for val in arr:
        heapPush(heapArr, val)
    sortedArr = []
    while heapArr:
        sortedArr.append(heapPop(heapArr))
    assert sorted(arr) == sortedArr
```


## python heapq

python heapq 를 이용하는 코드다. heapq 의 사용법을 익혀본다.

1. 배열의 절반은 heapify 로 heap 으로 만든다.
1. 나머지 절반은 heappush 로 heap 에 마저 넣는다.
1. 차례대로 빼낸다.
1. 따로 정렬한 배열과 비교한다

```python
import heapq
for _ in range(100):
    arr = [random.randint(0, 2000) for _ in range(1000)]
    # Heapify
    heap = arr[:len(arr)]
    heapq.heapify(heap)
    # heapush
    for v in arr[len(arr):]:
        heapq.heappush(heap, v)
    # heappop
    sortedArr = []
    while heap:
        sortedArr.append(heapq.heappop(heap))
    assert sorted(arr) == sortedArr
```
