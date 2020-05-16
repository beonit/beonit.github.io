---
layout: default
title: spock
parent: Development
date: 2020-05-16
---

## 단위 테스트 프레임워크



### 여러개의 값 테스트

`where` 의 table 표현은 정말 최고다. 같은 로직에 대해서 파라미터만 달리하는 경계선 테스트를 할 때 혹은 전달인자의 오류가 값에 대해서 테스트할 때 이것보다 좋을 수 없다.
`@Unroll` 은 어느 값에서 이상이 있는지 확인수 있으니 좋다. 하지만 단위 테스트 갯수가 뻥튀기 되는 단점이 있다.
`input.each` 는 정말로 많은 값을 테스트할 때 좋았다.

```groovy
def "toHourMin"() {
    when:
        def actual = HourMinUtilsKt.toHourMin(hour, min)
    then:
        expect == actual
    where:
        hour | min || expect
        0    | 0   || 0
        0    | 59  || 59
        1    | 0   || 60
        1    | 59  || 119
        23   | 59  || 1439
        24   | 0   || 1440
        24   | 1   || 1441
        25   | 0   || 1500
}
```

```groovy
@Unroll
def "dateToDbInt multiple"() {
    given:
        def startDate = LocalDate.parse("2020-05-16")
        def startExpect = 18398
    when:
        def date = startDate.plusDays(i)
        def actual = DateUtilsKt.dateToDbInt(date.year, date.monthOfYear, date.dayOfMonth)
    then:
        startExpect + i == actual
    where:
        i << (1..100)
}
```

```groovy
def "dateToDbInt multiple"() {
    given:
        def startDate = LocalDate.parse("2018-01-01")
        def startExpect = 17532
    when:
        def input = (0..100000)
    then:
        input.each {
            def date = startDate.plusDays(it)
            def actual = DateUtilsKt.dateToDbInt(date.year, date.monthOfYear, date.dayOfMonth)
            assert startExpect + it == actual
        }
}
```
