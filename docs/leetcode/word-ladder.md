---
layout: default
title: Word Ladder
parent: Leetcode
date: 2020-02-22
---

# Word ladder

[leetcode/word-ladder](https://www.leetcode.com/problems/word-ladder/)

## Code

- O(N^2) : 60m

```python
from collections import defaultdict

class Solution:
    def ladderLength(self, beginWord, endWord, wordList):
        if endWord not in wordList or len(beginWord) != len(endWord):
            return 0
        trans_map = defaultdict(list)
        L = len(beginWord)
        for word in wordList:
            for i in range(L):
                trans_map[word[:i] + '*' + word[i+1:]].append(word)
        print("finish transmap")

        queue = [beginWord]
        visit_map = { word : False for word in wordList + [beginWord] }
        answer = 1
        while queue:
            next_queue = []
            for word in queue:
                if visit_map[word]:
                    continue
                visit_map[word] = True
                if word == endWord:
                    return answer
                for i in range(L):
                    next_queue += trans_map[word[:i] + '*' + word[i + 1:]]
            answer += 1
            queue = next_queue
        return 0
```