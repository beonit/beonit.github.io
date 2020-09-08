---
layout: default
title: KMP
parent: Algorithm
grand_parent: Problem Solving
date: 2020-02-12
---

# KMP

문자열에서 특정 부분 문자열을 찾는데 O(m+n) 시간만 소요되는 알고리즘

## java

```java
public int FindString(int N, String A, int M, String B) {
    char[] src = A.toCharArray();
    char[] ptn = B.toCharArray();
    
    int[] failure = failureFunction(ptn);
    
    int answer = 0;
    int idx = 0;
    int pIdx = 0;
    while (idx < N) {
        if (src[idx] == ptn[pIdx]) {
            pIdx += 1;
            idx += 1;
        }
        if (pIdx == ptn.length) {
            answer += 1;
            pIdx = failure[pIdx - 1];
        } else if (idx < N && ptn[pIdx] != src[idx]) {
            if (pIdx != 0) {
                pIdx = failure[pIdx - 1];
            } else {
                idx++;
            }
        }
    }
    return answer;
}


private int[] failureFunction(char[] ptn) {
    int[] arr = new int[ptn.length];
    int match = 0;
    arr[0] = 0;
    int idx = 1;
    while (idx < ptn.length) {
        if (ptn[match] == ptn[idx]) {
            match += 1;
            arr[idx] = match;
            idx += 1;
        } else {
            if (match > 0) {
                match = arr[match - 1];
            } else {
                arr[idx] = 0;
                idx++;
            }
        }
    }
    return arr;
}
```
