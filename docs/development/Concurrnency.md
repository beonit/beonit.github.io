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

## Synchronized/Asyncronize

- 동기 작업 - 작업을 수행하는 두 개 이상의 주체가 서로 동시에 수행하거나, 동시에 끝나거나, 끝나는 동시에 시작할 때
- 비동기 작업 - 두 주체가 서로의 시작, 종료시간과는 관계 없이 별도의 수행 시작/종료시간을 가지고 있을 때

## Blocking/Non Blocking

- 자신의 작업을 하다가 다른 작업 주체가 하는 작업의 시작부터 끝까지 기다렸다가 다시 자신의 작업을 시작한다면 이는 블로킹
- 다른 주체의 작업과 관계없이 자신의 작업을 계속한다면 이를 논블로킹이라고 할 수 있습니다.

### 동기/비동기와 블로킹/논블로킹의 조합

![https://blog.kakaocdn.net/dn/cBveNG/btqDY12Hdd0/j3UtHIiNTNgy7fzVoDELl1/img.png](https://blog.kakaocdn.net/dn/cBveNG/btqDY12Hdd0/j3UtHIiNTNgy7fzVoDELl1/img.png)

### 참고

- [An Introduction to Atomic Variables in Java](https://www.baeldung.com/java-atomic-variables)
- [Compare-and-swap](https://en.wikipedia.org/wiki/Compare-and-swap)
- [동기/비동기와 블로킹/논블로킹, DevEric](https://deveric.tistory.com/99)
