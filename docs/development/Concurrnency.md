---
layout: default
title: Concurrency
parent: Development
date: 2020-09-02
---

## Atomic, CAS (compare-and-swap)

- Atomic class : CAS 를 이용하여 동시성을 보장. 여러 쓰레드에서 데이터를 write해도 문제가 없다.  
- CAS (compare-and-swap) : compareAndSet(expect, update)는 현재 값이 예상하는 값(expect)과 동일하다면 update 값으로 변경해주고 true를 리턴해 준다. 그렇지 않다면 데이터 변경은 없고 false를 리턴한다.
  - low-level atomic machine instruction (CAS) 을 사용해서 데이터 무결성을 보장한다.
  - [Java AtomicInteger.java](https://github.com/openjdk-mirror/jdk7u-jdk/blob/master/src/share/classes/java/util/concurrent/atomic/AtomicInteger.java)
  - Java Atomic Integer 는 Unsafe 클래스를 통해 CAS 를 사용함

### 참고

- [An Introduction to Atomic Variables in Java](https://www.baeldung.com/java-atomic-variables)
- [Compare-and-swap](https://en.wikipedia.org/wiki/Compare-and-swap)
