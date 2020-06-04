---
layout: default
title: Time
parent: Development
date: 2020-03-11
---

## LocalDateTime

## ISO Time format

## Epoch

Linux timestamp 라고도 불린다.  
epoch 는 현재 순간에서 모든 Timezone 에서 모두 같은 값 이다.  
간단한 단위 테스트 코드를 작성해서 테스트 해보자.

```kotlin
val utc = ZonedDateTime.now(ZoneOffset.UTC)
val kst = ZonedDateTime.now(ZoneOffset.ofHours(+9))
val ca = ZonedDateTime.now(ZoneOffset.ofHours(-8))

println(utc.format(DateTimeFormatter.ISO_DATE_TIME))
println(kst.format(DateTimeFormatter.ISO_DATE_TIME))
println(ca.format(DateTimeFormatter.ISO_DATE_TIME))

val systemMil = System.currentTimeMillis() / 1000L
val utcMil = ZonedDateTime.now(ZoneOffset.UTC).toInstant().toEpochMilli() / 1000L
val kstMil = ZonedDateTime.now(ZoneOffset.ofHours(+9)).toInstant().toEpochMilli() / 1000L
val caMil = ZonedDateTime.now(ZoneOffset.ofHours(-8)).toInstant().toEpochMilli() / 1000L

assertEquals(systemMil, utcMil)
assertEquals(systemMil, kstMil)
assertEquals(systemMil, caMil)

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
