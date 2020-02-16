---
layout: default
title: Binary search
parent: Algorithm
date: 2020-02-01
---

{{page.date}}

# Binary Search


바이너리 서치는 매우 효율 적이고, 이해하기도 쉽기 때문에 많은 자료구조, 알고리즘 서적의 처음에 등장한다. 구현은 매우 간단하다. 하지만 종종 실수한다. 바이너리 서치와 비슷한 bisect 구현도 추가한다.  

구현을 찾아보다 보면 mid 구하는 식에 ```lo + (hi - lo) // 2``` 가 쓰이기도 하고, ```(lo + hi) // 2``` 이 쓰이기도 한다. 무슨 차이가 있나 싶은데. 차이가 없다. 그런데, 어떤 문제 풀이에서는 식의 선택에 따라서 결과가 달랐던것 같다. (확실하지 않다) 참고로 python stdlib 의 bisect 는 ```(lo + hi) // 2``` 를 사용한다.

## Binary search

```python
def binSearch(arr, val, lo, hi):
    while lo <= hi:
        mid = lo + (hi - lo) // 2
        if arr[mid] == val:
            return mid
        if val < arr[mid]:
            hi = mid - 1
        else:
            lo = mid + 1
    return -1

for _ in range(10000):
    arr = [random.randint(0, 200) for _ in range(10000)]
    arr = sorted(list(set(arr)))
    target = random.randint(0, 200)
    expect = arr.index(target) if target in arr else -1
    actual = binSearch(arr, target, 0, len(arr) - 1)
    assert expect == actual
```

## Greatest smaller than x
```python
def greatestSmall(arr, val, lo, hi):
    while lo <= hi:
        mid = (hi + lo) // 2
        if arr[mid] < val:
            lo = mid + 1
        else:
            hi = mid - 1
    return hi

from bisect import bisect_left

# Test
for _ in range(10000):
    arr = [random.randint(0, 4000) for _ in range(1000)]
    arr = sorted(list(set(arr)))
    target = random.randint(0, 4000)
    actual = greatestSmall(arr, target, 0, len(arr) - 1)
    expect = bisect_left(arr, target) - 1
    assert actual == expect
```

## Python bisect implements

```python
def bisect_left(a, x, lo=0, hi=None):
    """Return the index where to insert item x in list a, assuming a is sorted.

    The return value i is such that all e in a[:i] have e < x, and all e in
    a[i:] have e >= x.  So if x already appears in the list, a.insert(x) will
    insert just before the leftmost x already there.

    Optional args lo (default 0) and hi (default len(a)) bound the
    slice of a to be searched.
    """

    if lo < 0:
        raise ValueError('lo must be non-negative')
    if hi is None:
        hi = len(a)
    while lo < hi:
        mid = (lo+hi)//2
        if a[mid] < x: lo = mid+1
        else: hi = mid
    return lo
```