---
layout: default
title: Overview
parent: Java
date: 2020-03-11
nav_order: 0
last_modified_date: 2020-06-05T13:58:07 KST
---

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Concept

### Immutable Object

불변객체는 내부 데이터를 변경할 수 없는 객체

- 장점
  - 객체에 대한 신뢰도가 높아진다. 객체가 한번 생성되어서 그게 변하지 않는다면 transaction 내에서 그 객체가 변하지 않기에 우리가 믿고 쓸 수 있기 때문
  - 생성자, 접근메소드에 대한 방어 복사가 불필요
  - 멀티스레드 환경에서 동기화 처리없이 객체를 공유 가능
- 단점
  - 객체가 가지는 값마다 새로운 객체가 필요. 따라서 메모리 누수와 새로운 객체를 계속 생성해야하기 때문에 성능저하 가능

## Convension

- Enum 의 entry 는 상수 이므로 대문자를 사용한다. [Because they are constants, the names of an enum type's fields are in uppercase letters.](https://docs.oracle.com/javase/tutorial/java/javaOO/enum.html)

## Java Utilities

### Stream

- 컬렉션을 다룰 때 Stream 을 이용하면 로직 코드를 절약 할 수 있다.
- 리스트의 UserEntity 를 map 으로 변경 하는데 뒤에 있는 Entity 에 더 우선을 둔다.

```java
Map<String, UsrEntity> userMap = users.stream()
        .collect(Collectors.toMap(UsrEntity::id, Function.identity(), (a, b) -> b));
```

### UUID

`java.util.UUID`

랜덤한 ID 나 문자열을 만들어 낼 때 사용된다. `123e4567-e89b-12d3-a456-556642440000` 이런 값이 생성된다.
[baeldung java-uuid](https://www.baeldung.com/java-uuid)

```java
UUID.randomUUID().toString();   // 128 bit
UUID.getLeastSignificantBits(); // 64 bit
UUID.getMostSignificantBits();  // 64 bit
```

### SHA-256

```java
MessageDigest salt = MessageDigest.getInstance("SHA-256");
salt.update(byteArr);
String digest = bytesToHex(salt.digest());
```

## Miscellaneous things

### Uber-jar

Uber 는 독일어로 Over 라는 뜻임. 따라서 Uber-jar 는 Over Simple-jar 이다. 배포할 때 dependency lib 의 위치에 대해서 고민할 필요가 없으며 실행시 dependency 설정이 필요없다. ([Stackoverflow](https://stackoverflow.com/a/11947093))

### Log level mapping

[How to map levels of java.util.logging and SLF4J logger?](https://stackoverflow.com/a/20807571)

```
ALL     -> TRACE
FINEST  -> TRACE
FINER   -> DEBUG
FINE    -> DEBUG
CONFIG  -> INFO
INFO    -> INFO
WARNING -> WARN
SEVERE  -> ERROR
OFF     -> ERROR
```

### Class file versions

[Java Class file General layout](https://en.wikipedia.org/wiki/Java_class_file#General_layout) - major version number of the class file

```
Java SE 14 = 58,
Java SE 13 = 57,
Java SE 12 = 56,
Java SE 11 = 55,
Java SE 10 = 54,
Java SE 9 = 53,
Java SE 8 = 52,
Java SE 7 = 51,
Java SE 6.0 = 50,
Java SE 5.0 = 49,
JDK 1.4 = 48,
JDK 1.3 = 47,
JDK 1.2 = 46,
JDK 1.1 = 45
```

## Concurency

"volatile" 은 Thread1에서 쓰고, Thread2에서 읽는 경우만 동시성을 보장합니다. 두개의 쓰레드에서 쓴다면 문제가 될 수 있습니다.