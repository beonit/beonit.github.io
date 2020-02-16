---
layout: default
title: Number of Islands
parent: Leetcode
date: 2020-02-16
published: false
---

# Number of Islands

[leetcode/number-of-islands](https://www.leetcode.com/problems/number-of-islands/)

## Code

- O(4N) : 148 ms, faster than 61.39% of Python3
- 의외로 큐를 쓰고 recursion 을 줄인다고 해서 성능에 큰 영향을 미치지 않는다.

```python
class Solution:
    def numIslands(self, grid):
        answer = 0
        if (len(grid) == 0):
            return
        width = len(grid[0])
        height = len(grid)
        visited = x = [[False for i in range(width)] for j in range(height)]
        offsets = [(-1, 0), (0, 1), (1, 0), (0, -1)]

        def fill(grid, visited, y, x):
            queue = [(y, x)]
            while queue:
                nextY, nextX = queue.pop(0)
                for offset in offsets:
                    nearY, nearX = nextY + offset[0], nextX + offset[1]
                    if 0 <= nearY < height and 0 <= nearX < width and not(visited[nearY][nearX]):
                        visited[nearY][nearX] = True
                        if grid[nearY][nearX] == '1':
                            queue.append((nearY, nearX))
    
        for y in range(0, height):
            for x in range(0, width):
                if not(visited[y][x]) and grid[y][x] == '1':
                    fill(grid, visited, y, x)
                    answer += 1
        return answer

                    
map = [list("11110"),
       list("11010"),
       list("10100"),
       list("00011")]
solution = Solution()
answer = solution.numIslands(map)
print(answer)
```