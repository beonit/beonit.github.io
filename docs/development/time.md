---
layout: default
title: Time
parent: Development
date: 2020-03-11
last_modified_date: 2020-06-05T13:22:04 KST
---

## ISO 8601

Date and time in UTC

```
2020-06-05T02:50:21+00:00
2020-06-05T02:50:21Z
20200605T025021Z
```

week

```
2020-W23
```

week with weekday

```
2020-W23-5
```

## Epoch

Linux timestamp 라고도 불린다.  
epoch 는 현재 순간에서 모든 Timezone 에서 모두 같은 값 이다.  
간단한 단위 테스트 코드를 작성해서 테스트 해보자.

```kotlin
val utc = ZonedDateTime.now(ZoneOffset.UTC)
val kst = ZonedDateTime.now(ZoneOffset.ofHours(+9))
val ca = ZonedDateTime.now(ZoneOffset.ofHours(-8))

val systemMil = System.currentTimeMillis() / 1000L
val utcMil = utc.toInstant().toEpochMilli() / 1000L
val kstMil = kst.toInstant().toEpochMilli() / 1000L
val caMil = ca.toInstant().toEpochMilli() / 1000L

assertEquals(systemMil, utcMil)
assertEquals(systemMil, kstMil)
assertEquals(systemMil, caMil)

println(utc.format(DateTimeFormatter.ISO_DATE_TIME))
println(kst.format(DateTimeFormatter.ISO_DATE_TIME))
println(ca.format(DateTimeFormatter.ISO_DATE_TIME))

println(systemMil)
println(utcMil)
println(kstMil)
println(caMil)
```

```
2020-06-04T08:23:19.985131Z
2020-06-04T17:23:19.988248+09:00
2020-06-04T00:23:19.988271-08:00
1591258999
1591258999
1591258999
1591258999
```

## JSR-310

JSR-310 Java 1.8 부터 사용할 수 있다. 잘못 설계된 Calendar, Date 클래스를 대체한다. (Calendar 와 Date 는 Mutable 하다)  
1.7 이하에서 사용하기 위해서 [threeten](https://www.threeten.org/) 프로젝트가 있고, [ThreeTenABP](https://github.com/JakeWharton/ThreeTenABP) 에서 안드로이드를 백포트를 한다
