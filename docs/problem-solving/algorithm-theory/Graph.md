---
layout: default
title: Graph
parent: Algorithm theory
grand_parent: Problem Solving
date : 2020-02-06
---

## 그래프 이론

- DAG
- 플루이드 워셜 알고리즘
- 모든 노드에 대한 모든 노드의 최단거리 문제
- 최장거리는 N^2 DFS 외에는 답이 없다.

## MST

- 크루스칼 알고리즘
  - 엣지 중심 알고리즘
  - Edge 를 정렬하고 `find&union` 알고리즘으로 엣지를 추가한다.
  - 그룹이 1개 인데 어째서인지 boolean 배열로 처리하면 제대로 동작하지 않는다.

- Prim 알고리즘
  - 노드 중심 알고리즘

## 플로이드-워셜 알고리즘 (Floyd-Warshall Algorithm)

## 최대 유량 알고리즘 (Network flow, MIP)
