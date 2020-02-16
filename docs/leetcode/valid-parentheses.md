---
layout: default
title: Valid Parentheses
parent: Leetcode
date: 2020-02-15 00:00
---

# Title

[leetcode/valid-parentheses](https://www.leetcode.com/problems/valid-parentheses/)

## Code

- O(N) : 28 ms

```python
class Solution:
    def isValid(self, src):
        openChars = set(['(', '{', '['])
        match = {']': '[', ')': '(', '}': '{'}
        stack = []
        for c in src:
            if c in openChars:
                stack.append(c)
            else:
                if stack and stack[-1] == match[c]:
                    stack.pop()
                else:
                    return False
        return len(stack) == 0


def assertEquals(expected, actual):
    if expected == actual:
        print(actual)
    else:
        print(expected, actual)


solution = Solution()
assertEquals(True, solution.isValid("()"))
assertEquals(True, solution.isValid("()[]{}"))
assertEquals(False, solution.isValid("(]"))
assertEquals(False, solution.isValid("([)]"))
assertEquals(True, solution.isValid("{()}"))
assertEquals(False, solution.isValid("]"))
assertEquals(False, solution.isValid("["))
```