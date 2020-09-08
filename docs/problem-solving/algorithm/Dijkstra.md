---
layout: default
title: Dijkstra
parent: Algorithm
grand_parent: Problem Solving
date: 2020-02-12
---

# Dijkstra

인터넷에 돌아다니는 자바와 파이선 구현의 차이점이 있다.

- Java : 인접 행열 사용, 힙을 사용하지 않음
- Python : 인접 리스트 사용, 힙 사용

알고리즘 성능 면에서 인접리스트, 힙 이 압도적으로 유리하다. 힙을 사용하면 다음 노드를 선택할 때 비용이 O(1) 이기 때문이다. 이 차이로 문제 해결이 갈리기도 한다.  
아마도 자바 샘플 코드는 다익스트라 개념 자체에 집중하여 코드를 작성 하느라 그러는 것 같다. 자바에서 인접리스트, 힙, SimpleMap 것을 구현하려면 이것저것 머리 아픈게 많기는 하다.  
반면 파이선은 그럴 필요가 전혀 없다. heapq 와 tuple 이 특별한 교육 없이 코드에 녹아진다.  

## Java Dijkstra 구현 (인접리스트, Heap 사용)

Head 와 edge 를 이용해서 linked list 를 구현한 이유는 컬렉션을 일절 사용하지 못하게 제한했기 때문이다. 그래서 heap 도 직접 구현했다.

```java
static void djikstra() {
    long[] costarr = new long[N + 1];
    for (int i = 0; i < N + 1; i++) {
        costarr[i] = Long.MAX_VALUE;
    }

    heap = new long[M][2];
    heapSize = 0;

    heapPush(0, 1);
    costarr[1] = 0;
    boolean[] visited = new boolean[N + 1];
    while (heapSize > 0) {
        int from = (int) heapPop()[1];
        if (!visited[from]) {
            visited[from] = true;
            for (Edge e = map[from].head; e != null; e = e.next) {
                if (visited[e.dest] || e.cost == 0)
                    continue;
                long cost = costarr[from] + e.cost;
                if (cost < costarr[e.dest]) {
                    costarr[e.dest] = cost;
                    heapPush(cost, e.dest);
                }
            }
        }
    }
}

private class Edge {
    int to;
    int cost;
    Edge next;
}

private class Head {
    Edge head;
    Edge tail;
    void add(Edge e) {
        if (head == null) {
            head = e;
            tail = e;
        } else {
            tail.next = e;
            tail = e;
        }
    }
}

static long heap[][];
static int heapSize = 0;
static int MAX_SIZE = 500000;

static void heapPush(long cost, int dest) {
    long[] heapItem = new long[2];
    heapItem[0] = cost;
    heapItem[1] = dest;
    heapPush(heapItem);
}

static void heapPush(long[] value) {
    if (heapSize + 1 > MAX_SIZE) {
        return;
    }

    heap[heapSize] = value;

    int current = heapSize;
    while (current > 0 && heap[current][0] < heap[(current - 1) / 2][0]) {
        long[] temp = heap[(current - 1) / 2];
        heap[(current - 1) / 2] = heap[current];
        heap[current] = temp;
        current = (current - 1) / 2;
    }

    heapSize = heapSize + 1;
}

static long[] heapPop() {
    if (heapSize <= 0) {
        return null;
    }

    long[] value = heap[0];
    heapSize = heapSize - 1;

    heap[0] = heap[heapSize];

    int current = 0;
    while (current < heapSize && current * 2 + 1 < heapSize) {
        int child;
        if (current * 2 + 2 >= heapSize) {
            child = current * 2 + 1;
        } else {
            child = heap[current * 2 + 1][0] < heap[current * 2 + 2][0] ? current * 2 + 1 : current * 2 + 2;
        }

        if (heap[current][0] < heap[child][0]) {
            break;
        }

        long[] temp = heap[current];
        heap[current] = heap[child];
        heap[child] = temp;

        current = child;
    }
    return value;
}
```
