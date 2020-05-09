---
layout: default
title: Unit Test
parent: Development
date: 2020-05-01
---


## Android

- Gradle test report html : `./[module]/build/reports/tests/testDebugUnitTest/index.html`

### Jacoco

- gradle jacocoTestReportDebug

### Robolectric

- Android framework 코드를 Intrument test 없이 테스트 하도록 도와주는 테스트 프레임워크

### Hamcrest matcher

- https://www.lesstif.com/java/hamcrest-junit-test-case-18219426.html

### Junit framework

- [differences between 2 JUnit Assert classes
](https://stackoverflow.com/a/291074)
  - JUnit 3.X: junit.framework.Assert
  - JUnit 4.X: org.junit.Assert
- JUnit 5.X: org.junit.jupiter.api
  - [JUnit-5-Intro](https://javacan.tistory.com/entry/JUnit-5-Intro)

### Groovy Spock Setup

- gradle

    ```groovy
    buildscript {
        dependencies {
            // Spock : https://github.com/groovy/groovy-android-gradle-plugin
            classpath 'org.codehaus.groovy:groovy-android-gradle-plugin:2.0.1'
        }
    }

    subprojects {
        apply plugin: 'groovyx.android'
    }

    dependencies {
        testImplementation 'org.codehaus.groovy:groovy-android-gradle-plugin:2.0.1'
        testImplementation 'org.spockframework:spock-core:1.1-groovy-2.4-rc-2'
    }
    ```

- simple test

    ```groovy
    package com.obplanner.data.converter
    import spock.lang.Specification
    import java.math.RoundingMode

    class SimpleSpock extends Specification {
        def "Simple test"() {
            given:
            BigDecimal price = BigDecimal.valueOf(495)
            when:
            BigDecimal boundPrice = price.setScale(-1, RoundingMode.HALF_UP)
            then:
            boundPrice == 500
        }
    }
    ```

### Groovy Trouble shooting

- [Accessing Kotlin companion object in Groovy](https://stackoverflow.com/a/44738645)
  - `TaskType.@Companion.fromInt(expect.type) == actual.type`

- Set final value
  
    ```groovy
    def field = AlarmEntity.class.getDeclaredField("type")
    field.setAccessible(true)
    field.set(expect, random.nextInt(12))
    ```

- Content value is always null
  - [test](https://stackoverflow.com/a/46489571)