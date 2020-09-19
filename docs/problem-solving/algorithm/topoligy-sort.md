---
layout: default
title: Topoligy Sort
parent: Algorithm
grand_parent: Problem Solving
date: 2020-09-19
---

## 위상 정렬

- 순서가 정해진 작업의 순서를 결정하는 알고리즘
- Directed Acyclic Graph (DAG) 를 정렬한다
- 비교 방법등에 의해서 최종 값이 달라질 수 있다

## Khan algorithm (큐를 이용하는 방법)

Algorithm: Steps involved in finding the topological ordering of a DAG:

1. Compute in-degree (number of incoming edges) for each of the vertex present in the DAG and initialize the count of visited nodes as 0.
1. Pick all the vertices with in-degree as 0 and add them into a queue (Enqueue operation)
1. Remove a vertex from the queue (Dequeue operation) and then.
   1. Increment count of visited nodes by 1.
   1. Decrease in-degree by 1 for all its neighboring nodes.
   1. If in-degree of a neighboring nodes is reduced to zero, then add it to the queue.
1. Repeat Step 3 until the queue is empty.

## 참고 문제

[leetcode/course-schedule-ii]({% /docs/leetcode/course-schedule-ii  %})
