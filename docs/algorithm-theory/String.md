---
layout: default
title: String
parent: Algorithm theory
date : 2020-02-10
nav_order: 99
---

## 나이브 매칭

## 해싱

## Java Hash 함수

```java
public int hashCode() {
    int h = hash;
    if (h == 0 && value.length > 0) {
        char val[] = value;
        for (int i = 0; i < value.length; i++) {
            h = 31 * h + val[i];
        }
        hash = h;
    }
    return h;
}
```

### 해시 함수를 활용한 슬라이딩 윈도우

짧게 요약하면 : `h = h * 31 + value` 이다.  
abc 는 `(((31)+a)*31+b)*31` 이 된다.  a 의 ascii 값이 97 이니까 값은 96354 이 된다.  
식을 풀어보면 아래와 같다. `(31 * 31 * 31) + (a * 31 * 31) + (b * 31) + (c)` 가 된다.  
만약 맨앞의 a 를 제거하고 맨 뒤에 d 를 추가 하려면 아래와 같은 식을 사용하면 된다. `(h - (a * 31 * 31)) * 31 + d`

## KMP

## boyer moore

## lz77/78

## burrows wheeller

## LCP - 다중 패턴 매칭


