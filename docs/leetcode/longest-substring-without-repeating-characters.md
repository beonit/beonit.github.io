---
layout: default
title: Longest Substring Without Repeating Characters
parent: Leetcode
date: 2020-02-15
---

# Longest Substring Without Repeating Characters

[leetcode/longest-substring-without-repeating-characters](https://www.leetcode.com/problems/longest-substring-without-repeating-characters/)

## Code

- O(N) : 76 ms, faster than 41.03% (느리다)

```python
class Solution:
    def lengthOfLongestSubstring(self, s):
        answer = 0
        size = 0
        bIdx = 0
        shown = defaultdict(int)
        for fIdx, ch in enumerate(s):
            size += 1
            shown[ch] += 1
            while bIdx < fIdx and shown[ch] > 1:
                shown[s[bIdx]] -= 1
                bIdx += 1
                size -= 1
            answer = max(size, answer)
        return answer
```

```python
src = "abcabcbb"
answer = Solution().lengthOfLongestSubstring(src)
print(answer)

src = "bbbbb"
answer = Solution().lengthOfLongestSubstring(src)
print(answer)

src = "pwwkew"
answer = Solution().lengthOfLongestSubstring(src)
print(answer)

src = ""
answer = Solution().lengthOfLongestSubstring(src)
print(answer)
```