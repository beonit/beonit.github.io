---
layout: default
title: Search a 2D matrix II
parent: Leetcode
date: 2020-02-17
---

# Search a 2D matrix II

[leetcode/search-a-2d-matrix-ii](https://www.leetcode.com/problems/search-a-2d-matrix-ii/)

## Code

- O(N^2) : 60m

```python
class Solution:
    def searchMatrix(self, matrix, target):
        if matrix and matrix[0]:
            height, width = len(matrix), len(matrix[0])
            row, col = 0, width - 1
            while 0 <= row < height and 0 <= col < width:
                cell = matrix[row][col]
                if cell == target:
                    return True
                elif cell < target:
                    row += 1
                else:
                    col -= 1
        return False


def assertEquals(expected, actual):
    if expected == actual:
        print(actual)
    else:
        print("FAIL", expected, actual)

matrix = [
  [1,   4,  7, 11, 15],
  [2,   5,  8, 12, 19],
  [3,   6,  9, 16, 22],
  [10, 13, 14, 17, 24],
  [18, 21, 23, 26, 30]
]

s = Solution()

assertEquals(True, s.searchMatrix(matrix, 5))
assertEquals(True, s.searchMatrix(matrix, 14))
assertEquals(False, s.searchMatrix(matrix, 20))
assertEquals(False, s.searchMatrix(matrix, 33))
assertEquals(False, s.searchMatrix([[]], 0))
assertEquals(False, s.searchMatrix([], 0))


[[1, 2, 3, 4, 5],
 [6, 7, 8, 9, 10],
 [11,12,13,14,15],
 [16,17,18,19,20],
 [21,22,23,24,25]]

assertEquals(True, s.searchMatrix(matrix, 15))
```