---
layout: default
title: Convex-hull
parent: Algorithm
date: 2020-02-14
---

## Jarvis match algorithm

Convex hull 를 O(N^2) 시간 복잡도로 찾을 수 있다.  
Point 가 convex hull 위 에 있는 경우 convex hull 에 포함된다.

[Geeks for geeks](https://www.geeksforgeeks.org/convex-hull-set-1-jarviss-algorithm-or-wrapping/)

```java
public static int jarvis(int[][] points) {
    int size = points.length;

    int l = 0;
    for (int i = 0; i < size; i++) {
        if (points[l][0] > points[i][0]) {
            l = i;
        }
    }

    int[] hull = new int[size];
    int k = 0;

    int p = l;
    do {
        hull[k++] = p;
        int q = (p + 1) % size;
        for (int i = 0; i < size; i++) {
            if (p == i || q == i)
                continue;
            boolean turnLeft = orientation(points[p], points[i], points[q]) == 2;
            if (turnLeft)
                q = i;
        }
        p = q;
    } while (p != l);

    return k;
}

// 0 : colineear
// clockwise : 1
// counter clockwise : 2
public static int orientation(int[] p, int[] q, int[] r) {
    int val = (q[1] - p[1]) * (r[0] - q[0]) - (q[0] - p[0]) * (r[1] - q[1]);
    if (val == 0)
        return 0; // collinear
    return (val > 0) ? 1 : 2; // clock or counterclock wise
}
```
