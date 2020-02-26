---
layout: default
title: LFU Cache
parent: Leetcode
date: 2020-02-26
---

# LFU Cache

[leetcode/lfu-cache](https://www.leetcode.com/problems/lfu-cache/)

## Dict + Double linked list

- O(n) : 8660 ms
- LRU 캐시와 같은 전략으로 문제를 풀었다.
- 통과는 했지만 시간 복잡도가 생각보다 나쁜지 성능이 매우 나쁘게 나왔다.
- 아마, 비슷비슷한 Access 횟수를 가진 원소들이 많은 테스트 케이스가 있기 때문일 것이다.
- Heap 을 사용한 방법을 사용하면 lru 을 처리할 때 더 많이 신경 써야 한다.

```python
class Node:
    def __init__(self, key, val):
        self.next = None
        self.prev = None
        self.freq = 0
        self.val = val
        self.key = key


class Head:
    def __init__(self):
        self.head = None
        self.tail = None

    def push(self, node):
        if self.head:
            oldHead = self.head
            oldHead.prev = node
            self.head = node
            self.head.next = oldHead
        else:
            self.head = node
            self.tail = node
        pass

    def pop(self):
        if self.head == self.tail:
            node = self.head
            self.head = None
            self.tail = None
        else:
            node = self.head
            nextHead = self.head.next
            nextHead.prev = None
            self.head = nextHead
            node.next = None
            node.prev = None
        return node

    def swap(self, node1, node2):
        prevNode = node1.prev
        nextNode = node2.next
        if node1 is self.head:
            self.head = node2
        if node2 == self.tail:
            self.tail = node1
        if prevNode:
            prevNode.next = node2
        if nextNode:
            nextNode.prev = node1
        node1.next = nextNode
        node1.prev = node2
        node2.next = node1
        node2.prev = prevNode


class LFUCache:
    def __init__(self, capacity):
        self.head = Head()
        self.dict = {}
        self.capacity = capacity
        pass

    def put(self, key, val):
        if key in self.dict:
            node = self.dict[key]
            node.val = val
            node.freq += 1
            while node.next and node.freq >= node.next.freq:
                self.head.swap(node, node.next)
        else:
            node = Node(key, val)
            if len(self.dict) == self.capacity:
                oldNode = self.head.pop()
                if oldNode:
                    self.dict.pop(oldNode.key, None)
            if len(self.dict) < self.capacity:
                self.dict[key] = node
                self.head.push(node)
                while node.next and node.freq >= node.next.freq:
                    self.head.swap(node, node.next)

    def get(self, key):
        if key in self.dict:
            node = self.dict[key]
            node.freq += 1
            while node.next and node.freq >= node.next.freq:
                self.head.swap(node, node.next)
            return node.val
        else:
            return -1


def assertEquals(exp, act):
    if exp != act:
        print(exp, act)
```

## Heap
