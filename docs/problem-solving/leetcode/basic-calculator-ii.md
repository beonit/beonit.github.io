---
layout: default
title: Basic Calculator II
parent: Leetcode
grand_parent: Problem Solving
date: 2020-09-17
---

# Basic Calculator II

[leetcode/basic-calculator-ii](https://leetcode.com/problems/basic-calculator-ii/)

## Code

- 144 ms

```python
class Solution:
    def calculate(self, s: str) -> int:
        s = s.replace(" ", "")
        def findOpIdx(s, ops):
            for idx, c in reversed(list(enumerate(s))):
                if c in ops:
                    return idx, c
            return -1, None
        stack = [s]
        while stack:
            s = s.pop()
            idx, op = findOpIdx(s, ['+', '-'])
            if not op:
                idx, op = findOpIdx(s, ['*', '/'])
            if op:
                left = self.calculate(s[:idx])
                right = self.calculate(s[idx + 1:])

            # print(f"> {left} {op} {right}")
            if op == '+':
                return left + right
            elif op == '-':
                return left - right
            elif op == '*':
                return left * right
            elif op == '/':
                return left // right
            else:
                exit(1)
        return int(s)
```
