---
layout: default
title: Union find
parent: Algorithm
date: 2020-02-12 00:00
---

# Union find

Graph 에서 노드들을 그룹화 할 때 사용하는 알고리즘.  
주의. union 시 순서를 지정하지 않고 저장할 경우 느리다.

## java

```java
int[] root;

public void initRoot() {
    root = new int[numOfN + 1];
    for (int i = 0; i < numOfN + 1; i++) {
        root[i] = i;
    }
}
public int find(int k) {
    if (root[k] == k) {
        return k;
    } else {
        return find(root[k]);
    }
}

public void union(int a, int b) {
    a = find(a);
    b = find(b);
    if (a != b) {
        if (a < b) {
            root[a] = b;
        } else {
            root[b] = a;
        }
    }
}
```

## Java - without recursion

위의 경우에 recusion 때문에 성능이 떨어진다. find 를 loop 로 충분히 처리 가능하다.

```java
for (;root[n1] != n1; n1 = root[n1]);
for (;root[n2] != n2; n2 = root[n2]);
```
