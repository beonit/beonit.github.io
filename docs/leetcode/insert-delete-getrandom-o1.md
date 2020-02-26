---
layout: default
title: Insert Delete GetRandom O(1)
parent: Leetcode
date: 2020-02-23
---

# Insert Delete GetRandom O(1)

[leetcode/insert-delete-getrandom-o1](https://www.leetcode.com/problems/insert-delete-getrandom-o1/)

## Code

- O(1) : 104 ms, faster than 56.75% of Python3 online submissions

```python
import random

class RandomizedSet:

    def __init__(self):
        self.stack = []
        self.dict = {}

    def insert(self, val: int) -> bool:
        if val in self.dict:
            return False
        self.dict[val] = len(self.stack)
        self.stack.append(val)
        return True

    def remove(self, val: int) -> bool:
        if val not in self.dict:
            return False
        pos = self.dict[val]
        lastPos = len(self.stack) - 1
        lastVal = self.stack[lastPos]
        self.stack[pos] = lastVal
        self.stack.pop(-1)
        self.dict[lastVal] = pos
        self.dict.pop(val, None)
        return True

    def getRandom(self) -> int:
        randomIdx = random.randrange(0, len(self.stack))
        return self.stack[randomIdx]
```