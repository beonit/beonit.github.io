---
layout: default
title: Basic Calculator II
parent: Leetcode
grand_parent: Problem Solving
date: 2020-09-15
---

# Basic Calculator II

[leetcode/basic-calculator-ii](https://www.leetcode.com/problems/basic-calculator-ii/)


## Code

- O(N) : 144 ms, faster than 32.91% of Python3 online submissions for Basic Calculator II.

```python
class Solution:
    def calculate(self, s: str) -> int:
        s = s.replace(" ", "")
        sign = '+'
        num = 0
        stack = [0]
        for i in range(len(s)):
            c = s[i]
            if '0' <= c <= '9':
                num = num * 10 + int(c)
                if i != len(s) - 1:
                    continue
            if sign == '+':
                stack.append(num)
            elif sign == '-':
                stack.append(-num)
            elif sign == '*':
                stack[-1] = stack[-1] * num
            elif sign == '/':
                stack[-1] = int(stack[-1] / num)
            sign = c
            num = 0
        return sum(stack)
```

