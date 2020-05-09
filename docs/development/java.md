---
layout: default
title: Java
parent: Development
date: 2020-03-11
---

## Java

- Uber-jar : Uber 는 독일어로 Over 라는 뜻임. 따라서 Uber-jar 는 Over Simple-jar 이다. 배포할 때 dependency lib 의 위치에 대해서 고민할 필요가 없으며 실행시 dependency 설정이 필요없다.
  - ref : https://stackoverflow.com/a/11947093

## Stream

컬렉션을 다룰 때 Stream 을 이용하면 로직 코드를 절약 할 수 있다.

- 리스트의 UserEntity 를 map 으로 변경 하는데 뒤에 있는 Entity 에 더 우선을 둔다.

```java
Map<String, UsrEntity> userMap = users.stream()
    .collect(Collectors.toMap(UsrEntity::id, Function.identity(), (a, b) -> b));
```

## `java.util.UUID`

랜덤한 ID 나 문자열을 만들어 낼 때 사용된다. `123e4567-e89b-12d3-a456-556642440000` 이런 값이 생성된다.
[baeldung java-uuid](https://www.baeldung.com/java-uuid)

    UUID.randomUUID().toString();   // 128 bit
    UUID.getLeastSignificantBits(); // 64 bit
    UUID.getMostSignificantBits();  // 64 bit

SHA-256 만들기

```java
MessageDigest salt = MessageDigest.getInstance("SHA-256");
salt.update(UUID.randomUUID().toString().getBytes("UTF-8"));
String digest = bytesToHex(salt.digest());
```

