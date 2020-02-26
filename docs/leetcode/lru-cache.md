---
layout: default
title: LRU Cache
parent: Leetcode
date: 2020-02-22
---

# LRU cache

[leetcode/lru-cache](https://www.leetcode.com/problems/lru-cache/)  

더블 링크드 리스트 + Dictionary 로 해결했다.

알고리즘의 자체 성능은 O(1) 인데 구현에서 많은 낭비가 있는것 같다. Collections 의 OrderedDict 보다 느리다. OrderedDict 도 DLinkedList 로 구현되어 있나보다.

구현에서 상당한 시간을 소비했다. 익숙한 로직들은 함수 도움 없이 짜도 되는데, double linked 는 오랜만에 짜다보니 실수가 많이 나와서 힘들었다. 결국 함수를 분리하고 가독성 좋게 클래스를 분리해서 해결을 했다.

## Code

- O(1) : 236 ms, faster than 30.77% of Python3 online submissions

```python
class Node:
    def __init__(self, key, val):
        self.prev = None
        self.next = None
        self.val = val
        self.key = key

class Head:
    def __init__(self):
        self.node = None

class LRUCache:
    
    def __init__(self, capacity: int):
        self.head = Head()
        self.tail = Head()
        self.dict = {}
        self.capacity = capacity

    def _remove(self, node):
        if self.head.node == node:
            self.head.node = node.next
        if self.tail.node == node:
            self.tail.node = node.prev
        if node.prev:
            node.prev.next = node.next
        if node.next:
            node.next.prev = node.prev
    
    def _add(self, node):
        oldTail = self.tail.node
        if oldTail:
            oldTail.next = node
        node.prev = oldTail
        node.next = None
        self.tail.node = node
        if not self.head.node:
            self.head.node = node

    def get(self, key: int) -> int:
        if key in self.dict:
            node = self.dict[key]
            self._remove(node)
            self._add(node)
            return node.val
        else:
            return -1

    def put(self, key: int, value: int) -> None:
        if key in self.dict:
            node = self.dict.pop(key, None)
            self._remove(node)
        if len(self.dict) == self.capacity:
            node = self.head.node
            self.dict.pop(node.key)
            self._remove(node)
        node = Node(key, value)
        self._add(node)
        self.dict[key] = node
```