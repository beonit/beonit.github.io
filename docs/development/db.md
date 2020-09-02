---
layout: default
title: Database
parent: Development
date: 2020-09-02
---

## Partitioning

- Vertical - Column 분리
- Horizontal - Row 분리

### Shard

database shard is a horizontal partition of data in a database or search engine.

### 데이터베이스 샤드(database shard)

데이터베이스나 웹 검색 엔진의 데이터의 수평 분할이다. 개개의 파티션은 샤드(shard) 또는 데이터베이스 샤드(database shard)로 부른다. 각 샤드는 개개의 데이터베이스 서버 인스턴스에서 부하 분산을 위해 보유하고 있다.

### 데이터베이스 분할(Partitioning) 또는 파티셔닝

데이터베이스를 여러 부분으로 분할하는 것이다. 데이터베이스 분할은 중요한 튜닝기법으로 데이터가 너무 커져서, 조회하는 시간이 길어질 때 또는 관리 용이성, 성능, 가용성 등의 향상을 이유로 행해지는 것이 일반적이다. 분할된 각 부분을 ‘파티션’이라고 부른다.

