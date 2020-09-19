---
layout: default
title: Course Schedule II
parent: Leetcode
grand_parent: Problem Solving
date: 2020-09-19
---

## Course Schedule II

[leetcode/course-schedule-ii](https://leetcode.com/problems/course-schedule-ii/)

## Code

- O(N^2) : 116 ms, faster than 46.25% of Python3 online submissions for Course Schedule II.

```python
class Solution:
    def findOrder(self, numCourses: int, prerequisites):
        if numCourses == 0:
            return []
        # Count indgree
        indegrees = [set() for _ in range(numCourses)]
        outdegrees = [set() for _ in range(numCourses)]
        for edge in prerequisites:
            postsubj, presubj = edge[0], edge[1]
            indegrees[postsubj].add(presubj)
            outdegrees[presubj].add(postsubj)
        print(f"in  : {indegrees}")
        print(f"out : {outdegrees}")
        # setup rootset
        queue = []
        for idx, postsubj in enumerate(indegrees):
            if len(postsubj) == 0:
                queue.append(idx)
        # decrease degree
        result = []
        while queue:
            root = queue.pop(0)
            result.append(root)
            for postsubj in outdegrees[root]:
                node = indegrees[postsubj]
                if root in node:
                    node.remove(root)
                    if len(node) == 0:
                        queue.append(postsubj)
            # print(f"----")
            # print(f"in  : {indegrees}")
            # print(f"out : {outdegrees}")
            # print(f"res : {result}")
        if len(result) != numCourses:
            return -1
        return result
```
