---
layout: default
title: Problem Solving
nav_order: 4
has_children: true
permalink: /docs/problem-solving
---

# Problem solving

문제풀이 연습
{: .fs-6 .fw-300 }

## 내 문제점

문제를 제대로 파악하지 않고 코딩을 시작해서 잘못된 구현으로 허비하는 시간이 많다. 구현을 하기 전에 잘못된 걸 확인할 수 있어야 한다. 모든걸 다 연습할 수는 없다.

## 알아두면 좋은 값

- 소수 : 7, 31
  - `1,000,000,007 : 10^9+7 (1000000000 + 7 == 1000000007)`
- 알파벳 : 26글자
- a 의 ascii 값 : 97

- Min/Max value
```java
Integer.MAX_VALUE =  2147483647
Integer.MIN_VALUE = -2147483648
Long.MAX_VALUE =  9223372036854775807
Long.MIN_VALUE = -9223372036854775808
```

## 제약 조건 분석

- 시간 복잡도
  - N = 100,000 은 시간 복잡도 N^2 에 해결 가능하다.
- 공간 복잡도 `100,000`
  - matrix 불가능 : `10,000,000,000` 이다. int 면 `40,000,000,000` byte, `40GByte`
  - array 다수 가능 : `100,000`

