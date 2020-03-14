---
layout: default
title: Group Anagrams
parent: Leetcode
date: 2020-02-22
---

# Group Anagrams

[leetcode/group-anagrams](https://www.leetcode.com/problems/group-anagrams/)

파이선은 대소문자 규칙이 이상하다 defaultdict 는 모두 소문자고 Counter 의 C 는 대문자다.

## Code

- O(N^2) : 100 ms, faster than 72.72% of Python3 online submissions

```python
from collections import defaultdict

class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        strs = [("".join(sorted(word)), word) for word in strs]
        anagrams = defaultdict(list)
        for anagram, word in strs:
            anagrams[anagram].append(word)
        return [wordlist for anagram, wordlist in anagrams.items()]
```