---
layout: default
title: Computational Geometry
parent: Algorithm theory
date : 2020-02-12
---

# 계산 기하학

## 내용정리

### 벡터 계산 방법

- https://www.varsitytutors.com/hotmath/hotmath_help/topics/adding-and-subtracting-vectors

### 벡터 계산 코드

python 에서는 tuple 로 계산하면 된다.

```java
private static boolean samePoint(int[] p, int[] q) {
    if (p[0] == q[0] && p[1] == q[1]) {
        return true;
    } else {
        return false;
    }
}

private static final int ccw(int[] p, int[] q) {
    return p[0] * q[1] - p[1] * q[0];
}

private static final int ccw(int[] r, int[] p, int[] q) {
    return ccw(vsubtract(p, r), vsubtract(q, r));
}

private static int[] vsum(int[] p, int[] q) {
    int[] r = new int[2];
    r[0] = p[0] + q[0];
    r[1] = p[1] + q[1];
    return r;
}

private static int[] vsubtract(int[] p, int[] q) {
    int[] r = new int[2];
    r[0] = p[0] - q[0];
    r[1] = q[1] - q[1];
    return r;
}

private static boolean turnLeft(int[] r, int[] p, int[] q) {
    return ccw(r, p, q) > 0;
}

private static boolean turnRight(int[] r, int[] p, int[] q) {
    return ccw(r, p, q) < 0;
}

// 회전 방향이 일직선 인지 여부
private static boolean colinear(int[] p, int[] q) {
    return ccw(p, q) == 0;
}

private static boolean colinear(int[] a, int[] b, int[] c) {
    return colinear(a, b) && colinear(b, c);
}

private static boolean between(int[] a, int[] b, int[] c) {
    if (!colinear(a, b, c)) {
        return false;
    } else {
        // 수직선이 아니면
        if (a[0] != b[0]) {
            return a[0] <= c[0] && c[0] <= b[0] || b[0] <= c[0] && c[0] <= a[0];
        } else {
            return a[1] <= c[1] && c[1] <= b[1] || b[1] <= c[1] && c[1] < a[1];
        }
    }
}

private static int direction(int[] a, int[] b, int[] c) {
    int ccw = ccw(a, b, c);
    if (ccw < 0)
        return -1;
    if (ccw > 0)
        return 1;
    return 0;
}

// 선분의 끝점이 교차되는 경우를 제외
private static boolean intersecProp(int a[], int b[], int c[], int d[]) {
    return direction(a, b, c) * direction(a, b, d) < 0 && direction(c, d, a) * direction(c, d, b) < 0;
}

// 선분의 끝점이 교차되는 경우를 포함
private static boolean intersec(int a[], int b[], int c[], int d[]) {
    return direction(a, b, c) * direction(a, b, d) <= 0 && direction(c, d, a) * direction(c, d, b) <= 0;
}
```

### 선분 교차 검사

## 문제

### 다각형의 면적

### 점의 다각형 포함 확인

### 블록 외피 (Convex hull)

- 점 : n
- BF : 점두개를 연결하는 모든 조합 N^2, 선을 모든 점에 테스트 N^3
- convex hull : 점을 모두 연결하는 가장 작은 볼록 다각형 (극단점)
- 점 그룹을 모두 포함하는 convex hull 을 잡고, 다각형이 충돌하는지 --> N^2
- 예외 : 점이 내부에 있는 경우
- jarvis match algorithm : (N^2)
  - [Geeks for geeks](https://www.geeksforgeeks.org/convex-hull-set-1-jarviss-algorithm-or-wrapping/)
  - increment algorithm : x 좌표로 정렬후 하나씩 추가. NLogN 로 해결한다.
- Graham's Scan : O(NlogN) - 설명이 어렵다
  - [우리말 설명](https://www.crocus.co.kr/1288)
  - [Geeks for geeks](https://www.geeksforgeeks.org/convex-hull-set-2-graham-scan/)

### 최근접쌍 (Closest pair of point)

- BF : N^2
- 분할 정복 : merge 할 때 시간 복잡도가 N 이 나와야 한다.

### 직사각형의 합집합

- 평면소거법 (Plane sweeping)

### 선 맞춤 (Line fitting)