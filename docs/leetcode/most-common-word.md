---
layout: default
title: Most common word
parent: Leetcode
date: 2020-02-20
---

# Most common word

[leetcode/most-common-word](https://www.leetcode.com/problems/most-common-word/)

## Code

- O() : 32 ms, faster than 69.89% of Python3

```python
from collections import Counter
import re

class Solution:
    def mostCommonWord(self, paragraph: str, banned) -> str:
        paragraph = re.split("[!?',;. ]", paragraph.lower())
        paragraph = [word for word in paragraph if word not in banned and word != '']
        return max(Counter(paragraph).items(), key = lambda item: item[1])[0]
```