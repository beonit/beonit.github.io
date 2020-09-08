---
layout: default
title: Rotting Oranges
parent: Leetcode
grand_parent: Problem Solving
date: 2020-02-18
---

# Rotting Oranges

[leetcode/rotting-oranges](https://www.leetcode.com/problems/rotting-oranges/)

## Code


```python
class Solution:
    def orangesRotting(self, grid):
        if grid and grid[0]:
            height = len(grid)
            width = len(grid[0])
            
            queue = []
            for row in range(0, height):
                for col in range(0, width):
                    if grid[row][col] == 2:
                        queue.append((row, col))
            answer = 0

            while queue:
                newQueue = []
                for row, col in queue:
                    if grid[row][col] != 2:
                        continue
                    for dy, dx in [(-1, 0), (0, 1), (1, 0), (0, -1)]:
                        nextY = row + dy
                        nextX = col + dx
                        if 0 <= nextY < height and 0 <= nextX < width and grid[nextY][nextX] == 1:
                            grid[nextY][nextX] = 2
                            newQueue.append((nextY, nextX))
                queue = newQueue
                if queue:
                    answer += 1

            for row in grid:
                for col in row:
                    if col == 1:
                        return -1
            return answer
        else:
            return 0
```