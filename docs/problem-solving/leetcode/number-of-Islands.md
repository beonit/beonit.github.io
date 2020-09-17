---
layout: default
title: Number of Islands
parent: Leetcode
grand_parent: Problem Solving
date: 2020-09-16
---

# Number of Islands

[leetcode/Number of Islands](https://leetcode.com/problems/number-of-islands/)

## Code

- O(N) : 224 ms, faster than 17.97% of Python3 online submissions for Number of Islands.

```python
class Solution:
    def numIslands(self, grid) -> int:
        height = len(grid)
        if height <= 0:
            return 0
        width = len(grid[0])
        if width <= 0:
            return 0
        seen = []
        for _ in range(height):
            seen.append([False] * width)

        def fill_island(y, x):
            stack = [(y, x)]
            while stack:
                y, x = stack.pop()
                seen[y][x] = True
                for dy, dx in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
                    ny, nx = y + dy, x + dx
                    if 0 <= ny < height and 0 <= nx < width and not seen[ny][nx] and grid[ny][nx] == "1":
                        stack.append((ny, nx))
            pass
        numOfIsland = 0
        for y in range(height):
            for x in range(width):
                if not seen[y][x] and grid[y][x] == "1":
                    fill_island(y, x)
                    numOfIsland += 1
        return numOfIsland
```
