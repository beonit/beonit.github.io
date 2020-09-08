---
layout: default
title: Java Internal
parent: Java
date: 2020-09-08
---

## Java HashMap (Treeify)

- Java Hashmap : bucket list 를 만들고, Bucket 에 Entry 를 담는다.
- Collision resolution > Separate chaining
  - Java 7 : LinkedList
  - Java 8
    - Treeify (LinkedList + RBTree) 해시 버킷의 아이템 수가 특정 임계 값을 초과하면, linked list를 balanced tree (RBTree) 로 바꾼다. 단, 테이블 사이즈가 64가 되지 않았으면 Treeify 를 하지 않는다
    - Treeify 시 약간의 오버 헤드가 발생하지만, 무시해도 될 수준이다.
    - 이터레이션 순서가 바뀔 수 있다. 애초에 HashMap 스펙은 이터레이션 순서를 보장하지 않는다. 단, LinkedHashMap 클래스의 이터레이션 순서는 유지된다.
- 참고
  - [The Secret Improvement of HashMap in Java 8](https://runzhuoli.me/2018/08/31/the-secret-improvement-of-hashmap-in-java8.html)
  - [Java HashMap internals](https://deepakvadgama.com/blog/java-hashmap-internals/)
  - [https://johngrib.github.io/wiki/java8-performance-improvement-for-hashmap/](https://johngrib.github.io/wiki/java8-performance-improvement-for-hashmap/)

## When does static class initialization happen

class's static initialization normally happens immediately before the first time one of the following events occur:

- an instance of the class is created,
- a static method of the class is invoked,
- a static field of the class is assigned,
- a non-constant static field is used, or

참고 : [When does static class initialization happen](https://stackoverflow.com/a/3499322)

## Class loading time

- `T` is a class and an instance of `T` is created.
- `T` is a class and a static method declared by `T` is invoked.
- A static field declared by `T` is assigned.
- A static field declared by `T` is used and the field is not a constant variable (§4.12.4).
- `T` is a top level class (§7.6), and an assert statement (§14.10) lexically nested within `T` (§8.1.3) is executed.

[JLS. JLS Chapter 12.4.1 When Initialization Occurs](http://docs.oracle.com/javase/specs/jls/se7/html/jls-12.html#jls-12.4.1)

## Types of nested class

inner class 는 outer 와 자동으로 연결되고 접근 권한을 갖는다. Collection 과 Iterator 의 관계

- Member Inner Class - non-static nested class, inner class 가 root set 이 되면 outer class 에 대한 참조가 남아 일종의 leak 처럼 될 수있다
- Anonymous Inner class - 인터페이스의 구현
- Local Inner class - method 내에서 사용하는 클래스

static nested class

- static 변수에 참조 가능, non-static 에 대해서 참조 불가능
- Map 과 Entry 관계
