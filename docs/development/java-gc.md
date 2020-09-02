---
layout: default
title: Java - Garbage Collector
parent: Development
date: 2020-09-02
---


## 정의

- heap 을 재활용 하기 위해서 root set 에서 참조되지 않는 object 를 가용한 공간을 만드는 작업
- Root set 의 Unreachable object 가 대상이 됨

1. Stack 참조 정보 : local variable, operand stack
2. Method area 에 로딩된 class 의 Constant Pool reference 정보
3. Native method 로 넘겨진 object reference

- GC 이론
  - 대부분의 객체는 금방 접근 불가능 상태(unreachable)가 된다.
  - 오래된 객체에서 젊은 객체로의 참조는 아주 적게 존재한다.

## Algorithms

- Reference counting
- mark-and-sweep
- mark-and-compacting algorithm
- copying algorithm
- generational algorithm
- Train algorithm

## Young GC

 Survivor 영역 중 하나는 반드시 비어 있는 상태다

처리 순서

1. 새로 생성한 대부분의 객체는 Eden 영역에 위치한다.
2. Eden 영역에서 GC가 한 번 발생한 후 살아남은 객체는 Survivor 영역 중 하나로 이동된다.
3. Eden 영역에서 GC가 발생하면 이미 살아남은 객체가 존재하는 Survivor 영역으로 객체가 계속 쌓인다.
4. 하나의 Survivor 영역이 가득 차게 되면 그 중에서 살아남은 객체를 다른 Survivor 영역으로 이동한다. 그리고 가득 찬 Survivor 영역은 아무 데이터도 없는 상태로 된다.
5. 이 과정을 반복하다가 계속해서 살아남아 있는 객체는 Old 영역으로 이동하게 된다.

## Old GC

- Serial GC : 1개 Thread 로 진행, mark-sweep-compact
- Parallel GC : 여러개 Thead 로 진행 world stop 을 줄인다
- Parallel Old GC

## CMS GC

![https://d2.naver.com/content/images/2015/06/helloworld-1329-5.png](https://d2.naver.com/content/images/2015/06/helloworld-1329-5.png)

절차

1. initial mark (SW) : 클래스 로더에서 가장 가까운 객체 중 살아 있는 객체만 찾음, 짧게 멈춤
2. concurrent mark 
3. remark (SW) : 새로 추가되거나 참조가 끊긴 객체를 확인
4. concurrent sweep

- 장점 : stop-the-world 시간이 매우 짧다. 응답 속도가 매우 중요할 때 사용
- 단점 : 메모리와 CPU를 더 많이 사용, Compaction 이 별도라서 Full GC 시간이 길어짐

## G1 GC

![https://johngrib.github.io/post-img/java-g1gc/g1gc-layout.png](https://johngrib.github.io/post-img/java-g1gc/g1gc-layout.png)

- 비어 있는 영역에만 새로운 객체가 들어간다.
- 쓰레기가 쌓여 꽉 찬 영역을 우선적으로 청소한다.
- 꽉 찬 영역에서 라이브 객체를 다른 영역으로 옮기고, 꽉 찬 영역은 깨끗하게 비운다.
- 이렇게 옮기는 과정이 조각 모음의 역할도 한다.
- 빨간색 : Eden
- 빨간색 S == Survivor : Eden이 꽉 차면 라이브 객체를 S로 옮기고 Eden 은 비워버림
- 파란색 : Old gen
- G1GC는 일시 정지 시간을 줄이기 위해 병렬로 GC 작업을 한다. 각각의 스레드가 자신만의 영역을 잡고 작업하는 방식.

### *Z Garbage Collector*

- ZGC는 대기 시간이 낮은 확장 가능한(scalable low latency) GC이다. ZGC는 모든 종류의 비싼 작업을 동시에(concurrently) 작업하며, 애플리케이션 스레드의 실행을 중지하지 않는다는 특징이 있다.
- ZGC는 10ms 미만의 짧은 대기 시간이 필요하거나 테라 바이트 큐모의 매우 큰 heap을 사용하는 애플리케이션을 위한 GC이다.

## 참고

- [Naver D2. Java Garbage Collection](https://d2.naver.com/helloworld/1329)
- [기계인간. Java HotSpot VM G1GC](https://johngrib.github.io/wiki/java-g1gc/)
- [기계인간. Java GC Tuning](https://johngrib.github.io/wiki/java-gc-tuning/)
- [기계인간. Java ZGC](https://johngrib.github.io/wiki/java-gc-zgc/)