---
layout: default
title: Reorder Data in Log Files
parent: Leetcode
grand_parent: Problem Solving
date: 2020-02-20
---

# Reorder Data in Log Files

[leetcode/reorder-data-in-log-files](https://www.leetcode.com/problems/reorder-data-in-log-files/)

## Code

- O(NlogN) : 32 ms, faster than 82.63% of Python3 online submissions

```python
class Solution:
    def reorderLogFiles(self, logs: List[str]) -> List[str]:
        logs = [log.split(" ") for log in logs]
        
        numericLogs = []
        letterLogs = []
        for log in logs:
            if log[1].isdigit():
                numericLogs.append(" ".join(log))
            else:
                letterLogs.append((log[0], " ".join(log[1:])))
        letterLogs.sort(key = lambda pair: (pair[1], pair[0]))
        letterLogs = [idetifier + " " + logs for idetifier, logs in letterLogs]
        return letterLogs + numericLogs
```
