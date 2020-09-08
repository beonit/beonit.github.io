---
layout: default
title: Quick sort
parent: Algorithm
grand_parent: Problem Solving
date: 2020-01-31
---

{{page.date}}

# Quick sort

퀵 정렬은 평균적으로 가장 빠르고, 이해하기도 쉬운 정렬 알고리즘이다.
이 알고리즘의 핵심 알고리즘은 partition 이다. 흔히 pivot 이라고 부르는 메소드다.
partition algorithm 은 Lumuto, hoare 두개의 방법이 존재한다. 최악의 경우에서 hoare 가 더 좋은 성능을 가진다.

하지만, hoare 는 구현하기 굉장히 까다롭다. 막상 구현해보면 쉽게 코드를 완성하는 경우가 거의 없다. 반면, lumuto 는 쉽게 완성 시킬 수 있다. 프로그래머는 언제나 유지보수 하기 좋은 코드를 선택해야 한다.
그래서 나는 Lumuto 를 partition 을 선호한다. 이해하기 쉽고 디버깅 하기도 쉬워 오류가 적다.

## lumuto partition quick sort

### Python

```python
import random

def pivot(arr, left, right):
    pivot = arr[right]
    low = left
    for i in range(left, right):
        if arr[i] < pivot:
            arr[low], arr[i] = arr[i], arr[low]
            low += 1
    arr[low], arr[right] = arr[right], arr[low]
    return low

def qsort(arr, left, right):
    mid = pivot(arr, left, right)
    if left < mid - 1:
        qsort(arr, left, mid - 1)
    if mid + 1 < right:
        qsort(arr, mid + 1, right)

for _ in range(100000):
    arr = [random.randint(1, 100) for _ in range(10)]
    expect = sorted(arr)
    qsort(arr, 0, len(arr) - 1)
    assert arr == expect
```

### Java

```java
private int pivot(long[] arr, int lo, int hi) {
    long pivot = arr[hi];
    int i = lo;
    for (int j = lo; j < hi; j++) {
        if (arr[j] < pivot) {
            long tmp = arr[i];
            arr[i] = arr[j];
            arr[j] = tmp;
            i++;
        }
    }
    long tmp = arr[i];
    arr[i] = arr[hi];
    arr[hi] = tmp;
    return i;
}

private void qsort(long[] arr, int lo, int hi) {
    int mid = pivot(arr, lo, hi);
    if (mid + 1 < hi) {
        qsort(arr, mid + 1, hi);
    }
    if (lo < mid - 1) {
        qsort(arr, lo, mid - 1);
    }
}
```